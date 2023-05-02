package city.olooe.handler;

import com.google.gson.Gson;

import city.olooe.domain.MemberVO;
import city.olooe.domain.NotificationVO;
import city.olooe.service.MemberService;
import city.olooe.service.NotificationService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.*;
import java.util.stream.Collectors;

@Log4j
public class NotificationHandler extends TextWebSocketHandler {
    private List<WebSocketSession> sessions = new ArrayList<>();

    @Autowired
    private NotificationService notiService;

    @Autowired
    private MemberService memberService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.warn("입장한 사람 : " + getIdBySession(session));
        sessions.add(session);

        log.info("현재 접속자 수 " + sessions.size());
        log.info("현재 접속자 정보");
        log.warn(sessions.stream().map(s -> getIdBySession(s)).collect(Collectors.toList()));
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("session " + getIdBySession(session));
        String msg = message.getPayload();
        log.warn("msg :: " + msg);
        
        if (!StringUtils.isEmpty(msg)) {
            String[] str = msg.split(",");

            String type = str[0]; // 알림 구분
            String sender = str[1]; // 알림 보낸 사람
            String receiver = str[2]; // 알림 받는 사람

            String content = "";// 채팅 내용
            if (type.equals("chat")) {
                content = str[3];
            }

            Map<String, Object> map = new HashMap<>();
            map.put("type", type);
            map.put("sender", sender);
            if (type.equals("clubRegister") || type.equals("chat")) {
                receiver = getIdByEmail(receiver);
            }
            map.put("receiver", receiver);
            map.put("chatContent", content);

            map.put("uncheckList", notiService.getUncheckedList(memberService.getEmail(map.get("receiver").toString()).getEmail()));

            Gson gson = new Gson();
            for(WebSocketSession s : sessions) {
                if(receiver.equals(getIdBySession(s)) || session == s) {
                    s.sendMessage(new TextMessage(gson.toJson(map)));
                }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.warn(session.getId() + "연결 종료");
        sessions.remove(session);
    }

    private String getIdBySession(WebSocketSession session) {
        MemberVO member = (MemberVO)session.getAttributes().get("member");
        String id = null;
        if(member != null) {
            id = member.getId();
        }
        return id;
    }

    private String getIdByEmail(String email) {
        MemberVO member = memberService.getEmail(email);
        String id = null;
        if (email != null) {
            id = member.getId();
        }
        return id;
    }
}

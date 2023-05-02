package city.olooe.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import city.olooe.domain.MemberVO;
import city.olooe.domain.MessageRoomVO;
import city.olooe.domain.MessageVO;
import city.olooe.mapper.MemberMapper;
import city.olooe.service.MemberService;
import city.olooe.service.MessageRoomService;
import city.olooe.service.MessageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
public class MessageHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private MemberService memberService;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.warn("입장한 사람 : " + getEmailBySession(session));
		sessions.add(session);
		
		log.info("현재 접속자 수 " + sessions.size());
		log.info("현재 접속자 정보");
		sessions.forEach(log::warn);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String receiver = message.getPayload();
		String senderEmail = getEmailBySession(session);
		
		
		List<MessageVO> chatList = messageService.chat(receiver, senderEmail);
		MessageVO get = messageService.get(chatList.get(chatList.size()-1).getMno());
		//List<MessageVO> uncheckedList = messageService.uncheckedList(receiver, senderEmail);
		MemberVO lastSender = memberService.getEmail(get.getSender());
		Boolean unCheck = get.getRdate() == null;
		MemberVO receiverVO = memberService.getEmail(receiver);
		
		log.warn(receiver);
		log.warn(lastSender);
		log.warn(senderEmail);
		log.warn(get);
//		-------------------------------------------------------------------------------------------------------
		Map<String, Object> map = new HashMap<>();
		map.put("receiver", receiver);
		map.put("receiverVO", receiverVO);
		map.put("senderEmail", senderEmail);
		map.put("lastSender", lastSender);
		map.put("get", get);
		map.put("unCheck", unCheck);
		map.put("room", get.getRoom());
		map.put("chat", chatList);
		//map.put("uncheckedList", uncheckedList);
				
		Gson gson = new Gson();
		for(WebSocketSession s : sessions) {
			if(receiver.equals(getEmailBySession(s)) || session == s) {
				s.sendMessage(new TextMessage(gson.toJson(map)));
			}
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.warn(session.getId() + "로그아웃");
		sessions.remove(session);	
	}
	
	private String getEmailBySession(WebSocketSession session) {
		MemberVO member = (MemberVO)session.getAttributes().get("member");
		String email = null;
		if(member != null && member instanceof MemberVO) {
			email = member.getEmail();
		}
		return email;
	}
	
	
	
}

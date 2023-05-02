package city.olooe.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import city.olooe.domain.ClubVO;
import city.olooe.domain.MemberVO;
import city.olooe.domain.MessageRoomVO;
import city.olooe.domain.MessageVO;
import city.olooe.mapper.MemberMapper;
import city.olooe.service.ClubService;
import city.olooe.service.MemberService;
import city.olooe.service.MemberServiceImpl;
import city.olooe.service.MessageRoomService;
import city.olooe.service.MessageService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("message/*")
@Data
@Log4j
public class MessageController {
	
	private final MessageService messageService;
	private final MessageRoomService messageRoomService;
	private MemberService memberService;
	private ClubService clubService;
	
	@GetMapping("direct")
	public void direct(){
	};
	
	@PostMapping("new") @ResponseBody
	public MessageVO send(@RequestBody MessageVO vo){
		
		MessageRoomVO mrvo = new MessageRoomVO();
		log.info(messageService.chat(vo.getReceiver(), vo.getSender()).size());
		 
		if(messageService.chat(vo.getReceiver(), vo.getSender()).size() == 0) {
			messageRoomService.register(mrvo);
			log.info("룸생성"+ mrvo);
			messageService.send(vo);
			log.info("메시지보내기" + vo);
			messageService.setRoom(mrvo.getMrno(), vo.getMno());
			log.info("룸등록" + vo);
		} 
		else { 
			messageService.send(vo);
			log.info("기존 룸 존재 -> 메시지보내기" + vo);
		}
		return vo;
	}
	
	@GetMapping("{receiver}/r/{sender}/s") @ResponseBody
	public List<MessageVO> chat(@PathVariable String receiver, @PathVariable String sender){
		List<MessageVO> chatlist = messageService.chat(receiver, sender);
		return chatlist;
	}
	
	@GetMapping("{room}") @ResponseBody
	public List<MessageVO> chatRoom(@PathVariable Long room){
		return messageService.chatOfRoom(room);
	}
	
	@GetMapping("{receiver}/{sender}/uncheck") @ResponseBody
	public List<MessageVO> uncheckedList(@PathVariable String receiver,@PathVariable Optional<String> sender){
		log.info(receiver);
		log.info(sender);
		return messageService.uncheckedList(receiver, sender.orElse(""));
	}
	
	@PutMapping("check/{mno}") @ResponseBody
	public Boolean receive(@PathVariable Long mno){
//		log.info(mno);
		return messageService.receive(mno);
	}
	
	@DeleteMapping("delete/{mno}") @ResponseBody
	public MessageVO remove(@PathVariable Long mno) {
		log.info(mno);
		MessageVO vo = messageService.get(mno);
		messageService.removeMessage(mno);
		return vo;
	}
	
	@DeleteMapping("removeRoom/{room}") @ResponseBody
	public Boolean removeRoom(@PathVariable Long room) {
		log.info(messageService.chatOfRoom(room));
		log.info(messageRoomService.get(room));
			
		return  messageService.removeRoom(room) && messageRoomService.delete(room);
	}
	
}

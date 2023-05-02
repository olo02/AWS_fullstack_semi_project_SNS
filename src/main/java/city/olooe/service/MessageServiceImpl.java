package city.olooe.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.MessageVO;
import city.olooe.mapper.MessageMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Service
@AllArgsConstructor
@ToString
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageMapper messageMapper;
	
	
	@Override
	public void send(MessageVO vo) {
		messageMapper.insert(vo);
	}
	
	@Override
	public boolean receive(Long mno) {
		return messageMapper.messageCheck(mno) > 0;
	}
	
	@Override
	public boolean setRoom(Long room, Long mno) {
		return messageMapper.setRoom(room, mno) > 0;
	}
	
	
	@Override
	public MessageVO get(Long mno) {
		return messageMapper.selectOne(mno);
	}
	
	@Override
	public List<MessageVO> chat(String receiver, String sender) {
		return messageMapper.chat(receiver, sender);
	}
	
	@Override
	public List<MessageVO> chatOfRoom(Long room) {
		return messageMapper.chatOfRoom(room);
	}
	
	@Override
	public List<MessageVO> uncheckedList(String receiver, String sender) {
		return messageMapper.uncheckedList(receiver, sender);
	}
	
	@Override
	public boolean removeMessage(Long mno) {
		return messageMapper.delete(mno) > 0;
	}
	
	@Override
	public boolean removeRoom(Long room) {
		return messageMapper.deleteRoom(room) > 0;
	}
}

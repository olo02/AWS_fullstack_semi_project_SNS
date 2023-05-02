package city.olooe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.MessageRoomVO;
import city.olooe.mapper.MessageRoomMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Service
@AllArgsConstructor
@ToString
public class MessageRoomServiceImpl implements MessageRoomService {

	@Autowired
	private MessageRoomMapper messageRoomMapper;
	
	@Override
	public MessageRoomVO get(Long mrno) {
		return messageRoomMapper.selectRoom(mrno);
	}
	
	@Override
	public void register(MessageRoomVO vo) {
		messageRoomMapper.insert(vo);
	}
	
	@Override
	public boolean update(MessageRoomVO vo) {
		return messageRoomMapper.update(vo) > 0;
	}
	
	@Override
	public boolean delete(Long mrno) {
		return messageRoomMapper.delete(mrno) > 0;
	}
	
}

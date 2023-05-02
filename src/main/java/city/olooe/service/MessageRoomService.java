package city.olooe.service;

import city.olooe.domain.MessageRoomVO;

public interface MessageRoomService {
	
	void register(MessageRoomVO vo);
	
	MessageRoomVO get(Long mrno);
	
	boolean update(MessageRoomVO vo);
	
	boolean delete(Long mrno);
	
	
}

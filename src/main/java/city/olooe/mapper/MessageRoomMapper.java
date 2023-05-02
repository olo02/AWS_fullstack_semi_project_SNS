package city.olooe.mapper;

import org.apache.ibatis.annotations.Param;

import city.olooe.domain.MessageRoomVO;

public interface MessageRoomMapper {
	
	void insert(MessageRoomVO vo);
	
	MessageRoomVO selectRoom(Long mrno);
	
	int delete(Long mrno);
	
	int update(MessageRoomVO vo);
	
}

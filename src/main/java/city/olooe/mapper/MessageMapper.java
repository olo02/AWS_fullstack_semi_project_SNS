package city.olooe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import city.olooe.domain.MessageVO;

public interface MessageMapper {
	
	void insert(MessageVO vo);
	
	MessageVO selectOne(Long mno);
	
	List<MessageVO> chat(@Param("receiver") String receiver, @Param("sender") String sender);
	
	List<MessageVO> chatOfRoom(Long room);
	
	List<MessageVO> uncheckedList(@Param("receiver") String receiver,@Param("sender") String sender);
	
    int delete(Long mno);
    
    int deleteRoom(Long room);
    
    int setRoom(@Param("room") Long room,@Param("mno") Long mno);

    int messageCheck(Long mno);

	void updateBySender(String email);

	void updateByReceiver(String email);

}

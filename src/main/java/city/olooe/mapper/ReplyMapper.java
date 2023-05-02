package city.olooe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import city.olooe.domain.ReplyLikeVO;
import city.olooe.domain.ReplyVO;

public interface ReplyMapper {
	int insert(ReplyVO vo);
	
	ReplyVO read(Long rno);
	
	List<ReplyVO> getList(@Param("bno") Long bno, @Param("rno") Long rno, @Param("id") String id); //rno가 null값인지 아닌지
	
	int update(ReplyVO vo);
	
	int delete(Long rno);
	
	int deleteByBno(Long bno); // 댓글이 있는 게시글도 삭제
	
	int deleteByBnoRlno(Long bno); // 좋아요 있는 댓글이 있는 게시글 삭제
	
	int deleteByRno(Long rno); // 좋아요 있는 댓글 삭제
	
	List<ReplyLikeVO> getLike(String id);
	
	int deleteByEmail(String email);
	
	int deleteLikeByEmail(String email);
	
	
	
	void insertLike(@Param("rno") Long rno, @Param("id") String id);
	
	int deleteLike(@Param("rno") Long rno, @Param("id") String id);
	
	ReplyLikeVO getReplyLike(@Param("rno") Long rno, @Param("id") String id);
}

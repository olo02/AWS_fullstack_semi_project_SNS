package city.olooe.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import city.olooe.domain.ReplyLikeVO;
import city.olooe.domain.ReplyVO;
import city.olooe.mapper.ReplyMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
@Transactional
public class ReplyServiceImpl implements ReplyService {
	private ReplyMapper replyMapper;
	
	@Override
	public int register(ReplyVO vo) {
		return replyMapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return replyMapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		replyMapper.deleteByRno(rno);
		return replyMapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public List<ReplyVO> getList(Long bno, Long rno, String id) {
		return replyMapper.getList(bno, rno, id);
	}

	@Override
	public int like(Long rno, String id) {
		ReplyLikeVO likeVO = replyMapper.getReplyLike(rno, id);
		if(likeVO == null) {
			replyMapper.insertLike(rno, id);
			return 1;
		}
		else {
			replyMapper.deleteLike(rno, id);
			return -1;
		}
	}


	@Override
	public List<ReplyLikeVO> getLikeList(String id) {
		return replyMapper.getLike(id);
	}
	

}
package city.olooe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.AttachVO;
import city.olooe.domain.BoardVO;
import city.olooe.domain.ClubVO;
import city.olooe.domain.Criteria;
import city.olooe.domain.MemberVO;
import city.olooe.mapper.AttachMapper;
import city.olooe.mapper.BoardMapper;
import city.olooe.mapper.ClubMapper;
import city.olooe.mapper.ClubMemberMapper;
import city.olooe.mapper.MemberMapper;
import city.olooe.mapper.NotificationMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@ToString
public class ClubServiceImpl implements ClubService {
	
	@Setter
	@Autowired
	private ClubMapper clubMapper;
	private AttachMapper attachMapper;
	private NotificationMapper notiMapper;
	
	@Override
	public void register(ClubVO vo) {
		clubMapper.insert(vo);
		Long cno = vo.getCno();
		List<AttachVO> attaches = vo.getAttaches();
		
		for(AttachVO attach : attaches) {
			attach.setCno(cno);
			attachMapper.insert(attach);
		}
	}
	
	@Override
	public ClubVO get(Long cno) {
		return clubMapper.read(cno);
	}
	
	@Override
	public List<ClubVO> getList() {
		return clubMapper.getList();
	}
	
	@Override
	public List<ClubVO> searchName(String keyword) {
		return clubMapper.searchName(keyword);
	}
	
	@Override
	public List<ClubVO> getMyClubList(String email) {
		return clubMapper.getMyClubList(email);
	}
	
	@Override
	public Boolean modify(ClubVO vo) {
		
		Long cno = vo.getCno();
		List<AttachVO> attaches = vo.getAttaches();

		if(attachMapper.findByCno(cno).size() == 0 || attaches.size() == 0){
			attachMapper.deleteByCno(cno);
			
			for(AttachVO attach : attaches) {
				attach.setCno(cno);
				attachMapper.insert(attach);
			}
		} else {
			for(AttachVO attach : attaches) {
				attach.setCno(cno);
				attachMapper.updateByCno(attach);
			}
		}
		
		return clubMapper.update(vo) > 0;
	}
	
	@Override
	public Boolean remove(Long cno) {
		notiMapper.deleteByCno(cno);
		attachMapper.deleteByCno(cno);
		return clubMapper.delete(cno) > 0;
	}
	
}

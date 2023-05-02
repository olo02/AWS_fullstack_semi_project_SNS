package city.olooe.service;

import java.util.List;

import city.olooe.domain.ClubVO;
import city.olooe.domain.Criteria;
import city.olooe.domain.MemberVO;

public interface ClubService {
	void register(ClubVO vo);
	ClubVO get(Long cno);
	Boolean modify(ClubVO vo);
	Boolean remove(Long cno);
	List<ClubVO> getList();
	List<ClubVO> getMyClubList(String email);
	List<ClubVO> searchName(String keyword);
}

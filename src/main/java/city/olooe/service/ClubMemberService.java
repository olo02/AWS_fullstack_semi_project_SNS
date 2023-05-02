package city.olooe.service;

import java.util.List;

import city.olooe.domain.ClubMemberVO;

public interface ClubMemberService {
	
	void register(String member, Long club, String answer);
	ClubMemberVO get(String member, Long club);
	List<ClubMemberVO> getList();
	List<ClubMemberVO> getClubList(Long club);
	List<ClubMemberVO> getMemberList(String member);
	boolean remove(String member, Long club);
	boolean removeMember(String member);
	boolean removeClub(Long club);
}

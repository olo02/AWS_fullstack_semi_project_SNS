package city.olooe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.ClubMemberVO;
import city.olooe.mapper.ClubMemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClubMemberServiceImpl implements ClubMemberService {
	
	@Autowired
	@Setter
	private ClubMemberMapper clubMemberMapper;
	
	@Override
	public void register(String member, Long club, String answer) {
		clubMemberMapper.insert(member, club, answer);
	}
	
	@Override
	public ClubMemberVO get(String member, Long club) {
		return clubMemberMapper.read(member, club);
	}
	
	@Override
	public List<ClubMemberVO> getList() {
		return clubMemberMapper.getList();
	}
	
	@Override
	public List<ClubMemberVO> getClubList(Long club) {
		return clubMemberMapper.getClubList(club);
	}
	
	@Override
	public List<ClubMemberVO> getMemberList(String member) {
		return clubMemberMapper.getMemberList(member);
	}
	
	@Override
	public boolean remove(String member, Long club) {
		return clubMemberMapper.delete(member, club) > 0;
	}
	
	@Override
	public boolean removeMember(String member) {
		return clubMemberMapper.deleteMember(member) > 0;
	}
	
	@Override
	public boolean removeClub(Long club) {
		return clubMemberMapper.deleteClub(club) > 0;
	}
}

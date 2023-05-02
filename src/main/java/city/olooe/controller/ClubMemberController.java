package city.olooe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import city.olooe.domain.BoardVO;
import city.olooe.domain.ClubMemberVO;
import city.olooe.domain.ClubVO;
import city.olooe.domain.MemberVO;
import city.olooe.service.BoardService;
import city.olooe.service.ClubMemberService;
import city.olooe.service.ClubService;
import city.olooe.service.MemberService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/clubmember/*")
@Data
public class ClubMemberController {

	private final ClubService clubService;
	private final ClubMemberService clubMemberService;
	private final BoardService boardService;
	
	@PostMapping("register")
	public ClubMemberVO register(String member, Long club, String answer) {
		clubMemberService.register(member, club, answer);
		ClubMemberVO vo = clubMemberService.get(member, club);
		return vo;
	}
	
	@GetMapping("getclublist/{club}") 
	public List<ClubMemberVO> get(@PathVariable Long club) {
		return clubMemberService.getClubList(club);
	}
	
	@GetMapping("get/{club}/{member}/m") 
	public ClubMemberVO get(@PathVariable String member, @PathVariable Long club, HttpServletRequest req) {
		return clubMemberService.get(member, club);
	}
	
	@DeleteMapping("delete/{member}/{club}")
	public ClubMemberVO delete(@PathVariable String member,@PathVariable Long club) {
		ClubMemberVO vo = clubMemberService.get(member, club);
		
		// 클럽멤버가 쓴 클럽글 모두 삭제
		List<BoardVO> list =  boardService.getAll(club, member);
		log.warn(list);
		for(BoardVO i : list){
			boardService.remove(i.getBno());
		}
		
		clubMemberService.remove(member, club);
		return vo;
	}
	
}

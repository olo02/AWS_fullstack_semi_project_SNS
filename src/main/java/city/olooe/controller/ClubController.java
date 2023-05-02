package city.olooe.controller;


import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import city.olooe.domain.AttachVO;
import city.olooe.domain.BoardVO;
import city.olooe.domain.ClubMemberVO;
import city.olooe.domain.ClubVO;
import city.olooe.domain.Criteria;
import city.olooe.domain.MemberVO;
import city.olooe.service.AttachService;
import city.olooe.service.BoardService;
import city.olooe.service.ClubMemberService;
import city.olooe.service.ClubService;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/club/*")
@Data
public class ClubController {

	private final ClubService clubService;
	private final BoardService boardService;
	private final ClubMemberService clubMemberService;
	private final AttachService attachService;
	
	@GetMapping("{clublist}") @ResponseBody
	public List<ClubVO> getList() {
		return clubService.getList();
	}
	
	@GetMapping("searchname/{keyword}") @ResponseBody
	public List<ClubVO> searchName(@PathVariable String keyword, HttpServletRequest req) {
		Criteria cri = new Criteria();
		req.setAttribute("cri", cri);
		cri.setKeyword(keyword);
		return clubService.searchName(keyword);
	}
	
	@GetMapping(value="myclublist/{email}/email") @ResponseBody
	public List<ClubVO> getMyClubList(@PathVariable String email, HttpServletRequest req){
		return clubService.getMyClubList(email);
	}
	
	@GetMapping("get/{cno}")
	public String get(@PathVariable Long cno, HttpServletRequest req) {
		ClubVO vo = clubService.get(cno);
		List<ClubMemberVO> clubmembers = clubMemberService.getClubList(cno);
		req.setAttribute("club", vo);
		req.setAttribute("clubmembers", clubmembers);
		return "/club/get";
	}
	
	@GetMapping("findBy/{cno}") @ResponseBody
	public ClubVO findBy(@PathVariable Long cno) {
		log.info(cno);
		return clubService.get(cno);
	}
	
	@PostMapping("{register}") @ResponseBody
	public ClubVO register(@RequestBody ClubVO vo) {
		log.info(vo);
		clubService.register(vo);
		return vo;
	}
	
	@DeleteMapping("{delete}/{cno}") @ResponseBody
	public ClubVO delete(@PathVariable Long cno) {
		// 반환값 지정
		ClubVO vo = clubService.get(cno);
		
		// 클럽의 모든 글 list
		List<BoardVO> list =  boardService.getAll(cno, null);
		log.warn(list);
		// 클럽 글 삭제
		for(BoardVO i : list){
			log.warn(i);
			log.warn(i.getBno());
			boardService.remove(i.getBno());
		}
		// 클럽 멤버 모두 삭제
		clubMemberService.removeClub(cno);
		// 클럽 삭제
		clubService.remove(cno);
		return vo;
	}
	
	@PutMapping("{update}/{cno}") @ResponseBody
	public ClubVO modify(@PathVariable Long cno, @RequestBody ClubVO vo) {
		clubService.modify(vo);
		log.info(vo);
		return vo;
	}
	
}
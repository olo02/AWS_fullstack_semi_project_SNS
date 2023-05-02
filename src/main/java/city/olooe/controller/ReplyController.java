package city.olooe.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import city.olooe.domain.MemberVO;
import city.olooe.domain.ReplyLikeVO;
import city.olooe.domain.ReplyVO;
import city.olooe.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("replies")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService replyService;
	
	@GetMapping({"list/{bno}", "list/{bno}/{rno}"})
	public List<ReplyVO> getList(@PathVariable Long bno, @PathVariable(required = false) Optional<Long> rno, HttpSession s) {
		log.info(bno);
		log.info(rno.orElse(0L));
		return replyService.getList(bno, rno.orElse(0L), ((MemberVO) s.getAttribute("member")).getEmail());
	}
	
	@PostMapping("new") // 4.5 테스트 완료
	public Long create(@RequestBody ReplyVO vo) {
		log.info(vo);
		replyService.register(vo);
		return vo.getRno();
	}
	
	@GetMapping("{rno}") // 4.5 테스트 완료
	public ReplyVO get(@PathVariable Long rno) {
		log.info(rno);
		return replyService.get(rno);
	}
	
	@DeleteMapping("{rno}") // 4.5 테스트 완료
	public int remove(@PathVariable Long rno) {
		log.info(rno);
		return replyService.remove(rno);
	}
	
	@PutMapping("{rno}") // 4.5 테스트 완료
	public int modify(@PathVariable Long rno, @RequestBody ReplyVO vo) {
		log.info(rno);
		log.info(vo);
		return replyService.modify(vo);
	}
	
	@GetMapping("like/{id}/{rno}") @ResponseBody
	public int like(@PathVariable Long rno, @PathVariable String id) {
		return replyService.like(rno, id);
	}
	
//	@DeleteMapping("unlike/{id}/{rno}") @ResponseBody
//	public int unlike(@PathVariable Long rno, @PathVariable String id) {
//		return replyService.unlike(rno, id);
//	}
	
	@GetMapping("getLike/{id}") @ResponseBody
	public List<ReplyLikeVO> getLikeList(@PathVariable String id) {
		return replyService.getLikeList(id);
	}
	
}

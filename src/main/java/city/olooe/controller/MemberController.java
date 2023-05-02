package city.olooe.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.CookieGenerator;

import city.olooe.domain.BoardLikeVO;
import city.olooe.domain.BoardVO;
import city.olooe.domain.ClubVO;
import city.olooe.domain.MemberVO;
import city.olooe.domain.ReplyLikeVO;
import city.olooe.domain.ReplyVO;
import city.olooe.mapper.ReplyMapper;
import city.olooe.service.BoardService;
import city.olooe.service.ClubMemberService;
import city.olooe.service.ClubService;
import city.olooe.service.FriendService;
import city.olooe.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("member/")
//@Data
@AllArgsConstructor
@Log4j
public class MemberController {

	/*
	 * 04.06 ~ 04.07
	 * 김민수
	 * 로그인, 회원가입 컨트롤러 구현
	 * 
	 * 04.10 
	 * 로그아웃 구현, id 중복검사, 이메일 인증번호 전송구현 시작
	 * 
	 * 04.11
	 * 이메일 인증번호 전송 구현완료
	 * 
	 * 04.11 
	 * 자동로그인 구현진행
	 * 
	 * 04.12
	 * 자동로그인 구현진행
	 * 
	 * 04.13 
	 * 비밀번호 암호화 작업
	 * 
	 * 04.14
	 * 자동로그인 구현완료, 로그아웃시 쿠키삭제 완료
	 * 
	 * 04.15 ~ 04.18 
	 * 아이디찾기 테스트완료, 비밀번호찾기 : 임시비밀번호 전송 및 암호화후 디비저장 완료, 회원가입 유효성검사
	 * 
	 * 04.19
	 * 회원검색기능 진행
	 * 
	 * 04.20 ~ 21 
	 * 비밀번호 수정 구현, 회원정보 수정 구현, 아이디찾기 구현 
	 * 
	 * 04.22 ~ 24 
	 * 회원가입, 로그인 유효성검사 수정 및 추가, 프로필 수정, 회원탈퇴 진행
	 * 04.25 
	 * 회원정보 수정시 세션에 저장
	 */
	
	
	@Autowired
	private MemberService memberservice;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ClubService clubService;
	@Autowired
	private ClubMemberService clubMemberService;
	@Autowired
	private FriendService friendService;
	
	// 메일
	@Autowired
	private JavaMailSender mailSender;
	
	// 암호화 변수 
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	//500 에러 페이지 이동
	@GetMapping("500_page")
	public String errorPage() {
		return "member/500_page";
	}
	//회원가입 페이지 이동
	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}
	// 로그인 페이지 
	@GetMapping("login")
	public String login(HttpServletRequest req){
		return "member/login";
	}
	// 비밀번호 수정 페이지
	@GetMapping("modifyPw")
	public String modifyPw(){
		return "member/modifyPw";
	}
	
	@GetMapping("get/{id}")
	@ResponseBody
	public MemberVO get(@PathVariable String id) throws Exception{
		return memberservice.getId(id);
	}
	
	@GetMapping("get/{email}/email")
	@ResponseBody
	public MemberVO getEmail(@PathVariable String email) {
		return memberservice.getEmail(email);
	}
	
	@GetMapping("getList")
	@ResponseBody
	public List<MemberVO> getList() throws Exception{
		return memberservice.getList();
	}

	/*
	 * 자동로그인 흐름 
	 * session login 객체 / loginCookie  / 결과 
	 * 		  x			/ 		x 	   / 비로그인 1번 
	 * 		  o 	   /		x	  /  로그인상태(접속), 자동로그인을 체크하지 않음 2번
	 * 		  x 	  /			o	 / 	 이전에 로그인한적 있음 3번
	 * 		  o		 / 			o	/  로그인상태(접속), 자동로그인 체크 4번
	 * 
	 * 자동로그인이 필요한 상황은 3번 session login 객체가 보관되어 있지 않지만 loginCookie가 존재 
	 * 
	 * 저장해야할 것 : id, 자동로그인 여부 
	 * 저장할 곳 : cookie
	 * 
	 * 로그인 성공 시 remember - me 여부 
	 */
	// (필터) -> 디스패쳐 서블릿 ->(인터셉트) -> 컨트롤러 -> 뷰리졸버(object)-> 
	// 로그인 & 자동 로그인 진행
	@RequestMapping(value="login", method=RequestMethod.POST)
	//@PostMapping("login")
	public String loginPOST(HttpServletRequest req, MemberVO vo, RedirectAttributes rttr, HttpServletResponse rsp,@RequestParam(value = "auto_login", defaultValue = "false") boolean auto_login
			)throws Exception{
		HttpSession session = req.getSession();

		MemberVO lvo = memberservice.login(vo);
		
		if(lvo != null)  {
			session.setAttribute("member", lvo); // session 정보저장
			
			if(!auto_login ) {
				log.info("자동로그인 체크 안하고 로그인 했을때 기존 자동로그인 쿠키삭제 진행");
				CookieGenerator cookieGenerator = new CookieGenerator();
				cookieGenerator.setCookieName("email");
		    	cookieGenerator.setCookieMaxAge(0);
		    	cookieGenerator.setCookiePath("/");
		    	cookieGenerator.removeCookie(rsp);
			}
			
			else {
				log.info("자동로그인 진행");
				// 쿠키생성 
				log.info(lvo);
				Cookie loginCookie = new Cookie("email", lvo.getEmail());
				
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				// 쿠키 전송 
				rsp.addCookie(loginCookie);
			}
			 return "redirect:/board/feed";
		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
	}
	
	// 회원가입 
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String joinPOST(MemberVO vo, HttpServletRequest req) throws Exception{
//		req.setAttribute("mailCheck", vo);

		
		memberservice.register(vo);
		
		return "redirect:/member/login";
		
	}
	
	// 이메일 중복 검사 
    @RequestMapping(value="memberIdChk", method=RequestMethod.POST)
    @ResponseBody
    public String idCheckPost(String email) throws Exception{
    	int result = memberservice.idCheck(email);
    	if(result != 0) {
    		return "fail"; 
    	}else {
    		return "success";
    	}
    }
    // 닉네임 중복 검사 
    @RequestMapping(value="memberNickdChk", method=RequestMethod.POST)
    @ResponseBody
    public String nickCheckPost(String id) throws Exception{
    	int result = memberservice.nickCheck(id);
    	if(result != 0) {
    		return "fail"; 
    	}else {
    		return "success";
    	}
    }
    
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logoutGet(HttpServletRequest request, HttpServletResponse rsp) throws Exception{
    	log.info("로그아웃 메서드 진행");
    	
    	HttpSession session = request.getSession();
    	
    	// 자동로그인 했을시에 로그아웃 하면 쿠키 삭제해주는 것 
    	CookieGenerator cookieGenerator = new CookieGenerator();
    	cookieGenerator.setCookieName("email");
    	cookieGenerator.setCookieMaxAge(0);
    	cookieGenerator.setCookiePath("/");
    	cookieGenerator.removeCookie(rsp);
    	
    	session.invalidate();
    	
    	return "redirect:/member/login";
    }
    
    /* 이메일 인증 */
    @RequestMapping(value="mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 시작");
        log.info("이메일 : " + email);     
        
        // 인증번호 랜덤 
        Random random = new Random();
        // int checkNum = random.nextInt(888888) + 111111;
        String randomStr = random.ints(97,123).limit(9)
        		.collect(StringBuilder::new, StringBuilder::appendCodePoint,StringBuilder::append)
        		.toString();
        log.info("랜덤 인증번호 " + randomStr);
        
        /* 이메일 보내기 */
        String setFrom = "damsotest@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "인증번호는" + randomStr + "입니다";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String rStr = randomStr.toString();
        return rStr;
    }

    
    // 비밀번호 임시발급 및 재설정
    @RequestMapping(value="findPw", method=RequestMethod.GET)
    public void findPwGet() throws Exception{}

    @RequestMapping(value="findPw", method=RequestMethod.POST)
    public String findPwPost(@ModelAttribute MemberVO vo, HttpServletResponse rsp, String email) throws Exception{
    	
    	Random random = new Random();
    	 String randomStr = random.ints(97,123).limit(9)
         		.collect(StringBuilder::new, StringBuilder::appendCodePoint,StringBuilder::append)
         		.toString();
    	
        /* 이메일 보내기 */
        String setFrom = "damsotest@gmail.com";
        String toMail = email;
        String title = "[담소] 임시비밀번호 입니다";
        String content = "임시비밀번호는" + randomStr + "입니다. 보안을 위해 꼭 재설정을 해주세요";
        
        vo.setPw(pwEncoder.encode(randomStr)); // 기존 비밀번호 데이터
        memberservice.findPw(vo);
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String rStr = randomStr.toString();
        return rStr;
    }
    
    // 회원검색 기능
    @GetMapping("searchMember/{id}") @ResponseBody
	public List<MemberVO> searchName(@PathVariable String id, HttpServletRequest req) {
    	MemberVO vo = new MemberVO();
    	req.setAttribute("vo", vo);
    	vo.setId(id);
		return memberservice.searchName(id);
	}
    
    // 검색후 프로필 진입
	@GetMapping("profile/{email}/damso")
	public String profile(@PathVariable @ModelAttribute String email, HttpServletRequest req) throws Exception {
		MemberVO vo = memberservice.getEmail(email);
		log.info(email);
		req.setAttribute("profileEmail", vo);
		return "member/profile";
	}
    
    // 회원수정
    @PutMapping("profile/{email}/damso")@ResponseBody
    public MemberVO modify(@PathVariable String email, @RequestBody MemberVO vo, HttpServletRequest req,
    		HttpSession session, Model model) {
    	 vo.setEmail(email);
    	 
    	 memberservice.modify(vo);
    	 log.info(vo);
    	 
    	 MemberVO currentUser = (MemberVO) session.getAttribute("member");
    	 log.info("currentUser : " + currentUser);
    	 if(currentUser.getEmail().equals(vo.getEmail())){
    		 currentUser.setId(vo.getId());
    		 log.info(currentUser.getId());
    		 currentUser.setName(vo.getName());
    		 currentUser.setIntro(vo.getIntro());
    	 }
    	 
    	 return vo;
    }
    
    // 비밀번호 변경 
    @PostMapping("modifyPw")
    public String pwChange( MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
    	log.info("비밀번호 변경 진행");
    	log.info("vo : " + vo);
    	
    	memberservice.modifyPw(vo);
    	session.invalidate();
    	
    	return "redirect:/member/login";
    }
    
    // 아이디 찾기
    @GetMapping("findId")
    public String findId(HttpServletRequest req, MemberVO vo, Model model) {
    	return "/member/findId";
    }
    @RequestMapping(value="findId_result")
    public String search_result_id(HttpServletRequest request, Model model, 
    		@RequestParam(required=true, value="id") String id,
    		@RequestParam(required=true, value="name") String name, MemberVO vo) throws Exception {
    	
    	try {
	    	vo.setId(id);
	    	vo.setName(name);
	    	MemberVO vo1 = memberservice.selectId(vo);
	    	
	    	model.addAttribute("vo", vo1);
    	}catch(Exception e) {
    		System.out.println(e.toString());
    		model.addAttribute("msg","오류가 발생되었습니다");
    	}
	    
    	return "/member/findId_result";
    }
    @GetMapping("deleteMember")
    public String deleteMember(HttpServletRequest req, MemberVO vo, Model model, HttpSession session) {
    	if(session.getAttribute("member") != null) {
    		return "/member/deleteMember";
    	}else {
    		return "redirect:/member/login";
    	}
    }
    // 회원탈퇴
    @RequestMapping(value="deleteMember", method = RequestMethod.DELETE)
    @ResponseBody
    public String memberdelete(String email, HttpSession session, RedirectAttributes rttr) {

    	MemberVO currentUser = (MemberVO) session.getAttribute("member");
   
    	memberservice.memberDelete(currentUser.getEmail());
    	session.invalidate();
    	
    	return "redirect:/member/login";
    }
    
}

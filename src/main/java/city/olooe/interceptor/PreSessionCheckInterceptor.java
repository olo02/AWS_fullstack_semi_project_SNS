package city.olooe.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import city.olooe.domain.MemberVO;
import city.olooe.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
public class PreSessionCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private MemberService memberService;
	
	public boolean preHandle(HttpServletRequest req, HttpServletResponse rsp, Object handler) throws Exception{
		Cookie cookie = WebUtils.getCookie(req, "email");
		if(cookie != null) {
			String email = cookie.getValue();
			log.warn(email);
			MemberVO vo = memberService.getEmail(email);
			log.warn(vo);
			if(vo != null ) {
				req.getSession().setAttribute("member", vo);
			}		
		}
		return true;
	}
}

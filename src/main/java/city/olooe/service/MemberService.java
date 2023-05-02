package city.olooe.service;

import java.util.List;

import city.olooe.domain.MemberVO;

public interface MemberService {
	/*
	 * 04.04 
	 * 김민수 
	 * 로그인,회원가입 
	 */
	
	List<MemberVO> getList()throws Exception;
	
	// 이메일 조회 
	MemberVO getId(String id);
	MemberVO getEmail(String email);
	
		
	// 회원가입 
	void register(MemberVO vo)  throws Exception;
	
	// 로그인 
	MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디, 이메일 중복 검사 
	public int idCheck(String email) throws Exception;
	public int nickCheck(String id) throws Exception;
	
	// 아이디 찾기
	MemberVO selectId(MemberVO vo) throws Exception;
	
	// 비밀번호 임시발급 및 재설정
	public void findPw(MemberVO vo) throws Exception;
	
	// 회원검색 조회
	List<MemberVO> searchName(String id);
	
	// 회원수정
	int modify(MemberVO vo);
	
	// 비밀번호 변경 
	void modifyPw(MemberVO vo);
	
	// 회원탈퇴
	void memberDelete(String email);
	
}

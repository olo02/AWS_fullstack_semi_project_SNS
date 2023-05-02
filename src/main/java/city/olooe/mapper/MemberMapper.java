package city.olooe.mapper;

import java.util.List;

import city.olooe.domain.MemberVO;

public interface MemberMapper {
	/*
	 * 04.04
	 * 김민수 
	 * 로그인, 회원가입
	 */
	
	List<MemberVO> getList();
	
	// 아이디 조회
	MemberVO get(String id);
	// 이메일 조회
	MemberVO getEmail(String email);
	
	// 로그인 
	MemberVO selectOne(MemberVO vo);
	
	// 회원가입
	void register(MemberVO vo);
	
    // 아이디,이메일 중복검사 
    int idCheck(String email);
    int nickCheck(String id);
    
    // 아이디찾기 
    MemberVO findId(MemberVO vo);
    
    // 비밀번호 임시발급 
    void updatePw(MemberVO vo);
    MemberVO readmember(String id, String name);
    
    // 회원 검색
    List<MemberVO> searchName(String id);
    
    // 회원수정
    int memberUpdate(MemberVO vo);
    
    // 비밀번호 변경
    void changePw(MemberVO vo);
    
    // 회원탈퇴
    void deleteMember(String email);
    
	
}

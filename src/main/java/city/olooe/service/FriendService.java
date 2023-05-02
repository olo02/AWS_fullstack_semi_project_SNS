package city.olooe.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import city.olooe.domain.FriendVO;
/**
 * 
 * @author 강태수
 * 
 * 4/5일
 * follow(), unfollow() 차단 생성
 * 
 * 4/6일 
 * 팔로워 목록 팔로잉 목록 생성
 * 
 * 4/10일
 * selectFriend() 생성
 * 
 * 4/12일
 * 팔로워 목록 팔로잉 목록 List -> List<Map 으로 수정
 * 
 * 4/15 List<Map<String, Object>> selectFriend 수정 
 * boolean -> List<Map<String, Object>> 으로변경
 * 
 * 4/17 
 * followCount,followerCount 생성 
 * 
 * 4/18
 * unfollowing 추가
 * 
 * 4/21
 * check 추가
 * 
 * 4/21
 * select 추가 
 * 
 * 4/24
 * unfollowing 삭제
 */

public interface FriendService {
	
	//친구 추가
	void follow(FriendVO vo);
	void delete(String email);
	
	
	
	//언팔로우
	void unfollow(String following, String followed);

	

	
	//친구 차단 
	//void block(Long fno);
	
	//팔로워 목록
	
	List<Map<String, Object>> getFollowers(String following);
	
	//팔로잉 목록
	
	List<Map<String, Object>> getFollowings(String followed);
	
	//맞팔체크
 //   boolean selectFriend(String following, String followed);
	
//	public List<Map<String, Object>> selectFriend(String following); 
	public List<Map<String, Object>> selectFriend(String following, String followed); 
	
	public List<Map<String, Object>> select(String following, String followed); 
     
    
    int followCount(String email);
    int followerCount(String email);

    
     public Map<String, Object> check( String following, String followed);


    

}

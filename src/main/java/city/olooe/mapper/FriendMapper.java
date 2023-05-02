package city.olooe.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import city.olooe.domain.FriendVO;
import city.olooe.domain.MemberVO;
/**
 * 
 * @author 강태수
 * 4/5일 생성
 * 
 * 4/12일 팔로워 목록 팔로잉 목록 수정 
 * 
 * 4/18
 * unfollowing 추가
 * 
 * 4/21
 * select 추가 
 * 
 * 4/21
 * check 추가
 * 
 * 4/24
 * unfollowing 삭제
 */
public interface FriendMapper {
	// 친구 추가
     void insert(FriendVO vo);
     

    // 친구 삭제
    public void  delete(String email);

  //친구 차단
  	public void block(@Param("fno") Long fno, @Param("email") String email);
    
  	// 차단 목록 조회
  	public List<String> selectBlockedList(String email);
    
  //팔로워 목록
  
  	public List<Map<String, Object>> getFollowers(String following);
  	
  	//팔로잉 목록

  	public List<Map<String, Object>> getFollowings(String followed);
  	//언팔로우
  	public void unfollow(@Param("following") String following, @Param("followed") String followed);
  	
  	
  	//언팔로잉
  //	public void unfollowing(@Param("followed") String following, @Param("following") String followed);
  	
  	List<Map<String, Object>> selectFriend(@Param("following") String following, @Param("followed") String followed);
  
  	List<Map<String, Object>> select(@Param("following") String following, @Param("followed") String followed);
	
	
	// 일반조회
	public List<String> notFriend(String email);
	
	// 내가 팔로우한 사람의 수
	int followCount(String email);
	
	// 나를 팔로우한 사람의 수
	int followerCount(String email);
	
	Map<String, Object> check(@Param("following") String following, @Param("followed") String followed);
	
	

}

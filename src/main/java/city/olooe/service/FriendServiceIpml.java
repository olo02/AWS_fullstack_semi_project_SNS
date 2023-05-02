package city.olooe.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.FriendVO;
import city.olooe.mapper.FriendMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 강태수
 * 
 * 4/5일 생성
 * 
 * 4/6 친구삭제 친구목록 추가 및 팔로우 언팔로우 수정
 * 
 * 4/10 일 맞팔로우 생성 
 * 
 * 4/12 일 getFollowers, getFollowings 수정
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
 * 4/21
 * select 추가 
 * 
 * 4/24
 * unfollowing 삭제
 */

@Log4j
@Service
@AllArgsConstructor
public class FriendServiceIpml implements FriendService {
    @Setter
    @Autowired
	private FriendMapper friendMapper;
	
	@Override
	public void follow(FriendVO vo) {
		friendMapper.insert(vo); 
		
	}
	
	@Override
	public void unfollow(String following, String followed) {
		 friendMapper.unfollow(following, followed);
		
	}


	@Override
	public List<Map<String, Object>> getFollowers(String following) {
	
		return friendMapper.getFollowers(following);
	}

	@Override
	public List<Map<String, Object>> getFollowings(String followed) {
		// TODO Auto-generated method stub
		return friendMapper.getFollowings(followed);
	}
	@Override
	public List<Map<String, Object>> selectFriend(String following, String followed) {
		// TODO Auto-generated method stub
		return friendMapper.selectFriend(following, followed);
	}
	@Override
	public List<Map<String, Object>> select(String following, String followed) {
		// TODO Auto-generated method stub
		return  friendMapper.select(following, followed);
	}
	

	@Override
	public int followCount(String email) {
		// TODO Auto-generated method stub
		return friendMapper.followCount(email);
	}

	@Override
	public int followerCount(String email) {
		// TODO Auto-generated method stub
		return friendMapper.followerCount(email);
	}

	@Override
	public Map<String, Object> check(String following, String followed) {
		// TODO Auto-generated method stub
		return friendMapper.check(following, followed);
	}

	@Override
	public void delete(String email) {
		 friendMapper.delete(email);
		
	}


}

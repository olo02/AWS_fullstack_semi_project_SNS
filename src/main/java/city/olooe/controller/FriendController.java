package city.olooe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import city.olooe.domain.FriendVO;
import city.olooe.service.FriendService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 
 * 
 * @author 강태수
 * 4/10일 
 * follow, unfollow, getFollowers, getFollowings, selectFriend 생성 및 테스트 
 *
 * 4/11일
 * getFollowings,getFollowings, unfollow(post->get) 수정 테스트 통과
 *
 * 4/12일
 * getFollowings,getFollowings 수정
 * 
 * 4/15 
 * selectFiend 수정
 * boolean -> List<Map<String, Object>> 수정 
 * 
 * 4/17 
 * followCount,followerCount 생성 테스트 통과
 * 
 * 4/18
 * unfollowing 추가 테스트 성공
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

@RequestMapping("/friend")
@Controller
@Log4j
@AllArgsConstructor
public class FriendController {
	private FriendService friendService;


	//팔로우   4/10일 통과
	@PostMapping(value = "/follow", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FriendVO follow(@RequestBody FriendVO vo) {
	    log.info("follow : " + vo);
 
	    friendService.follow(vo);

	    return vo;
	}
	
	
//	// 언팔로우 1    4/10일 통과
//	@PostMapping("/unfollow/{following}/{followed}")
//	@ResponseBody
//	public String unfollow(@PathVariable("following") String following, @PathVariable("followed") String followed) {
//	    friendService.unfollow(following, followed);
//	    return "redirect:/followers/" + followed;
//	}
	// 언팔로우 1    4/12일 수정 테스트 통과
 	@DeleteMapping("/unfollow/{following}/{followed}" )  //get -> delete로 변경
	@ResponseBody
	public String unfollow(@PathVariable("following") String following, @PathVariable("followed") String followed) {
	    friendService.unfollow(following, followed);
	    return followed;
	}
 	
 	
	
	// 언팔로우 2
//	@DeleteMapping(value = "/unfollow/{following}/{followed}", produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public Map<String, String> unfollow(@PathVariable("following") String following, @PathVariable("followed") String followed) {
//	    friendService.unfollow(following, followed);
//	    Map<String, String> result = new HashMap<>();
//	    result.put("status", "success");
//	    return result;
//	}

    // 팔로워 목록
	@GetMapping(value="/followers", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String, Object>> getFollowers(@RequestParam("following") String following) {
	    List<Map<String, Object>> followers = friendService.getFollowers(following);
	    return followers;
	}
    // 팔로우 목록
	@GetMapping(value = "/followings", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String, Object>> getFollowings(@RequestParam("followed") String followed) {
	    List<Map<String, Object>> followings = friendService.getFollowings(followed);
	    return followings;
	}
	
	// 맞팔 체크 4/10일 통과
//	@GetMapping(value = "/selectFriend", produces = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseBody
//    public boolean selectFriend(@RequestParam("following") String following, @RequestParam("followed") String followed) {
//        return friendService.selectFriend(following, followed);
//    }
	// 맞팔로우 체크 4/15 수정
	@GetMapping(value = "/selectFriend", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  List<Map<String, Object>> selectFriend(@RequestParam("following") String following, @RequestParam("followed") String followed) {
        return friendService.selectFriend(following,followed);
    }
	@GetMapping(value = "/select", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  List<Map<String, Object>> select(@RequestParam("following") String following, @RequestParam("followed") String followed) {
        return friendService.select(following,followed);
    }
	// 나를 팔로우하고있는 사람숫자
	@GetMapping("/{email}/followCount")
	@ResponseBody
    public ResponseEntity<Integer> getFollowingCount(@PathVariable("email") String email) {
        int followingCount = friendService.followCount(email);
        return ResponseEntity.ok(followingCount);
    }
	// 내가 팔로우하고있는 사람숫자
    @GetMapping("/{email}/followerCount")
    @ResponseBody
    public ResponseEntity<Integer> getFollowerCount(@PathVariable("email") String email) {
        int followerCount = friendService.followerCount(email);
        return ResponseEntity.ok(followerCount);
    }
    // 내가 상대를 팔로우 했는지 단독체크
    @GetMapping(value= "/check", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> check(String following, String followed){
    	return	friendService.check(following, followed);
    	 
    	
    }

}

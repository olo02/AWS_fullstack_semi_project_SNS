package city.olooe.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * 
 * @author 강태수
 * 4.4일생성
 * fno, following, followed 생성
 * 
 * 4/12일 생성 follower ,followingMember 
 *
 * 4/16일 followe , followigMember, fno 제거
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("friend")
public class FriendVO {

	private String following;    // fk
    private String followed;     // fk


	

}

package city.olooe.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("clubMember")
public class ClubMemberVO {

	private String member;
	private Long club;
	private Date regdate;
	private String answer;
}

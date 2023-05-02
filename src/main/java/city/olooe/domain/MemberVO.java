package city.olooe.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("member")
public class MemberVO {
	private String email;
	private String pw;
	private String name;
	private String id;
	private String intro;
	private String tel;
	private String addr;
	private Date regdate;
	
    private List<AttachVO> attaches = new ArrayList<>();
	
	// 자동로그인
	private String session_key;
	private Date session_limit;
}

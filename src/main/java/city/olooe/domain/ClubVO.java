package city.olooe.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("club")
public class ClubVO {
	private Long cno;
	private String cname;
	private String intro;
	private String cleader;
	private String town;
	private boolean status;
	private Date regdate;
	private String question;
	private int membercnt;
	
    private List<AttachVO> attaches = new ArrayList<>();

}

package city.olooe.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reply") 
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String content;
	private String writer;
	private String writeremail;
	private Date regdate;
	private Date updatedate;
	
	private int likecnt;
	private Boolean likeOn;
	
    private List<AttachVO> attaches = new ArrayList<>();
}

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
@Alias("message")
public class MessageVO {
	private Long mno;
	private String receiver;
	private String sender;
	private String message;
	private Date sdate;
	private Date rdate;
	private Long room;
	
    private List<AttachVO> rattaches = new ArrayList<>();
    private List<AttachVO> sattaches = new ArrayList<>();

}

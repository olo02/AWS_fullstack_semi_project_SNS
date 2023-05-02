package city.olooe.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("replyLike")
public class ReplyLikeVO {
	private Long rlno;
	private Long rno;
	private String id;
}

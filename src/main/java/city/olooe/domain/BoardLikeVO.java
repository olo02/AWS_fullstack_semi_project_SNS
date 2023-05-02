package city.olooe.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("boardLike")
public class BoardLikeVO {
    private Long lno;
    private Long bno;
    private String id;
    private Date regdate;
}

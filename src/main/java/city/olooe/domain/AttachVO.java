package city.olooe.domain;

import lombok.Data;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Data
@ToString(callSuper = true)
@Alias("attach")
public class AttachVO extends AttachFileDTO{
    private Long bno;
    private Long cno;
    private String email;
    private String url;
}

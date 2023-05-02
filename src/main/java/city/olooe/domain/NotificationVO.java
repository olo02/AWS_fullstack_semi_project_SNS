package city.olooe.domain;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data @Alias("notification")
public class NotificationVO {
    private Long nno;
    private String sender;
    private String senderEmail;
    private String receiver;
    private String type;
    private Date sdate;
    private Date rdate;
    private Long bno;
    private Long cno;
}

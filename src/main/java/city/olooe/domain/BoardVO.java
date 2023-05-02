package city.olooe.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("board")
public class BoardVO {
    private Long bno;
    private String title;
    private String content;
    private String writer;
    private String writeremail;
    private Date regdate;
    private Date updatedate;
    private Long hitcount;
    private Long category;
    private int replycnt;
    private int likecnt;
    private Boolean likeOn;

    private List<AttachVO> attaches = new ArrayList<>();
    private List<AttachVO> writerattaches = new ArrayList<>();
//
//    public List<AttachVO> getAttaches() {
//        return attaches;
//    }
//
//    public void setAttaches(List<AttachVO> attaches) {
//        this.attaches = attaches;
//    }
}

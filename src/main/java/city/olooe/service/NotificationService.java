package city.olooe.service;

import java.util.List;

import city.olooe.domain.BoardVO;
import city.olooe.domain.NotificationVO;

public interface NotificationService {
    void register(NotificationVO vo);
    int update(Long nno);
//    int noticnt(String email);
    List<NotificationVO> getUncheckedList(String email);
    int removeByBno(Long bno);
}

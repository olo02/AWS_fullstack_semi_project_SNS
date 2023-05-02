package city.olooe.mapper;

import java.util.List;

import city.olooe.domain.NotificationVO;

public interface NotificationMapper {
    void insert(NotificationVO vo);
    int update(Long nno);
    int noticnt(String email);
    List<NotificationVO> uncheckedList(String email);
    int deleteByBno(Long bno);
    int deleteByCno(Long cno);
    int deleteByEmail(String email);
}

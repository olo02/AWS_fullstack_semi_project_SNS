package city.olooe.service;

import city.olooe.domain.NotificationVO;
import city.olooe.mapper.NotificationMapper;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
@ToString
public class NotificationServiceImpl implements NotificationService {
    @Autowired
    private NotificationMapper notiMapper;

    @Override
    public void register(NotificationVO vo) {
        notiMapper.insert(vo);
    }

    @Override
    public int update(Long nno) {
        return notiMapper.update(nno);
    }

//    @Override
//    public int noticnt(String email) {
//        return notiMapper.noticnt(email);
//    }

    @Override
    public List<NotificationVO> getUncheckedList(String email) {
        return notiMapper.uncheckedList(email);
    }

    @Override
    public int removeByBno(Long bno) {
        return notiMapper.deleteByBno(bno);
    }
}

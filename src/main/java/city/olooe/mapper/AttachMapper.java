package city.olooe.mapper;

import java.util.List;

import city.olooe.domain.AttachFileDTO;
import city.olooe.domain.AttachVO;

public interface AttachMapper {
    void insert(AttachVO vo);
    
    void updateByEmail(AttachVO vo);
    void updateByCno(AttachVO vo);
       
    List<AttachFileDTO> findBy(Long bno);
    List<AttachFileDTO> findByCno(Long cno);
    List<AttachFileDTO> findByEmail(String email);

    void delete(String uuid);
    void deleteByBno(Long bno);
    void deleteByCno(Long cno);
    void deleteByEmail(String email);
    void deleteBAByEmail(String email);
}

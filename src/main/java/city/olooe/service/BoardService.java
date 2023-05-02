package city.olooe.service;

import java.util.List;

import city.olooe.domain.AttachFileDTO;
import city.olooe.domain.BoardLikeVO;
import city.olooe.domain.BoardVO;

public interface BoardService {
    void register(BoardVO vo);
    BoardVO get(Long bno, String id);
    int modify(BoardVO vo);
    int remove(Long bno);
    List<BoardVO> getList(Long bno, Long category, String email, String id);
    List<BoardVO> getAll(Long category, String email);
    void like(Long bno, String id);
    int unlike(Long bno, String id);
    String deleteFile(AttachFileDTO dto);
}

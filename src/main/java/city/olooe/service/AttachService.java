package city.olooe.service;

import city.olooe.domain.AttachVO;

public interface AttachService {
	void register(AttachVO vo);
	void deleteAttachByBoard(Long bno);
	void deleteAttachByClub(Long cno);
	void deleteAttachByMember(String email);
}

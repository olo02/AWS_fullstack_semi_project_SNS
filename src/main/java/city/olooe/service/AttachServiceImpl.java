package city.olooe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import city.olooe.domain.AttachVO;
import city.olooe.mapper.AttachMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@ToString
public class AttachServiceImpl implements AttachService {

	@Autowired
	@Setter
	private AttachMapper attachMapper;
	
	@Override
	public void register(AttachVO vo) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void deleteAttachByBoard(Long bno) {
		attachMapper.deleteByBno(bno);
	}
	@Override
	public void deleteAttachByClub(Long cno) {
		attachMapper.deleteByCno(cno);
	}
	@Override
	public void deleteAttachByMember(String email) {
		attachMapper.deleteByEmail(email);
	}
}

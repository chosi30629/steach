package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.Attend;
import kr.co.steach.repository.mapper.AttendMapper;



@Service
public class AttendServiceImpl implements AttendService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private AttendMapper mapper;

	@Override
	public void insertattend() {
		mapper.insertattend();
	}

	@Override
	public Attend attendStatus(Attend attend) {
		return mapper.attendStatus(attend);
	}

	@Override
	public void attendOn(Attend attend) {
		mapper.attendOn(attend);
		
	}

	@Override
	public void attendearlyOff(Attend attend) {
		mapper.attendearlyOff(attend);
		
	}

	@Override
	public void attendOff(Attend attend) {
		mapper.attendOff(attend);
	}

	@Override
	public List<Attend> attendlistTeacher(Attend attend) {
		return mapper.attendlistTeacher(attend);
	}

	@Override
	public List<Attend> attendlistStudent(Attend attend) {
		return mapper.attendlistStudent(attend);
	}

	
	

	

} // end class

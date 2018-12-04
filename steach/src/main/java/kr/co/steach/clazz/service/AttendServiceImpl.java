package kr.co.steach.clazz.service;

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
	public Attend attendStatus(String id) {
		return mapper.attendStatus(id);
	}

	
	

	

} // end class

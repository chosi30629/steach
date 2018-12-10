package kr.co.steach.clazz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Attend attendStudentContent(Attend attend) {
		return mapper.attendStudentContent(attend);
	}

	@Override
	public Map<String, Object> attendTeacherContent(Attend attend) {
		Map<String,Object> map = new HashMap<>();
		// 지각리스트
		map.put("atlate", mapper.attendTeacherLate(attend));
		// 조퇴리스트
		map.put("atearly", mapper.attendTeacherEarly(attend));
		// 결석리스트
		map.put("atoff", mapper.attendTeacherOff(attend));
		
		return map;
	}

	// 차트 데이터
	@Override
	public List<Attend> attendchart(Attend attend) {
		return mapper.attendchart(attend);
	}

	// 일일 전체출석부
	@Override
	public List<Attend> attendDailyDetail(Attend attend) {
		return mapper.attendDailyDetail(attend);
	}


	
	

	

} // end class

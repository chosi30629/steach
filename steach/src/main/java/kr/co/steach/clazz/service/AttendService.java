package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.Attend;

public interface AttendService {

	void insertattend();
	
	Attend attendStatus(Attend attend);
	
	// 출석
	void attendOn(Attend attend);
	// 조퇴
	void attendearlyOff(Attend attend);
	// 퇴실
	void attendOff(Attend attend);
	
	// 강사가 보는 출석부
	List<Attend> attendlistTeacher(Attend attend);

	// 학생이 보는 출석부
	List<Attend> attendlistStudent(Attend attend);
}

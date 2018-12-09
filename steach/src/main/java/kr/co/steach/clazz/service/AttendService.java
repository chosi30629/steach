package kr.co.steach.clazz.service;

import java.util.List;
import java.util.Map;

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

	// 학생 일별 출석내용
	Attend attendStudentContent(Attend attend);

	// 강사 일별 출석내용-지각/조퇴/결석
	Map<String,Object> attendTeacherContent(Attend attend);

	// 강사 월별 차트
	List<Attend> attendchart(Attend attend);
}

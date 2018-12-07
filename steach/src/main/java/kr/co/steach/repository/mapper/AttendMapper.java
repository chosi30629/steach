package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.Attend;

public interface AttendMapper {
	
	// 명단 및 날짜 batch
	void insertattend();
	
	// 출석여부확인 출석/퇴실버튼분류
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
	// 강사 일별 출석내용-지각
	List<Attend> attendTeacherLate(Attend attend);
	// 강사 일별 출석내용-조퇴
	List<Attend> attendTeacherEarly(Attend attend);
	// 강사 일별 출석내용-결석
	List<Attend> attendTeacherOff(Attend attend);
}

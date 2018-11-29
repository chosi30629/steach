package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.ClassSchedule;

public interface CurriculumMapper {
	
	
	List<ClassSchedule> selectSchByClassNo(int classNo);

	
	void insertSchedule(ClassSchedule classSchedule);
	
	void deleteSchedule(int id);
	
	
	/* 기간 변경하기 */
	void updateScheduleDate(ClassSchedule classSchedule);
}

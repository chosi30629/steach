package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.ClassSchedule;

public interface CurriculumMapper {
	
	
	List<ClassSchedule> selectSchByClassNo(int classNo);
	
}

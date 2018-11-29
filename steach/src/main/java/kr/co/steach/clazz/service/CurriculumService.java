package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.ClassSchedule;

public interface CurriculumService {
	
	
	/* 클래스별 스케줄 불러오기*/
	List<ClassSchedule> selectSchByClassNo(int classNo);
}

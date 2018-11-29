package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.ClassSchedule;
import kr.co.steach.repository.mapper.CurriculumMapper;

@Controller
public class CurriculumServiceImpl implements CurriculumService {
	
	@Autowired
	CurriculumMapper mapper;
	
	
	@Override
	public List<ClassSchedule> selectSchByClassNo(int classNo) {
		return mapper.selectSchByClassNo(classNo);
	}


	@Override
	public void insertSchedule(ClassSchedule classSchedule) {
		mapper.insertSchedule(classSchedule);
	}
	
	
}

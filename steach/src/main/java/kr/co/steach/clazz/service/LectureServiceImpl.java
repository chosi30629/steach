package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.mapper.LectureBoardMapper;

@Controller
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	LectureBoardMapper mapper;
	
/*	@Override
	public List<LectureBoard> selectBoardByClassNo(int classNo) {
		List<LectureBoard> list = mapper.selectBoardByClassNo(classNo);
		return mapper.selectBoardByClassNo(classNo);
	}*/

	@Override
	public List<Lecture> selectLectureByClassNo(int classNo) {
		return mapper.selectLectureByClassNo(classNo);
	}

	@Override
	public List<LectureBoard> selectLectureBoardByClassNo(int classNo) {
		return mapper.selectLectureBoardByClassNo(classNo);
	}
	
}

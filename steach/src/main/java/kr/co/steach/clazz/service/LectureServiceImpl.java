package kr.co.steach.clazz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.mapper.ClassMapper;
import kr.co.steach.repository.mapper.LectureBoardMapper;

@Controller
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	LectureBoardMapper mapper;
	//ClassMapper cMapper;
	
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

	@Override
	public Map<String,Object> selectLectureListByClassNo(int classNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("subjectList", mapper.selectLectureByClassNo(classNo));
		map.put("boardList", mapper.selectLectureBoardByClassNo(classNo));
		return map;
	}

	@Override
	public void insertLecture(Lecture lecture) {
		mapper.insertLecture(lecture);	
	}

	

/*	@Override
	public Clazz selectClassbyClassNo(int classNo) {
		System.out.println("impl");
		return cMapper.selectClassbyClassNo(classNo);
	}*/
	
	
	
	
}

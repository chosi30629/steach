package kr.co.steach.clazz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.Homework;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
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

/*	@Override
	public List<Lecture> selectLectureByClassNo(int classNo) {
		return mapper.selectLectureByClassNo(classNo);
	}

	@Override
	public List<LectureBoard> selectLectureBoardByClassNo(int classNo) {
		return mapper.selectLectureBoardByClassNo(classNo);
	}*/

	@Override
	public Map<String,Object> selectLectureListByClassNo(int classNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("subjectList", mapper.selectLectureByClassNo(classNo));
		map.put("boardList", mapper.selectLectureBoardByClassNo(classNo));
		
		System.out.println(mapper.selectLectureBoardByClassNo(classNo));
		return map;
	}
	/*	@Override
	public Clazz selectClassbyClassNo(int classNo) {
		System.out.println("impl");
		return cMapper.selectClassbyClassNo(classNo);
	}*/
	
	@Override
	public void insertLecture(Lecture lecture) {
		mapper.insertLecture(lecture);	
	}

	@Override
	public void updateLectureSubject(Lecture lecture) {
		mapper.updateLectureSubject(lecture);
	}

	@Override
	public void deleteLecture(int lecNo) {
		mapper.deleteLecture(lecNo);
		
	}

	@Override
	public void insertLectureBoard(LectureBoard lectureBoard) {
		mapper.insertLectureBoard(lectureBoard);
	}

	@Override
	public void deleteLectureBoard(int boardNo) {
		mapper.deleteLectureBoard(boardNo);
	}

	@Override
	public LectureBoard selectLectureBoardByBNo(int boardNo) {
		return mapper.selectLectureBoardByBNo(boardNo);
	}
 
	@Override
	public List<LectureBoard> selectHomeworkByCNo(int classNo) {
		return mapper.selectHomeworkByCNo(classNo);
	}

	@Override
	public List<Homework> selectSubmitHomeworkByCNo(int classNo) {
		return mapper.selectSubmitHomeworkByCNo(classNo);
	}

	@Override
	public List<LectureBoard> selectHomework(int classNo) {
		List<LectureBoard> boardList = mapper.selectHomeworkByCNo(classNo);

		Map<String, Object> param = new HashMap<>();
		param.put("classNo", classNo);
		for (LectureBoard board : boardList) {
			param.put("boardNo", board.getBoardNo());
			board.setHomework(mapper.selectAllHomeworkByCNo(param));
		}

		return boardList;
	}

	


	
	
	
}

package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;

public interface LectureBoardMapper {
	
	List<LectureBoard> selectBoardByClassNo(int classNo);
	
	
	/* classNo별 주제 */
	List<Lecture>selectLectureByClassNo(int classNo);
	
	
	List<LectureBoard> selectLectureBoardByClassNo(int classNo);
}

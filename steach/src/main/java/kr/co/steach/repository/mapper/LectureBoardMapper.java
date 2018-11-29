package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;

public interface LectureBoardMapper {
	
	List<LectureBoard> selectBoardByClassNo(int classNo);
	
	
	/* classNo별 주제 */
	List<Lecture>selectLectureByClassNo(int classNo);
	
	
	List<LectureBoard> selectLectureBoardByClassNo(int classNo);
	
	
	/* insert lecture */
	void insertLecture(Lecture lecture);
	
	
	/* update lecture subject */
	void updateLectureSubject(Lecture lecture);
	
	/* delete lecture subject */
	void deleteLecture(int lecNo);
	
	/* insert lecture board */
	void insertLectureBoard(LectureBoard lectureBoard);
	
	/* delete lecture board */
	void deleteLectureBoard(int boardNo);
	
	/* select board by no */
	LectureBoard selectLectureBoardByBNo(int boardNo);
	
	/* update lecture board */
	void updateLectureBoard(LectureBoard lectureBoard);
	
}
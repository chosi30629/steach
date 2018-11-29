package kr.co.steach.clazz.service;

import java.util.List;
import java.util.Map;

import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;

public interface LectureService {
	/*List<LectureBoard> selectBoardByClassNo(int classNo);*/

	List<Lecture> selectLectureByClassNo(int classNo);
	
	List<LectureBoard>selectLectureBoardByClassNo(int classNo);
	
	Map<String,Object> selectLectureListByClassNo(int classNo);
	
/*	
	//test 
	
	Clazz selectClassbyClassNo(int classNo);*/
	
	/* insertLecture */
	
	void insertLecture(Lecture lecture);
	
	/* update lecture */
	void updateLectureSubject(Lecture lecture);
	
	/* delete lecture */
	
    void deleteLecture(int lecNo);
    
    /* insert lecture board */
    void insertLectureBoard(LectureBoard lectureBoard);
    
    
    /* delete lecture board */
    void deleteLectureBoard(int boardNo);
    
    /* select lecture board by bno */
    LectureBoard selectLectureBoardByBNo(int boardNo);
}

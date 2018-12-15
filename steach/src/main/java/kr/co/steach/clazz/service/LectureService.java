package kr.co.steach.clazz.service;

import java.util.List;
import java.util.Map;

import kr.co.steach.repository.domain.BoardUploadFileVO;
import kr.co.steach.repository.domain.CounterVO;
import kr.co.steach.repository.domain.Homework;
import kr.co.steach.repository.domain.HomeworkFileVO;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.domain.VoteList;
import kr.co.steach.repository.domain.VoteResult;

public interface LectureService {
	/*List<LectureBoard> selectBoardByClassNo(int classNo);*/

/*	List<Lecture> selectLectureByClassNo(int classNo);
	
	List<LectureBoard>selectLectureBoardByClassNo(int classNo);*/
	
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
    
    
    /* select homework by classNo */
    List<LectureBoard> selectHomeworkByCNo(int classNo);
    
    /*제출자 내역 리스트  ~~ */
    List<Homework> selectSubmitHomeworkByCNo(int classNo);

    List<LectureBoard> selectHomework(int classNo);
    
    /* vote list insert */
    void insertVoteList(VoteList voteList);
    
    /* 투표하기 */
    void insertVote(VoteResult voteResult);
    
    /*board별 투표 확인하기 */
    List<CounterVO> selectVoteResultCountByBNo(int boardNo);
 
    void insertBoardFile(BoardUploadFileVO BUFV);
    
    /*insert homework */
    void insertHomework(Homework homework);
    
    /*insert Homework File */
    void insertHomeworkFile(BoardUploadFileVO BUFV);
    
    
    List<HomeworkFileVO> selectHomeworkFileByCNo(int classNo);
    
}

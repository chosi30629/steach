package kr.co.steach.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.steach.repository.domain.CounterVO;
import kr.co.steach.repository.domain.Homework;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.domain.VoteList;

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
	
	
	/* select homework by classNo */
	List<LectureBoard>selectHomeworkByCNo(int classNo);
	
	
	/* select homework by classNo*/
	List<Homework> selectSubmitHomeworkByCNo(int classNo);

	List<Homework> selectAllHomeworkByCNo(Map<String, Object> param);
	
	
	/* select vote list by cNo */
	List<VoteList> selectVoteListByCNo(int classNo);
	
	List<CounterVO> selectVoteCntByCNo(int classNo);
	
	
	/* insert vote list */
	
	void insertVoteList(VoteList voteList);
	
}

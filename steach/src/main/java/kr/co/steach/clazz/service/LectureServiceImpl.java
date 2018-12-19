package kr.co.steach.clazz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.BoardFileVO;
import kr.co.steach.repository.domain.BoardUploadFileVO;
import kr.co.steach.repository.domain.CounterVO;
import kr.co.steach.repository.domain.Homework;
import kr.co.steach.repository.domain.HomeworkFileVO;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.domain.VoteList;
import kr.co.steach.repository.domain.VoteResult;
import kr.co.steach.repository.mapper.LectureBoardMapper;

@Controller
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	LectureBoardMapper mapper;

	@Override
	public Map<String,Object> selectLectureListByClassNo(int classNo) {
		Map<String,Object> map = new HashMap<>();
		//주제 list 
		map.put("subjectList", mapper.selectLectureByClassNo(classNo));
		
		//게시글 list 
		map.put("boardList", mapper.selectLectureBoardByClassNo(classNo));
		
		//hw count 
		map.put("hwCount",mapper.selectHWCountByCNo(classNo));
		
		//투표 list 
		map.put("voteList", mapper.selectVoteListByCNo(classNo));
		//투표 count 
		map.put("voteCount", mapper.selectVoteCntByCNo(classNo));
		
		//투표자 명단 list 
		map.put("voteResult",mapper.selectVoteResultByCNo(classNo));
		
		//upload file list
		map.put("fileList",mapper.selectUploadFilesByCNo(classNo));
		
		map.put("alarmList",mapper.selectEarlyDeadlineBoard(classNo));
		return map;
	}
	
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

	@Override
	public void insertVoteList(VoteList voteList) {
		mapper.insertVoteList(voteList);
		
	}

	@Override
	public void insertVote(VoteResult voteResult) {
		mapper.insertVote(voteResult);
	}

	@Override
	public List<CounterVO> selectVoteResultCountByBNo(int boardNo) {
		return mapper.selectVoteResultCountByBNo(boardNo);
	}

	@Override
	public void insertBoardFile(BoardUploadFileVO bufv) {
		mapper.insertBoardFile(bufv);
	}

	@Override
	public void insertHomework(Homework homework) {
		mapper.insertHomework(homework);
	}

	@Override
	public void insertHomeworkFile(BoardUploadFileVO bufv) {
		mapper.insertHomeworkFile(bufv);
	}

	@Override
	public List<HomeworkFileVO> selectHomeworkFileByCNo(int classNo) {
		return mapper.selectHomeworkFileByCNo(classNo);
	}

	@Override
	public void updateMemCntbyCNo(int classNo) {
		mapper.updateMemCntbyCNo(classNo);
	}

}

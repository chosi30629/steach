package kr.co.steach.clazz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.repository.domain.CounterVO;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.domain.VoteList;
import kr.co.steach.repository.domain.VoteListInsert;
import kr.co.steach.repository.domain.VoteResult;

@Controller
@RequestMapping("/class/lecture")
public class LectureController {
	
	@Autowired
	LectureService service;
	
	@Autowired
	ClazzService classService;
	
	@RequestMapping("/lecture.do")
	public void list(int classNo, Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		
		
		//model.addAttribute("list",service.selectBoardByClassNo(classNo));
		//List<LectureBoard> list = service.selectBoardByClassNo(classNo);
		//System.out.println(list);
		
		/* 주제 가져오기 */
	/*	List<Lecture> subjectList = service.selectLectureByClassNo(classNo);
		 주제별 데이터 가져오기 
		List<LectureBoard> boardList = service.selectLectureBoardByClassNo(classNo);*/
		
		//System.out.println(boardList);
		
		//model.addAttribute("subjectList",service.selectLectureByClassNo(classNo));
		//model.addAttribute("boardList",service.selectLectureBoardByClassNo(classNo));

	//	model.addAttribute("list",service.selectLectureListByClassNo(classNo));
		
	
/*		//test
		model.addAttribute("classInfo",service.selectClassbyClassNo(classNo));
		Clazz clz = service.selectClassbyClassNo(classNo);
		System.out.println(clz);*/
	}
	
	/* ajax List */
	@RequestMapping("/lectureList.do")
	@ResponseBody
	public Map<String,Object> lectureList(int classNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", service.selectLectureListByClassNo(classNo));
		return map;
	} 
	
	
	/* insert lecture */
	@RequestMapping("/insertLecture.do")
	@ResponseBody
	public void insertLecture(Lecture lecture ) {
		service.insertLecture(lecture);
	}
	
	
	/* 주제명 변경 */
	@RequestMapping("/updateSubject.do")
	@ResponseBody
	public void updateLectureSubject(Lecture lecture) {
		service.updateLectureSubject(lecture);
	}
	
	@RequestMapping("/deleteLecture.do")
	@ResponseBody
	public void deleteSubject(int lecNo) {
		service.deleteLecture(lecNo);
	}
	
	
	/* lecture Board insert */
	
	@RequestMapping("/insertLectureBoard.do")
	@ResponseBody
	public String insertLectureBoard(LectureBoard lectureBoard,MultipartFile attach) {
		/* file 첨부 구현하기 */
		//System.out.println(attach);
		//System.out.println("param:"+lectureBoard);
		System.out.println(lectureBoard);
		service.insertLectureBoard(lectureBoard);
		
		return lectureBoard.getBoardNo()+"";
	}
	
	
	@RequestMapping("/deleteLecutreBoard.do")
	@ResponseBody
	public void deleteLectureBoard(int boardNo) {
		service.deleteLectureBoard(boardNo);
	}
	
	@RequestMapping("/selectLectureBoardByBNo.do")
	@ResponseBody
	public LectureBoard selectLectureBoardByBNo(int boardNo) {
		LectureBoard b = service.selectLectureBoardByBNo(boardNo);
		
		System.out.println(b);
		return service.selectLectureBoardByBNo(boardNo);
	}
	
	
	/* vote insert */
	@RequestMapping("/insertVoteList.do")
	@ResponseBody
	public void insertVoteList(VoteListInsert vli) {
		//service.insertVoteList(vli);	
		VoteList vl = new VoteList();
		for(int i=0;i<vli.getBoardNo().length;i++) {
			vl.setBoardNo(vli.getBoardNo()[i]);
			vl.setSelectNo(vli.getSelectNo()[i]);
			vl.setSelectName(vli.getSelectName()[i]);

			service.insertVoteList(vl);
		}
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/homework.do")
	public void hwList(int classNo,Model model) {
					
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		model.addAttribute("subject",service.selectHomeworkByCNo(classNo));
		model.addAttribute("homework",service.selectHomework(classNo));
		//		model.addAttribute("submit",service.selectSubmitHomeworkByCNo(classNo));
	}

//	@RequestMapping("/homework.do")
//	public void hwList(@RequestParam(value="classNo",defaultValue="1")int classNo,Model model) {
//		System.out.println("homeworkTitle:"+service.selectHomeworkByCNo(classNo));
//		System.out.println("homeworkDetail:"+service.selectSubmitHomeworkByCNo(classNo));
//		model.addAttribute("homework",service.selectHomeworkByCNo(classNo));
//		model.addAttribute("submit",service.selectSubmitHomeworkByCNo(classNo));
//	}
	

	
	@RequestMapping("/insertVote.do")
	@ResponseBody
	public void insertVote(VoteResult voteResult) {
		service.insertVote(voteResult);
	}
	
	/*vote 결과 확인하기 */
	@RequestMapping("/voteResult.do")
	@ResponseBody
	public List<CounterVO> selectVoteResultCountByBNo(int boardNo) {
		return service.selectVoteResultCountByBNo(boardNo);
	}
}

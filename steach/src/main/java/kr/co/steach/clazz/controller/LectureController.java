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

import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;

@Controller
@RequestMapping("/class/lecture")
public class LectureController {
	
	@Autowired
	LectureService service;
	
	@RequestMapping("/lecture.do")
	public void list(@RequestParam(value="classNo",defaultValue="1")int classNo,Model model) {
		//model.addAttribute("list",service.selectBoardByClassNo(classNo));
		//List<LectureBoard> list = service.selectBoardByClassNo(classNo);
		//System.out.println(list);
		
		/* 주제 가져오기 */
		List<Lecture> subjectList = service.selectLectureByClassNo(classNo);
		/* 주제별 데이터 가져오기 */
		List<LectureBoard> boardList = service.selectLectureBoardByClassNo(classNo);
		
		//System.out.println(boardList);
		
		//model.addAttribute("subjectList",service.selectLectureByClassNo(classNo));
		//model.addAttribute("boardList",service.selectLectureBoardByClassNo(classNo));
		
		model.addAttribute("list",service.selectLectureListByClassNo(classNo));
/*		//test
		model.addAttribute("classInfo",service.selectClassbyClassNo(classNo));
		Clazz clz = service.selectClassbyClassNo(classNo);
		System.out.println(clz);*/
	}
	
	/* ajax List */
	@RequestMapping("/lectureList.do")
	@ResponseBody
	public Map<String,Object> lectureList(@RequestParam(value="classNo",defaultValue="1")int classNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", service.selectLectureListByClassNo(classNo));
		return map;
	}
	
	
	/* insert lecture */
	@RequestMapping("/insertLecture.do")
	@ResponseBody
	public void insertLecture(@RequestParam(value="classNo",defaultValue="1") int classNo, 
			@RequestParam(value="master",defaultValue="csi") String master,
								Lecture lecture ) {
		lecture.setClassNo(classNo);
		lecture.setMaster(master);
		System.out.println(lecture);
		service.insertLecture(lecture);
	}
	
	
	/* 주제명 변경 */
	@RequestMapping("/updateSubject.do")
	@ResponseBody
	public void updateLectureSubject(@RequestParam(value="classNo", defaultValue="1") int classNo,
									 @RequestParam(value="master",defaultValue="csi") String master,
									 Lecture lecture) {
		lecture.setClassNo(classNo);
		lecture.setMaster(master);
		System.out.println(lecture);
		service.updateLectureSubject(lecture);
	}
	
	@RequestMapping("/deleteLecture.do")
	@ResponseBody
	public void deleteSubject(int lecNo) {
/*		System.out.println("삭제할 lecNo"+lecNo);*/
		service.deleteLecture(lecNo);
	}
	
	
	/* lecture Board insert */
	
	@RequestMapping("/insertLectureBoard.do")
	@ResponseBody
	public void insertLectureBoard(LectureBoard lectureBoard,MultipartFile attach) {
		/* file 첨부 구현하기 */
		//System.out.println(attach);
		//System.out.println("param:"+lectureBoard);
		service.insertLectureBoard(lectureBoard);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/homework.do")
	public void hwList() {
		
	}
}

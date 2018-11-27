package kr.co.steach.clazz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println(subjectList);
		List<LectureBoard> boardList = service.selectLectureBoardByClassNo(classNo);
		
		System.out.println(boardList);
		
		model.addAttribute("subjectList",service.selectLectureByClassNo(classNo));
		model.addAttribute("boardList",service.selectLectureBoardByClassNo(classNo));
		
		
	}
	
	
	
	@RequestMapping("/homework.do")
	public void hwList() {
		
	}
}

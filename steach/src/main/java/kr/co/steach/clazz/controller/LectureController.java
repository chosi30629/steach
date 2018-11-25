package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class/lecture")
public class LectureController {

	@RequestMapping("/lecture.do")
	public void list() {
		
	}
	
	@RequestMapping("/homework.do")
	public void hwList() {
		
	}
}

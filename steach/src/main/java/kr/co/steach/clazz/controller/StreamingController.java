package kr.co.steach.clazz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.steach.clazz.service.ClazzService;


@Controller
@RequestMapping("/class/lecture")
public class StreamingController {

	/**
	 * 클래스 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	ClazzService classService;
	
	
	@RequestMapping("streaming.do")
	public void streaming() {
		
	} // streaming
	
	@RequestMapping("screen.do")
	public void screen(int classNo, Model model) {
		model.addAttribute("clazz", classService.selectClassbyClassNo(classNo));
		model.addAttribute("classNo", classNo);
	} // screen
	
} // end class

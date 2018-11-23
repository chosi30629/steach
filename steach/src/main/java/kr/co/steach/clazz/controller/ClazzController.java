package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/class")
@Controller
public class ClazzController {

	@RequestMapping("/curriculum/curriculum.do")
	public void curriculum() {
		
	}
	
	@RequestMapping("/curriculum/seat.do")
	public void seat() {
		
	}
	
	
}

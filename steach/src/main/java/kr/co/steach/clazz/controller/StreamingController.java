package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/class/lecture")
public class StreamingController {

	@RequestMapping("streaming.do")
	public void streaming() {
		
	} // streaming
	
	@RequestMapping("screen.do")
	public void screen() {
		
	} // screen
	
} // end class

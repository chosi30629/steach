package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/class/group")
public class GroupController {

	@RequestMapping("groupMain.do")
	public void groupMain() {
		
	}
	
	@RequestMapping("groupActivity.do")
	public void groupAtivity() {
		
	}
	
} // end class

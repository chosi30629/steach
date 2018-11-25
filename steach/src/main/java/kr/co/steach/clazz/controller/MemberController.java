package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class/member")
public class MemberController {

	@RequestMapping("/member.do")
	public void list() {
		
	}
}

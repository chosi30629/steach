package kr.co.steach.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class Home {
	
	@RequestMapping("/home.do")
	public void home() {
		
	}
	
	
	@RequestMapping("/home2.do")
	public void home2() {
		
	}
}

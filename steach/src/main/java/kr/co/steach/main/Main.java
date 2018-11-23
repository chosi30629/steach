package kr.co.steach.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class Main {
	
	
	
	public Main() {
		super();
		System.out.println("1");
	}

	@RequestMapping("/main.do")
	public void main() {
		
	}

}

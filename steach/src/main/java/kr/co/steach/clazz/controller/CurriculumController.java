package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 	Class의 커리큘럼페이지 컨트롤러. ( Class의 메인 페이지가 된다. ) 
 * 
 * */

@Controller
@RequestMapping("/class/curriculum")
public class CurriculumController {
	
	/**
	 * Curriculum의 메인 페이지 curriculum.jsp 
	 */
	@RequestMapping("/curriculum.do")
	public void list() {

	}
	
	/**
	 * Curriculum 자리배치 페이지..
	 */
	@RequestMapping("/seat.do")
	public void seat() {
		
	}
}

package kr.co.steach.clazz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.CurriculumService;
import kr.co.steach.repository.domain.ClassSchedule;


/**
 * 	Class의 커리큘럼페이지 컨트롤러. ( Class의 메인 페이지가 된다. ) 
 * 
 * */

@Controller
@RequestMapping("/class/curriculum")
public class CurriculumController {
	
	@Autowired
	CurriculumService service;
	
	
	
	/**
	 * Curriculum의 메인 페이지 curriculum.jsp 
	 */
	@RequestMapping("/curriculum.do")
	public void list() {

	}
	
	
	
	/**
	 *  schedule data 불러오기 
	 */
	@RequestMapping("/selectSchbyCNo.do")
	@ResponseBody
	public List<ClassSchedule> selectSchbyCNo(int classNo) {
		System.out.println("clNO:"+classNo);
		List<ClassSchedule> list = service.selectSchByClassNo(classNo);
		
		System.out.println("list:"+list);
		return service.selectSchByClassNo(classNo);
	}
	
	
	
	
	
	
	
	/**
	 * Curriculum 자리배치 페이지..
	 */
	@RequestMapping("/seat.do")
	public void seat() {
		
	}
}

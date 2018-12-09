package kr.co.steach.clazz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.CurriculumService;
import kr.co.steach.clazz.service.MemberService;
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
	
	@Autowired
	ClazzService classService;
	
	@Autowired
	MemberService memberService;
	
	/**
	 * Curriculum의 메인 페이지 curriculum.jsp 
	 */
	@RequestMapping("/curriculum.do")
	public void list(int classNo, Model model) {		
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
	}
	
	
	
	/**
	 *  schedule data 불러오기 
	 */
	@RequestMapping("/selectSchbyCNo.do")
	@ResponseBody
	public List<ClassSchedule> selectSchbyCNo(int classNo) {
		System.out.println("clno:"+classNo);
		List<ClassSchedule> list = service.selectSchByClassNo(classNo);
		
		System.out.println("list:"+list);
		return service.selectSchByClassNo(classNo);
	}
	
	
	/* schedule 등록하기 */
	@RequestMapping("/insertSchedule.do")
	@ResponseBody
	public String insertSchedule(ClassSchedule classSchedule) {
		
		System.out.println("등록할거 가꼬와!:"+classSchedule);
		service.insertSchedule(classSchedule);
		return classSchedule.getId()+"";			//insert한 key 가져오기!1
	}
	
	/* schedule 삭제 */
	@RequestMapping("/deleteSchedule.do")
	@ResponseBody
	public void deleteSchedule(int id) {
		service.deleteSchedule(id);
	}
	
	/* schedule 기간 변경 */
	@RequestMapping("/updateScheduleDate.do")
	@ResponseBody
	public void updateScheduleDate(ClassSchedule classSchedule) {
		System.out.println(classSchedule);
		service.updateScheduleDate(classSchedule);
	}
	
	
	
	/**
	 * Curriculum 자리배치 페이지..
	 */
	@RequestMapping("/seat.do")
	public void seat(int classNo,Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		model.addAttribute("memberList",memberService.selectMemberByClassNo(classNo));
		System.out.println(memberService.selectMemberByClassNo(classNo));
	}
}

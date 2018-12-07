package kr.co.steach.clazz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.AttendService;
import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.repository.domain.Attend;

@Controller
@RequestMapping("/class/attend")
public class AttendController {
	
	@Autowired
	private AttendService attendservice;
	
	@Autowired
	ClazzService classService;
	
	
	@RequestMapping("/attend.do")
	public void attend(int classNo, Attend attend, Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
//		attend.setClassNo(classNo);
//		model.addAttribute("teacherAttend",attendservice.attendlistTeacher(attend));
	}
	
	@ResponseBody
	@RequestMapping("/attendlistTeacher.do")
	public List<Attend> attend2(Attend attend, Model model) {
//		attend.setClassNo(classNo);
		return attendservice.attendlistTeacher(attend);
	}
	@ResponseBody
	@RequestMapping("/attendlistStudent.do")
	public List<Attend> attend3(int classNo, Attend attend, Model model) {
		attend.setClassNo(classNo);
		return attendservice.attendlistTeacher(attend);
	}

	@ResponseBody
	@RequestMapping("/attendStatus.do")
	public Attend attendStatus(Attend attend) {
		return attendservice.attendStatus(attend);
	}

	@ResponseBody
	@RequestMapping("/attendOn.do")
	public void attendOn(Attend attend) {
		attendservice.attendOn(attend);
	}
	@ResponseBody
	@RequestMapping("/attendearlyOff.do")
	public void attendearlyOff(Attend attend) {
		attendservice.attendearlyOff(attend);
	}
	@ResponseBody
	@RequestMapping("/attendOff.do")
	public void attendOff(Attend attend) {
		attendservice.attendOff(attend);
	}
	
	@ResponseBody
	@RequestMapping("/attendStudentContent.do")
	public Attend attendStudentContent(Attend attend) {
		return attendservice.attendStudentContent(attend);
	}
//	@Scheduled(cron="*/10 * * * * *") 
//	public void createClass() {
//		System.out.println("batch 수행되는건가?");
//		service.insertattend();
//	}
	
}

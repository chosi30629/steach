package kr.co.steach.clazz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.clazz.service.MemberService;
import kr.co.steach.repository.domain.ClassMember;

@Controller
@RequestMapping("/class/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	ClazzService classService;
	
	@Autowired
	LectureService lectureService;
	
	
	/* class 번호 해당하는 list 가져오기 */
	@RequestMapping("/member.do")
	public void list(int classNo, Model model) {
		//클래스정보 
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		//강사정보 ~~ 
		model.addAttribute("master",service.selectMasterByClassNo(classNo));
	}
	
	@RequestMapping("/studentList.do")
	@ResponseBody
	public List<ClassMember> studentList(int classNo){
		System.out.println(service.selectMemberByClassNo(classNo));
		return service.selectMemberByClassNo(classNo);
		
	}
	
	
	@RequestMapping("/doReader.do")
	@ResponseBody
	public void doReader(int memNo) {
		service.updateDoReader(memNo);
	}
	
	
	@RequestMapping("/removeReader.do")
	@ResponseBody
	public void removeReader(int memNo) {
		service.updateRemoveReader(memNo);
	}
	
	
	@RequestMapping("/doIgnore.do")
	@ResponseBody
	public void doIgnore(int memNo,int classNo) {
		//회원 내보내기 
		service.deleteDoIgnore(memNo);
		
		//마감일 지나지 않은 과제의 카운트 변경	
		lectureService.updateMemCntbyCNo(classNo);
		
		
	}
	
	
	
	
}

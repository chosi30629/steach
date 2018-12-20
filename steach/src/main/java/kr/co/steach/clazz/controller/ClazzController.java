package kr.co.steach.clazz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;
import kr.co.steach.util.DriverUtil;

@Controller
@RequestMapping("/class")
public class ClazzController {

	@Autowired
	private ClazzService service;
	
	@Autowired
	LectureService lectureService;
	
	@ResponseBody
	@RequestMapping("/createClass.do")
	public void createClass(Clazz clazz) {
		service.createClass(clazz);
		/* class 생성 시 class drive 생성하기 
		 * 경로: c://drive/class/ 클래스번호_클래스명 */
		DriverUtil.makeDrive("class//"+clazz.getClassNo()+"_"+clazz.getClassName());
	}

	@ResponseBody
	@RequestMapping("/findClass.do")
	public Clazz findClass(String classKey) {
		return service.findclass(classKey);
	}
	
	@ResponseBody
	@RequestMapping("/joinClass.do")
	public void joinClass(ClassMember member) {
		
		service.joinclass(member);
		
		//회원 추가 시 마감일이 지나지 않은 투표, 과제 카운트 증가
		
		lectureService.updateMemCntbyCNo(member.getClassNo());
	}

	
}

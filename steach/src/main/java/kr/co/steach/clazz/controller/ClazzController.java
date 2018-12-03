package kr.co.steach.clazz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

@Controller
@RequestMapping("/class")
public class ClazzController {

	@Autowired
	private ClazzService service;
	
	
	@ResponseBody
	@RequestMapping("/createClass.do")
	public void createClass(Clazz clazz) {
		service.createClass(clazz);
	}

	@ResponseBody
	@RequestMapping("/findClass.do")
	public Clazz findClass(String classKey) {
		System.out.println(service.findclass(classKey));
		return service.findclass(classKey);
	}
	
	@ResponseBody
	@RequestMapping("/joinClass.do")
	public void joinClass(ClassMember member) {
		service.joinclass(member);
	}

	
}

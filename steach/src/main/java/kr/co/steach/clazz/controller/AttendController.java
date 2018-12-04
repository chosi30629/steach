package kr.co.steach.clazz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.AttendService;
import kr.co.steach.repository.domain.Attend;

@Controller
@RequestMapping("/class/attend")
public class AttendController {
	
	@Autowired
	private AttendService service;
	
	@RequestMapping("/attend.do")
	public void attend() {
		
	}

	@ResponseBody
	@RequestMapping("/attendStatus.do")
	public Attend attendStatus(String id) {
		return service.attendStatus(id);
		
	}

	
//	@Scheduled(cron="*/10 * * * * *") 
//	public void createClass() {
//		System.out.println("batch 수행되는건가?");
//		service.insertattend();
//	}
	
}

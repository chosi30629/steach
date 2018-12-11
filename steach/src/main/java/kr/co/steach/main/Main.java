package kr.co.steach.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.repository.domain.User;

@Controller
@RequestMapping("/main")
public class Main {
	
	@Autowired
	private ClazzService service;

	@RequestMapping("/main.do")
	public void main(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("teaching", service.teaching(user.getId()));
		model.addAttribute("studying", service.studying(user.getId()));
		
//		System.out.println(service.studying(user.getId()));
	}
	
	
}

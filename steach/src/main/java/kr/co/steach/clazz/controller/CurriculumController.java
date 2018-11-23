package kr.co.steach.clazz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class")
public class CurriculumController {

	@RequestMapping("/curriculum/curriculum.do")
	public void list() {

	}
}

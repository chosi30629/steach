package kr.co.steach.clazz.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.steach.clazz.service.GroupService;


@Controller
@RequestMapping("/class/group")
public class GroupController {

	/**
	 * 그룹 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private GroupService service;
	
	
	@RequestMapping("groupMain.do")
	public void groupMain() {
		System.out.println("그룹메인~");
	} // groupMain
	
	@RequestMapping("groupActivity.do")
	public void groupActivity(Model model) {
		model.addAttribute("cardList", service.cardList());
	} // groupActivity
	
	public GroupController() {
		
	}
	@RequestMapping("orderUpdate.do")
	@ResponseBody
	public String orderUpdate(@RequestParam Map<String, Object> orders) {
		System.out.println(orders.get("orders[0][]"));
		
		//		for(int i = 0; i <= orders.length; i++) {
//			groupCard.setCardNo(orders[0]);
//			groupCard.setCardOrder(orders[1]);
//			service.cardOrderUpdate(groupCard);
//		}
		
		return "성공";
	} // orderUpdate
	
} // end class

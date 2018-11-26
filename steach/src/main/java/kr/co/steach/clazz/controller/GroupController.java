package kr.co.steach.clazz.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.steach.clazz.service.GroupService;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;


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
		model.addAttribute("listList", service.listList());
		model.addAttribute("cardList", service.cardList());
	} // groupActivity
	
	@RequestMapping("groupActivityList.do")
	@ResponseBody
	public Map<String, Object> groupActivityList() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("listList", service.listList());
		map.put("cardList", service.cardList());
		
		return map;
	} // groupActivityList
	
	@RequestMapping("addList.do")
	@ResponseBody
	public String addList(GroupList groupList, Model model) {
		service.insertList(groupList);
		return "리스트 추가 성공";
	} // addList
	
	@RequestMapping("modifyList.do")
	@ResponseBody
	public String modifyList(GroupList groupList) {
		service.updateList(groupList);
		return "리스트 수정 성공";
	} // modifyList
	
	@RequestMapping("removeList.do")
	@ResponseBody
	public String removeList(GroupList groupList) {
		service.deleteList(groupList);
		return "리스트 삭제 성공";
	} // removeList
	
	@RequestMapping("addCard.do")
	@ResponseBody
	public String addCard(GroupCard groupCard) {
		service.insertCard(groupCard);
		return "카드 추가 성공";
	} // addCard
	
	@RequestMapping("modifyCard.do")
	@ResponseBody
	public String modifyCard(GroupCard groupCard) {
		service.updateCard(groupCard);
		return "카드 수정 성공";
	} // modifyCard
	
	@RequestMapping("orderUpdate.do")
	@ResponseBody
	public String orderUpdate(@RequestParam(value="orders") String orders) {
//		System.out.println(orders);
		GroupCard groupCard = new GroupCard();
		
		try {
			// String을 Map으로
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object[]> map = new HashMap<String, Object[]>();
			map = mapper.readValue(orders, new TypeReference<Map<String, String[]>>(){});
//			System.out.println(map);
			
			// Map의 키와 값 분류
			for(Map.Entry<String, Object[]> entry : map.entrySet()){
//				System.out.println("cardNo : " + entry.getKey() + " , order : " + entry.getValue()[0] + " , listNo : " + entry.getValue()[1]);
				
				// 카드 순서 업데이트
				groupCard.setCardNo(Integer.parseInt(entry.getKey()));
				groupCard.setCardOrder(Integer.parseInt((String) entry.getValue()[0]));
				groupCard.setListNo(Integer.parseInt((String) entry.getValue()[1]));
				
				service.cardOrderUpdate(groupCard);
			} // for
		} catch (Exception e) {
			e.printStackTrace();
		} // try-catch
		
		return "카드 순서 업데이트 성공";
	} // orderUpdate
	
	@RequestMapping("listOrderUpdate.do")
	@ResponseBody
	public String listOrderUpdate(@RequestParam(value="listOrders") String listOrders) {
		GroupList groupList = new GroupList();
		
		try {
			// String을 Map으로
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = mapper.readValue(listOrders, new TypeReference<Map<String, String>>(){});
//			System.out.println(map);
			
			// Map의 키와 값 분류
			for(Map.Entry<String, Object> entry : map.entrySet()){
//				System.out.println("cardNo : " + entry.getKey() + " , order : " + entry.getValue());
				
				// 리스트 순서 업데이트
				groupList.setListNo(Integer.parseInt(entry.getKey()));
				groupList.setListOrder(Integer.parseInt((String) entry.getValue()));
				
				service.listOrderUpdate(groupList);
			} // for
		} catch (Exception e) {
			e.printStackTrace();
		} // try-catch
		
		return "리스트 순서 업데이트 성공";
	} // listOrderUpdate
	
} // end class

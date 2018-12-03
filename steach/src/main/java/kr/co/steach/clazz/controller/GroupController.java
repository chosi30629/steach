package kr.co.steach.clazz.controller;

import java.util.HashMap;
import java.util.List;
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
import kr.co.steach.clazz.service.MemberService;
import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupList;
import kr.co.steach.repository.domain.GroupMember;


@Controller
@RequestMapping("/class/group")
public class GroupController {

	/**
	 * 그룹 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private GroupService service;
	
	/**
	 * 클래스 멤버 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("groupMain.do")
	public void groupMain(Model model, Group group) {
		List<GroupMember> studentList = service.groupMemberList();
		try {
			model.addAttribute("studentList", studentList);
			model.addAttribute("groupNo", studentList.get(0).getGroupNo());
			group.setClassNo(1);
			model.addAttribute("groupList", service.groupList(group));
			model.addAttribute("classMember", memberService.selectMemberByClassNo(1));
		} catch(Exception e) {
			model.addAttribute("studentList", studentList);
			model.addAttribute("groupNo", "0");
			model.addAttribute("classMember", memberService.selectMemberByClassNo(1));
		}
	} // groupMain
	
/*	@RequestMapping("classStudentList.do")
	@ResponseBody
	public List<ClassMember> classStudentList(){
		return memberService.selectMemberByClassNo(1);
	} // classStudentList
*/	
	
	@RequestMapping("updateGroupCurrentAt.do")
	@ResponseBody
	public String updateGroupCurrentAt() {
		service.updateGroupCurrentAt();
		return "현재 조 여부 수정";
	} // updateGroupCurrentAt
	
	@RequestMapping("addGroup.do")
	@ResponseBody
	public int addGroup(Group group) {
		service.insertGroup(group);
		return group.getGroupNo();
	} // addGroup
	
	@RequestMapping("addGroupMember.do")
	@ResponseBody
	public String addGroupMember(GroupMember groupMember) {
		service.insertGroupMember(groupMember);
		return "조원 추가 성공";
	} // addGroupMember
	
	@RequestMapping("modifyMemberOrder.do")
	@ResponseBody
	public String modifyMemberOrder(@RequestParam(value="orders") String orders) {
//		System.out.println(orders);
		GroupMember groupMember = new GroupMember();
		
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
				groupMember.setGroupMemberNo(Integer.parseInt(entry.getKey()));
				groupMember.setGroupMemberOrder(Integer.parseInt((String) entry.getValue()[0]));
				groupMember.setGroupNo(Integer.parseInt((String) entry.getValue()[1]));
				
				service.memberOrderUpdate(groupMember);
			} // for
		} catch (Exception e) {
			e.printStackTrace();
		} // try-catch
		
		return "멤버 순서 업데이트 성공";
	} // modifyMemberOrder
	
	@RequestMapping("modifyGroupName.do")
	@ResponseBody
	public String modifyGroupName(Group group) {
		service.updateGroupName(group);
		return "조 이름 변경 성공";
	} // modifyGroupName
	
	@RequestMapping("initClassGroup.do")
	@ResponseBody
	public String initClassGroup(Group group) {
		service.initClassGroup(group);
		return "조 초기화 성공";
	} // initClassGroup
	
	@RequestMapping("groupActivity.do")
	public void groupActivity(Model model, int groupNo) {
		model.addAttribute("groupNo", groupNo);
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
	
	@RequestMapping("removeCard.do")
	@ResponseBody
	public String removeCard(GroupCard groupCard) {
		service.deleteCard(groupCard);
		return "카드 삭제 성공";
	} // removeCard
	
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
	
	@RequestMapping("cardCommentList.do")
	@ResponseBody
	public List<GroupComment> cardCommentList(GroupComment groupComment) {
		return service.cardCommentList(groupComment);
	} // cardCommentList
	
	@RequestMapping("addCardComment.do")
	@ResponseBody
	public String addCardComment(GroupComment groupComment) {
		service.insertCardComment(groupComment);
		return "댓글 추가 성공";
	} // addCardComment
	
	@RequestMapping("modifyCardComment.do")
	@ResponseBody
	public String modifyCardComment(GroupComment groupComment) {
		service.updateCardComment(groupComment);
		return "댓글 수정 성공";
	} // modifyCardComment
	
	@RequestMapping("removeCardComment.do")
	@ResponseBody
	public String removeCardComment(GroupComment groupComment) {
		service.deleteCardComment(groupComment);
		return "댓글 삭제 성공";
	} // removeCardComment
	
	@RequestMapping("cardChecklistList.do")
	@ResponseBody
	public List<GroupChecklist> cardChecklistList(GroupChecklist groupChecklist) {
		return service.cardchecklistList(groupChecklist);
	} // cardChecklistList
	
	@RequestMapping("addChecklist.do")
	@ResponseBody
	public String addChecklist(GroupChecklist groupChecklist) {
		service.addCardChecklist(groupChecklist);
		return "체크리스트 추가 성공";
	} // addChecklist
	
	@RequestMapping("modifyChecklistStatus.do")
	@ResponseBody
	public String modifyChecklistStatus(GroupChecklist groupChecklist) {
		service.updateChecklistStatus(groupChecklist);
		return "체크리스트 상태 변경 성공";
	} // modifyChecklistStatus

	@RequestMapping("modifyChecklist.do")
	@ResponseBody
	public String modifyChecklist(GroupChecklist groupChecklist) {
		service.updateCardChecklist(groupChecklist);
		return "체크리스트 수정 성공";
	} // modifyChecklist
	
	@RequestMapping("removeChecklist.do")
	@ResponseBody
	public String removeChecklist(GroupChecklist groupChecklist) {
		service.deleteCardChecklist(groupChecklist);
		return "체크리스트 삭제 성공";
	} // removeCard
	
	@RequestMapping("randomGroup.do")
	@ResponseBody
	public List<Group> randomGroup(Group group) {
		return service.randomGroup(group);
	}
} // end class
























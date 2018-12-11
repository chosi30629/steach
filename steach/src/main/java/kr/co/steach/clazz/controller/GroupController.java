package kr.co.steach.clazz.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.GroupService;
import kr.co.steach.clazz.service.MemberService;
import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupFile;
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
	 * 클래스 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	ClazzService classService;
	
	/**
	 * 클래스 멤버 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("groupMain.do")
	public void groupMain(Model model, Group group, int classNo) {
		List<GroupMember> studentList = service.groupMemberList();
		
		try {
			model.addAttribute("clazz", classService.selectClassbyClassNo(classNo));
			model.addAttribute("classNo", classNo);
			model.addAttribute("studentList", studentList);
			model.addAttribute("groupNo", studentList.get(0).getGroupNo());
			group.setClassNo(classNo);
			model.addAttribute("groupCount", service.groupCountByClassNo(classNo));
			model.addAttribute("groupList", service.groupList(group));
			model.addAttribute("classMember", memberService.selectMemberByClassNo(classNo));
		} catch(Exception e) {
			model.addAttribute("classNo", classNo);
			model.addAttribute("clazz", classService.selectClassbyClassNo(classNo));
			model.addAttribute("studentList", studentList);
			model.addAttribute("groupNo", "0");
			model.addAttribute("groupCount", service.groupCountByClassNo(classNo));
			model.addAttribute("classMember", memberService.selectMemberByClassNo(classNo));
			e.printStackTrace();
		} // try-catch
	} // groupMain
	
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
		GroupMember groupMember = new GroupMember();
		
		try {
			// String을 Map으로
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object[]> map = new HashMap<String, Object[]>();
			map = mapper.readValue(orders, new TypeReference<Map<String, String[]>>(){});
			
			// Map의 키와 값 분류
			for(Map.Entry<String, Object[]> entry : map.entrySet()){
				
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
	public void groupActivity(Model model, int groupNo, int classNo) {
		model.addAttribute("clazz", classService.selectClassbyClassNo(classNo));
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("group", service.selectGroupByNo(groupNo));
		model.addAttribute("listList", service.listList(groupNo));
		model.addAttribute("cardList", service.cardList());
		model.addAttribute("groupMember", service.selectMemberByGroupNo(groupNo));
	} // groupActivity
	
	@RequestMapping("groupActivityList.do")
	@ResponseBody
	public Map<String, Object> groupActivityList(int groupNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("listList", service.listList(groupNo));
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
		GroupCard groupCard = new GroupCard();
		
		try {
			// String을 Map으로
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object[]> map = new HashMap<String, Object[]>();
			map = mapper.readValue(orders, new TypeReference<Map<String, String[]>>(){});
			
			// Map의 키와 값 분류
			for(Map.Entry<String, Object[]> entry : map.entrySet()){
				
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
			
			// Map의 키와 값 분류
			for(Map.Entry<String, Object> entry : map.entrySet()){
				
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
	} // randomGroup
	
	@RequestMapping(value="cardFileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public List<GroupFile> cardFileUpload(List<MultipartFile> uploadFile, GroupFile groupFile) throws Exception {	
		
		for(MultipartFile uFile : uploadFile) {
			if(uFile.isEmpty() == true) return null;
			
			// C:/app/upload 밑에 날짜별 폴더생성을 통한 이미지 저장
			String uploadPath = "C:/app/upload";
			SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
			String datePath = sdf.format(new Date());
			String ext = "";
			int index = uFile.getOriginalFilename().lastIndexOf(".");
			
			if(index != -1) {
				ext = uFile.getOriginalFilename().substring(index);
			} // if
			
			File file = new File(uploadPath + datePath); 
			if(file.exists() == false) {
				file.mkdirs();
			} // if
			
			// 이미지 이름 중복 방지를 위한 파일이름 랜덤생성
			String uName = UUID.randomUUID().toString();
			uFile.transferTo(new File(uploadPath + datePath, uName + ext));		
			
			groupFile.setCardFileName(uFile.getOriginalFilename());
			groupFile.setCardFilePath("/local_img" + datePath + "/" + uName + ext);
			
			service.insertCardFile(groupFile);	
		} // for
		
		return service.selectFileByCardNo(groupFile.getCardNo());
	} // cardFileUpload
	
	@RequestMapping("cardFileList.do")
	@ResponseBody
	public List<GroupFile> cardFileList(int cardNo) throws Exception {	
		return service.selectFileByCardNo(cardNo);
	} // cardFileList	
	
	@RequestMapping("fileload.do")
	public void fileDownload(HttpServletResponse response, String cardFilePath, String cardFileName) throws Exception {
		cardFilePath = cardFilePath.replace("/local_img", "c:/app/upload");
		
		response.setHeader("Content-Type", "application/octet-stream");	
		cardFileName = new String(cardFileName.getBytes("utf-8"),"8859_1");  // 사용자가 보내준 파라미터를 utf-8 바이트 형태로 보냄 (한글 처리시) 
		
		response.setHeader("Content-Disposition","attachment;filename="+cardFileName);
		
		File f = new File(cardFilePath);
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);	
		
		OutputStream out = response.getOutputStream(); 
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if (ch == -1) break;
			
			bos.write(ch);
		} // while
		
		bis.close(); fis.close();bos.close();out.close();
	} // fileDownload
	
	@RequestMapping("modifyGroupBg.do")
	@ResponseBody
	public String modifyGroupBg(MultipartFile uploadFile, int groupNo) {
		// C:/app/upload 밑에 날짜별 폴더생성을 통한 이미지 저장
		String uploadPath = "C:/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		String ext = "";
		int index = uploadFile.getOriginalFilename().lastIndexOf(".");
		
		if(index != -1) {
			ext = uploadFile.getOriginalFilename().substring(index);
		} // if
		
		File file = new File(uploadPath + datePath); 
		if(file.exists() == false) {
			file.mkdirs();
		} // if
		
		// 이미지 이름 중복 방지를 위한 파일이름 랜덤생성
		String uName = UUID.randomUUID().toString();
		try {
			uploadFile.transferTo(new File(uploadPath + datePath, uName + ext));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		Group group = new Group();
		group.setGroupNo(groupNo);
		group.setGroupBg("/local_img" + datePath + "/" + uName + ext);
		
		service.updateGroupBg(group);
		
		return "배경화면 변경 성공";
	} // modifyGroupBg
	
} // end class
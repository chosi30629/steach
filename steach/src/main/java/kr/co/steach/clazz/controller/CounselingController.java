package kr.co.steach.clazz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.CounselingService;
import kr.co.steach.repository.domain.Counseling;


@Controller
@RequestMapping("/class/member/counseling")
public class CounselingController {
	
	/**
	 * 상담 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private CounselingService service;
	
	
	@RequestMapping("counseling.do")
	public void counselingList(Model model) {
		model.addAttribute("counselingList", service.counselingListBystudentId());
	} // counselingList
	
	@RequestMapping("writeCounseling.do")
	@ResponseBody
	public int writeCounseling(Counseling counseling) {
		service.insertCounseling(counseling);
		return counseling.getCounselingNo();
	} // writeCounseling
	
	@RequestMapping("modifyCounseling.do")
	@ResponseBody
	public String modifyCounseling(Counseling counseling) {
		service.updateCounseling(counseling);
		return "상담 수정 성공";
	} // modifyCounseling
	
	@RequestMapping("removeCounseling.do")
	@ResponseBody
	public String removeCounseling(Counseling counseling) {
		service.deleteCounseling(counseling);
		return "상담 삭제 성공";
	} // removeCounseling
	
} // end class

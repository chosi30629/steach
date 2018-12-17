package kr.co.steach.clazz.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.CurriculumService;
import kr.co.steach.clazz.service.MemberService;
import kr.co.steach.repository.domain.ClassSchedule;
import kr.co.steach.repository.domain.Clazz;


/**
 * 	Class의 커리큘럼페이지 컨트롤러. ( Class의 메인 페이지가 된다. ) 
 * 
 * */

@Controller
@RequestMapping("/class/curriculum")
public class CurriculumController {
	
	@Autowired
	CurriculumService service;
	
	@Autowired
	ClazzService classService;
	
	@Autowired
	MemberService memberService;
	
	/**
	 * Curriculum의 메인 페이지 curriculum.jsp 
	 */
	@RequestMapping("/curriculum.do")
	public void list(int classNo, Model model) {		
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
	}
	
	
	
	/**
	 *  schedule data 불러오기 
	 */
	@RequestMapping("/selectSchbyCNo.do")
	@ResponseBody
	public List<ClassSchedule> selectSchbyCNo(int classNo) {
		//System.out.println("clno:"+classNo);
		List<ClassSchedule> list = service.selectSchByClassNo(classNo);
		
		//System.out.println("list:"+list);
		return service.selectSchByClassNo(classNo);
	}
	
	
	/* schedule 등록하기 */
	@RequestMapping("/insertSchedule.do")
	@ResponseBody
	public String insertSchedule(ClassSchedule classSchedule) {
		System.out.println("insert "+classSchedule);
		//System.out.println("등록할거 가꼬와!:"+classSchedule);
		service.insertSchedule(classSchedule);
		return classSchedule.getId()+"";			//insert한 key 가져오기!1
	}
	
	/* schedule 삭제 */
	@RequestMapping("/deleteSchedule.do")
	@ResponseBody
	public void deleteSchedule(int id) {
		service.deleteSchedule(id);
	}
	
	/* schedule 기간 변경 */
	@RequestMapping("/updateScheduleDate.do")
	@ResponseBody
	public void updateScheduleDate(ClassSchedule classSchedule) {
		System.out.println(classSchedule);
		service.updateScheduleDate(classSchedule);
	}
	
	
	
	/**
	 * Curriculum 자리배치 페이지..
	 */
	@RequestMapping("/seat.do")
	public void seat(int classNo,Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		model.addAttribute("memberList",memberService.selectMemberByClassNo(classNo));
		System.out.println(memberService.selectMemberByClassNo(classNo));
	}
	
	/* base64 문자열을 image로 저장하기  */
	@RequestMapping("/seatSetting.do")
	@ResponseBody
	public void seatSetting(String base64data,int classNo){
		System.out.println(classNo);
		
		Clazz clazz = classService.selectClassbyClassNo(classNo);
		
		try(FileOutputStream imageOutFile = new FileOutputStream("c://drive/class/"+clazz.getClassNo()+"_"+clazz.getClassName()+"/seat.png")){
			base64data = base64data.substring("data:image/png;base64,".length()); //앞의 문자열 자르기 
			byte[] imageByteArray = Base64.getDecoder().decode(base64data);
			imageOutFile.write(imageByteArray);
			
			/* file 업로드 성공 시 db update */
			classService.updateSeatSetting(classNo);
			
		} catch(FileNotFoundException e) {
			System.out.println("image not found"+e);
		} catch(IOException ioe) {
			System.out.println("io exception"+ioe);
		} 
	}
	
	
	@RequestMapping("/updateBG.do")
	@ResponseBody
	public void updateBG(Clazz clazz) {
		System.out.println(clazz);
		classService.updateBG(clazz);
	}
}

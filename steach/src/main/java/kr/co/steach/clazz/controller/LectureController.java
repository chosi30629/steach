package kr.co.steach.clazz.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.steach.clazz.service.ClazzService;
import kr.co.steach.clazz.service.CurriculumService;
import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.repository.domain.BoardUploadFileVO;
import kr.co.steach.repository.domain.ClassSchedule;
import kr.co.steach.repository.domain.Clazz;
import kr.co.steach.repository.domain.CounterVO;
import kr.co.steach.repository.domain.Homework;
import kr.co.steach.repository.domain.Lecture;
import kr.co.steach.repository.domain.LectureBoard;
import kr.co.steach.repository.domain.VoteList;
import kr.co.steach.repository.domain.VoteListInsert;
import kr.co.steach.repository.domain.VoteResult;

@Controller
@RequestMapping("/class/lecture")
public class LectureController {
	
	@Autowired
	LectureService service;
	
	@Autowired
	ClazzService classService;
	
	@Autowired
	CurriculumService curriService;
	
	@RequestMapping("/lecture.do")
	public void list(int classNo, Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		
		
	}
	
	/* ajax List */
	@RequestMapping("/lectureList.do")
	@ResponseBody
	public Map<String,Object> lectureList(int classNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", service.selectLectureListByClassNo(classNo));
		return map;
	} 
	
	
	/* insert lecture */
	@RequestMapping("/insertLecture.do")
	@ResponseBody
	public void insertLecture(Lecture lecture ) {
		service.insertLecture(lecture);
	}
	
	
	/* 주제명 변경 */
	@RequestMapping("/updateSubject.do")
	@ResponseBody
	public void updateLectureSubject(Lecture lecture) {
		service.updateLectureSubject(lecture);
	}
	
	@RequestMapping("/deleteLecture.do")
	@ResponseBody
	public void deleteSubject(int lecNo) {
		service.deleteLecture(lecNo);
	}
	
	
	/* lecture Board insert */
	
	@RequestMapping("/insertLectureBoard.do")
	@ResponseBody
	public String insertLectureBoard(LectureBoard lectureBoard,BoardUploadFileVO bufv,List<MultipartFile> attach) {
		service.insertLectureBoard(lectureBoard);	
		
		/*과제 등록시 calendar 추가하기 */
		if(lectureBoard.getpNo()==2) {
			ClassSchedule classSchedule = new ClassSchedule();
			
			classSchedule.setClassNo(lectureBoard.getClassNo());
			classSchedule.setAllDay(false);
			classSchedule.setColor("purple");
			
			/*deadline formatting*/
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			String endDate = sdfDate.format(lectureBoard.getDeadline());
			String endTime =  sdfTime.format(lectureBoard.getDeadline());		
			String deadline = endDate+"T"+endTime;
			
			//출력 날짜 포멧
			SimpleDateFormat deadDate = new SimpleDateFormat("MM-dd");
			String deadlineText = deadDate.format(lectureBoard.getDeadline());
			
			
			classSchedule.setEnd(deadline);
	
			/*start */
			String startDate = sdfDate.format(new Date()); 
			String startTime = sdfTime.format(new Date());
			String start = startDate+"T"+startTime;
			classSchedule.setStart(start);
			
			classSchedule.setTitle("과제가 등록되었습니다.");
			classSchedule.setDescription("["+ lectureBoard.getTitle() +"]  "+deadlineText+" "+endTime+"일 까지");
			
			curriService.insertSchedule(classSchedule);
		
		}
		

		/*드라이브 내 클래스번호 내 파일저장하기 */
		int classNo = lectureBoard.getClassNo();
		/*upload path c:/drive/class/클래스번호_클래스명 */
		//클래스명 가져오기 
		
		Clazz clazz = classService.selectClassbyClassNo(classNo);
		String uploadPath="c:/drive/class/"+clazz.getClassNo()+"_"+clazz.getClassName();
		/*board folder 생성하기 */
		File f = new File(uploadPath+"/"+lectureBoard.getBoardNo()+"_"+lectureBoard.getTitle());
		
		
		//폴더없으면 생성하기
		if(!f.exists())f.mkdir();
		
		// 첨부 파일이 있을 경우 폴더 내에 저장하기.
		if(attach.get(0).getOriginalFilename()!="") {
			/* 해당 경로에파일 upload하기  */
			for(MultipartFile mf : attach) {
				try {
					/* file upload */
					mf.transferTo(new File(f,mf.getOriginalFilename()));
				} catch (IllegalStateException | IOException e) {
						System.out.println("Board_file_upload_Error");
						e.printStackTrace();
					}				
		}// for end 
		
		
		/* DB에 게시글번호, 파일명 저장하기. */	
		bufv.setBoardNo(lectureBoard.getBoardNo());
		List<String> files = new ArrayList<>();
		for(int i=0;i<attach.size();i++) {
			files.add(i,attach.get(i).getOriginalFilename());
		}
		bufv.setFileName(files);
		service.insertBoardFile(bufv);
	}
	
		/* 투표LIST  insert 시 boardNo 필요합니다. */
		return lectureBoard.getBoardNo()+"";
	}
	
	
	@RequestMapping("/deleteLecutreBoard.do")
	@ResponseBody
	public void deleteLectureBoard(int boardNo) {
		service.deleteLectureBoard(boardNo);
	}
	
	@RequestMapping("/selectLectureBoardByBNo.do")
	@ResponseBody
	public LectureBoard selectLectureBoardByBNo(int boardNo) {
		return service.selectLectureBoardByBNo(boardNo);
	}
	
	
	/* vote insert */
	@RequestMapping("/insertVoteList.do")
	@ResponseBody
	public void insertVoteList(VoteListInsert vli) {
		VoteList vl = new VoteList();
		for(int i=0;i<vli.getBoardNo().length;i++) {
			vl.setBoardNo(vli.getBoardNo()[i]);
			vl.setSelectNo(vli.getSelectNo()[i]);
			vl.setSelectName(vli.getSelectName()[i]);
			service.insertVoteList(vl);
		}	
	}
	
	
	@RequestMapping("/insertVote.do")
	@ResponseBody
	public void insertVote(VoteResult voteResult) {
		service.insertVote(voteResult);
	}
	
	/*vote 결과 확인하기 */
	@RequestMapping("/voteResult.do")
	@ResponseBody
	public List<CounterVO> selectVoteResultCountByBNo(int boardNo) {
		return service.selectVoteResultCountByBNo(boardNo);
	}
	
	
	@RequestMapping("/doSubmitHomework.do")
	@ResponseBody
	public String doSubmitHomework(Homework homework,BoardUploadFileVO BUFV, int classNo, List<MultipartFile> submitFiles) {
		if(submitFiles.get(0).getOriginalFilename()!="") {
			/* homework DB 저장  */
			service.insertHomework(homework);
			
			/*해당 폴더 경로에 저장 */
			Clazz clazz = classService.selectClassbyClassNo(classNo);
			LectureBoard board = service.selectLectureBoardByBNo(homework.getBoardNo());
			/* 실제 파일 저장하기 */
			String uploadPath ="c:/drive/class/"+clazz.getClassNo()+"_"+clazz.getClassName()+"/"+board.getBoardNo()+"_"+board.getTitle();
			File f = new File(uploadPath+"/homework"+"/"+homework.getId());
			if(!f.exists()) f.mkdirs();
			
			for(MultipartFile mf : submitFiles) {
				try {
					mf.transferTo(new File(f,mf.getOriginalFilename()));
				} catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			/*db 저장하기 */
			BUFV.setHwNo(homework.getHwNo());
			BUFV.setId(homework.getId());
			List<String> files = new ArrayList<>();
			for(int i=0;i<submitFiles.size();i++) {
				files.add(i,submitFiles.get(i).getOriginalFilename());
			}
			BUFV.setFileName(files);
			service.insertHomeworkFile(BUFV);
			
			return "success";
		} else {
			return "empty";
		}
	}
	
	

	@RequestMapping("/homework.do")
	public void hwList(int classNo, Model model) {		
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		model.addAttribute("list",service.selectHomework(classNo));
		model.addAttribute("fileList",service.selectHomeworkFileByCNo(classNo));
	}


	

}

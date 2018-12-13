package kr.co.steach.clazz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import kr.co.steach.clazz.service.LectureService;
import kr.co.steach.repository.domain.BoardUploadFileVO;
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
	
	@RequestMapping("/lecture.do")
	public void list(int classNo, Model model) {
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		
		
		//model.addAttribute("list",service.selectBoardByClassNo(classNo));
		//List<LectureBoard> list = service.selectBoardByClassNo(classNo);
		//System.out.println(list);
		
		/* 주제 가져오기 */
	/*	List<Lecture> subjectList = service.selectLectureByClassNo(classNo);
		 주제별 데이터 가져오기 
		List<LectureBoard> boardList = service.selectLectureBoardByClassNo(classNo);*/
		
		//System.out.println(boardList);
		
		//model.addAttribute("subjectList",service.selectLectureByClassNo(classNo));
		//model.addAttribute("boardList",service.selectLectureBoardByClassNo(classNo));

	//	model.addAttribute("list",service.selectLectureListByClassNo(classNo));
		
	
/*		//test
		model.addAttribute("classInfo",service.selectClassbyClassNo(classNo));
		Clazz clz = service.selectClassbyClassNo(classNo);
		System.out.println(clz);*/
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
	public String insertLectureBoard(LectureBoard lectureBoard,BoardUploadFileVO BUFV,List<MultipartFile> attach) {
		service.insertLectureBoard(lectureBoard);	
		
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
		BUFV.setBoardNo(lectureBoard.getBoardNo());
		List<String> files = new ArrayList<>();
		for(int i=0;i<attach.size();i++) {
			files.add(i,attach.get(i).getOriginalFilename());
		}
		BUFV.setFileName(files);
		service.insertBoardFile(BUFV);
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
		LectureBoard b = service.selectLectureBoardByBNo(boardNo);
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
		System.out.println(homework);
		System.out.println(submitFiles);
		//System.out.println(BUFV);
		System.out.println(classNo);
		if(submitFiles.get(0).getOriginalFilename()!="") {
			
			/* homework DB 저장  */
			service.insertHomework(homework);
			
			System.out.println(homework.getHwNo());
			
			/*해당 폴더 경로에 저장 */
			Clazz clazz = classService.selectClassbyClassNo(classNo);
			LectureBoard board = service.selectLectureBoardByBNo(homework.getBoardNo());
			/* 실제 파일 저장하기 */
			String uploadPath ="c:/drive/class/"+clazz.getClassNo()+"_"+clazz.getClassName()+"/"+board.getBoardNo()+"_"+board.getTitle();
			File f = new File(uploadPath+"/homework"+"/"+homework.getId());
			if(!f.exists()) f.mkdir();
			
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
			//System.out.println(BUFV);
			service.insertHomeworkFile(BUFV);
			
			return "success";
		}else {
			return "empty";
		}
	}
	
	

	@RequestMapping("/homework.do")
	public void hwList(int classNo,Model model) {		
		model.addAttribute("clazz",classService.selectClassbyClassNo(classNo));
		//model.addAttribute("subject",service.selectHomeworkByCNo(classNo));
		model.addAttribute("homework",service.selectHomework(classNo));
		//		model.addAttribute("submit",service.selectSubmitHomeworkByCNo(classNo));
		
		//System.out.println(service.selectHomework(classNo));
	}


	

}

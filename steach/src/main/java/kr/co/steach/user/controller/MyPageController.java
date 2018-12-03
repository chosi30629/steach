package kr.co.steach.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.repository.domain.User;
import kr.co.steach.user.service.UserService;


@Controller
@RequestMapping("/user")
public class MyPageController {
	
	/**
	 * 유저 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private UserService service;
	
	/**
	 * 비밀번호 암호화 처리에 대한 멤버 필드
	 */
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/myPage.do")
	public void myPage(String id, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("mypage", service.mypage(user.getId()));
	}
	
	
	
	// 전화번호 등록or변경
	@RequestMapping("/phonenum.do")
	@ResponseBody
	public void phonenum(User user) {
		service.updatePhone(user);
	}
	
	// 주소 등록or변경
	@RequestMapping("/addr.do")
	@ResponseBody
	public void addr(User user) {
		service.updateAddr(user);
	}


//	/**
//	 * 마이페이지
//	 * @param pageNo, model, session
//	 * 	- 프로필사진, 닉네임, 랭킹, 포인트, 최근활동
//	 */
//	@RequestMapping("myPage.do")
//	public void myPage(@RequestParam(value="pageNo", defaultValue="1")int pageNo, Model model, HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		
//		
//		
//	} // myPage
//	
//	/**
//	 * 비밀번호 수정 시 현재 비밀번호 확인
//	 * @param user, id, oriPassword
//	 */
//	@RequestMapping("passCheck.do")
//	@ResponseBody
//	public User oriPassCk(User user, String id, String oriPassword) {
//		try {
//			user = service.checkPass(id);
//			String encoded = user.getPassword();
//			
//			// 사용자가 입력한 비밀번호와 암호화 저장된 데이터베이스내의 비밀번호 확인 
//			if(passwordEncoder.matches(oriPassword, encoded)) {
//				return user;
//			} else {
//				user = null;
//			} // if-else
//		} catch(Exception e) {
//			
//			return user;
//		} // try-catch	
//		
//		return user;
//	} // oriPassCk
//	
//	/**
//	 * 비밀번호 수정
//	 * @param user, session
//	 * 	- 수정 시 변경된 비밀번호로 다시 접속하도록 세션 무효화
//	 */
//	@RequestMapping("modifyPass.do")
//	public String updatePass(User user, HttpSession session) {
//		service.updatePass(user);
//		session.invalidate(); 
//		
//		return "redirect:/main/main.do";
//	} // updatePass
	
//	/**
//	 * 프로필 사진 수정
//	 * @param uploadFile, request
//	 */
//	@RequestMapping(value="profileImg.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String profileImg(MultipartFile uploadFile, HttpServletRequest request) throws Exception {	
//		HttpSession session = request.getSession();
//		User user = (User)session.getAttribute("user");
//		
//		if(uploadFile.isEmpty() == true) return "redirect:myPage.do";
//		
//		// C:/app/upload 밑에 날짜별 폴더생성을 통한 이미지 저장
//		String uploadPath = "C:/app/steachprofile";
//		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
//		String datePath = sdf.format(new Date());
//		String ext = "";
//		int index = uploadFile.getOriginalFilename().lastIndexOf(".");
//		
//		if(index != -1) {
//			ext = uploadFile.getOriginalFilename().substring(index);
//		} // if
//		
//		File file = new File(uploadPath + datePath); 
//		if(file.exists() == false) {
//			file.mkdirs();
//		} // if
//		
//		// 이미지 이름 중복 방지를 위한 파일이름 랜덤생성
//		String uName = UUID.randomUUID().toString();
//		uploadFile.transferTo(new File(uploadPath + datePath, uName + ext));		
//		
//		UserFile userfile = new UserFile();
//		userfile.setId(user.getId());
//		userfile.setFileName(uploadFile.getOriginalFilename());
//		userfile.setUploadPath("/local_img" + datePath + "/" + uName + ext);
//		
//		// 프로필 사진 수정시 데이터베이스에서 기존 파일정보를 삭제하고 새로 등록한 파일정보 추가
//		service.deleteFile(userfile);
//		service.insertFile(userfile);
//		
//		return "성공";
//	} // profileImg
	
//	/**
//	 * 노출된 닉네임에 대한 프로필
//	 * @param pageNo, model, writer
//	 *  - 마이페이지와 동일한 프로필사진, 닉네임, 랭킹, 포인트, 최근활동
//	 */
//	@RequestMapping("profile.do")
//	public void profile(@RequestParam(value="pageNo", defaultValue="1")int pageNo, Model model, String writer) {
//		UserFile userFile = new UserFile();
//		User userInfo = service.selectUser(writer);
//		userFile.setId(userInfo.getId());
//		model.addAttribute("userFile", service.selectFile(userFile));
//		model.addAttribute("userInfo", userInfo);
//		
//		UserRank userRank = new UserRank();
//		userRank.setNickname(writer);
//		model.addAttribute("userRank", service.selectRankById(userRank.getNickname()));
//		
//		RecentActivity recentActivity = new RecentActivity();
//		recentActivity.setWriter(writer);
//		recentActivity.setPageNo(pageNo);
//		PageResult pageResult = new PageResult(pageNo, service.userRecentActivityCount(recentActivity), 5, 5);
//		model.addAttribute("pageResult", pageResult);
//		model.addAttribute("ra", service.userRecentActivity(recentActivity));
//	} // profile
	
} // end class

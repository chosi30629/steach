package kr.co.steach.home;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.steach.repository.domain.User;
import kr.co.steach.user.service.UserService;


@Controller
@RequestMapping("/user")
public class SignUpController {

	@Autowired
	private UserService service;
	
	@ResponseBody
	@RequestMapping(value="signUp.do", method=RequestMethod.POST)
	public void signUp(User user, MultipartFile uploadFile) throws Exception {
//		System.out.println("Aaa");
//		System.out.println(uploadFile.getOriginalFilename());
		
//
//		if(uploadFile.isEmpty() == true) return "redirect:myPage.do";
//		
		// C:/app/upload 밑에 날짜별 폴더생성을 통한 이미지 저장
		String uploadPath = "C:/drive/steach/profile";
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
		uploadFile.transferTo(new File(uploadPath + datePath, uName + ext));		
		
		user.setProfile(uploadFile.getOriginalFilename());
		user.setProfilePath("/local_img/steach/profile" + datePath + "/" + uName + ext);		
//		System.out.println(user);
		service.register(user);
		
//		return "redirect:/home/home.do";
	} // signUp
	
//	UserFile userfile = new UserFile();
//	userfile.setId(user.getId());
//	userfile.setFileName(uploadFile.getOriginalFilename());
//	userfile.setUploadPath("/local_img" + datePath + "/" + uName + ext);
//	
//	// 프로필 사진 수정시 데이터베이스에서 기존 파일정보를 삭제하고 새로 등록한 파일정보 추가
//	service.deleteFile(userfile);
//	service.insertFile(userfile);
//	
//	return "성공";
//	
	
	@RequestMapping("checkId.do")
	@ResponseBody
	public String checkId(User user) {
		System.out.println("invoke");
		System.out.println(user);
		System.out.println(Integer.toString(service.checkId(user)));
		return Integer.toString(service.checkId(user));
	} // checkId
	

	
} // end class

package kr.co.steach.drive.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.repository.domain.User;

@Controller
@RequestMapping("/drive")
public class DriveController {

	 String Npath = "c://drive//";
	
	@RequestMapping("/makedir.do")
	@ResponseBody
	public String makeDir(String path) {
		File file = new File(Npath + path); //
		file.mkdir();
		return "{\"result\": \"success\"}";
	}
	
	
	@RequestMapping("/drive.do")
	public void drive(Model model, HttpServletRequest request) throws IOException{
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		String name = user.getName();
		
		File file = new File(Npath + name);
//        // 경로에 파일이 존재하면
        if(!file.exists()){
        	 file.mkdirs();
             System.out.println("created directory successfully!");
        }else{
            System.out.println("이미 있어요");
            System.out.println("getName: " + file.getName());  // 파일 이름 출력
            System.out.println("getPath: " + file.getPath());    // 파일 경로 출력 
            // 파일 절대 경로 출력              
            System.out.println("getAbsolutePath : "+ file.getAbsolutePath());  
            // 파일 정규 경로 출력
            System.out.println("getCanonicalPath : "+ file.getCanonicalPath()); 
            // 상위 폴더 출력
            System.out.println("getParent : " + file.getParent());   
            
        }
    }
}

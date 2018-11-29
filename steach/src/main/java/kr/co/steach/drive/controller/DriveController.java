package kr.co.steach.drive.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.repository.domain.User;

@Controller
@RequestMapping("/drive")
public class DriveController {

	 private final String Npath = "c:\\drive\\";
	 
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	@RequestMapping("/makedir.do")
	@ResponseBody
	public HashMap<String, Object> makeDir(@RequestParam(value="path")String path) {
		File file = new File(Npath + path); //
		file.mkdir();
		HashMap<String, Object> file2 = new HashMap<>();
		file2.put("name", file.getName());
		file2.put("length", file.length());
		file2.put("patt", file.getPath());
		file2.put("modified", sdf.format(file.lastModified()));
		return file2;
	}
	
	
	@RequestMapping("/drive.do")
	public User drive(Model model,HttpServletRequest request , HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println(user);
		if(user== null) {
			response.sendRedirect("/steach/home/home.do");
		}
		
				File f= new File(Npath+user.getName()); 	
				
				
				// 경로를 가지고 있는 배열
				ArrayList<File> subFiles= new ArrayList<File>();
		        // 드라이브 사용 가능한 용량
				String usableSpace = Math.round(f.getUsableSpace()/Math.pow(1024, 3))+"GB";
		        System.out.println(usableSpace);
		       
		        if(!f.exists()) 
		        { 
		            System.out.println("디렉토리가 존재하지 않습니다"); 
		        } 
		         
		        findSubFiles(f, subFiles); 
		        System.out.println("———————————-"); 
		         
		        for(File file : subFiles) 
		        { 
		            if(file.isFile()) 
		            { 
		                System.out.println("파일 이름 : "+file.getName()); 
		                System.out.println("파일 경로 : "+file.getCanonicalPath()); 
		                System.out.println("파일 크기 : "+file.length()); 
		                System.out.println("———————————-"); 
		            } 
		            else if(file.isDirectory()) 
		            { 
		            	System.out.println("최종 수정 날짜"+ sdf.format(file.lastModified()));
		                System.out.println("디렉토리 이름 : "+file.getName()); 
		                System.out.println("디렉토리 경로 : "+file.getCanonicalPath()); 
		                System.out.println("디렉토리  : "+file.length());
		                System.out.println("———————————-"); 
		            } 
		        } 
		        //subFiles 경로 배열 
		        //usableSpace 사용 가능한 용량
		        model.addAttribute("subFiles", subFiles);
		        model.addAttribute("usableSpace", usableSpace);
		        
		        
		        return user;
		    } 
		     
		    public static void findSubFiles(File parentFile, ArrayList<File> subFiles) 
		    { 
		        if(parentFile.isFile()) 
		        { 
		            subFiles.add(parentFile); 
		        } 
		        else if(parentFile.isDirectory()) 
		        { 
		            subFiles.add(parentFile); 
		            File[] childFiles= parentFile.listFiles(); 
		            for(File childFile : childFiles) 
		            { 
		                findSubFiles(childFile, subFiles); 
		            } 
		        } 
		
		
			
}
}


package kr.co.steach.drive.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.steach.repository.domain.User;

@Controller
@RequestMapping("drive")
public class CardUploadController {
	
	 private final String Npath = "C:\\drive\\";		// 저장소 전역변수화
	 static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	 static Gson gson = new Gson();
	
	@RequestMapping("/cardUpload.do")
	public Model test(Model model , HttpServletRequest request , HttpServletResponse response) throws IOException{
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");

			File f= new File(Npath+user.getId());
			return model.addAttribute("list" , gson.toJson(listLoad(f)));
			    } 
	
	 public static List<Map<String, Object>> listLoad(File f) throws IOException
	    {
	    	
	    	List<Map<String, Object>> list = new ArrayList<>();
	    	File[] arrfile = f.listFiles();
	    	BufferedReader br = null;
	    	
			for(File fInfo : arrfile) {
				Map<String, Object> fmap = new HashMap<>();
				
				if(!fInfo.isDirectory()) {
					br = new BufferedReader(new InputStreamReader(new FileInputStream(fInfo), "UTF-8"));
					String temp = "";
					while(true) {
						String line = br.readLine();
						if (line==null) break;
						temp += line +"\n";
					}
					fmap.put("line", temp);
					br.close();
			    	}
				fmap.put("zzz", fInfo);
				fmap.put("path", fInfo.getCanonicalPath());
				fmap.put("title", fInfo.getName());
				fmap.put("folder", fInfo.isDirectory());
				if(fInfo.isDirectory() && fInfo.listFiles().length != 0) {
					fmap.put("lazy", true);
					fmap.put("flist", fInfo.listFiles());
				}
				fmap.put("lastModified", sdf.format(fInfo.lastModified()));
				fmap.put("length", fInfo.length());
				list.add(fmap);
			}
			return list;
	    }
	
}

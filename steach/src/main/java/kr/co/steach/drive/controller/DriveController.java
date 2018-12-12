package kr.co.steach.drive.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;

import kr.co.steach.repository.domain.FileVO;
import kr.co.steach.repository.domain.User;
import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/drive")
public class DriveController {

	 private final String Npath = "C:\\drive\\";		// 저장소 전역변수화
	 static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	 static Gson gson = new Gson();
	 /**
	  * 폴더 생성
	  * @param path
	  * @param keyVal
	  * @return
	  */
	@RequestMapping("/makedir.do")
	@ResponseBody
	public HashMap<String, Object> makeDir(@RequestParam(value="path")String path, @RequestParam(value="keyVal")String keyVal) {
		File file = new File(Npath + path); //
		HashMap<String, Object> file2 = new HashMap<>();
			file.mkdir();
			file2.put("keyVal", keyVal);
			file2.put("title", file.getName());
			file2.put("length", file.length());
			file2.put("path", file.getPath());
			file2.put("lastModified", sdf.format(file.lastModified()));
		return file2;
	}
	
	/**
	 * lazyload 사용 루트 폴더 내 세부폴더 
	 * 펼치기 및 더블클릭 시 가시화
	 * @param path
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/detailFolder.do")
	@ResponseBody
	public List<Map<String, Object>> detailFolder(@RequestParam(value="path")String path ) throws IOException {
		File f= new File(path);
		return listLoad(f);
	}
	
	/**
	 * 플러그인 폴더 클릭(activate속성 걸릴 시 )시 해당 폴더 내부표현(하위폴더 및 파일들)
	 * @return 
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping("/activateFolder.do")
	@ResponseBody
	public List<Map<String, Object>> activateFolder(@RequestParam(value="path")String path) throws IOException {
		File f = new File(path);
			return listLoad(f);
	}
	
	/**
	 * 리스트 테이블 내에 tr태그 클릭시(각각의 폴더 및 파일) 경로 얻어와서 하위 폴더가 있을시 들어가기
	 * @param path
	 * @return 
	 * @throws IOException
	 */
	@RequestMapping("/trClickToDetail.do")
	@ResponseBody
	public List<Map<String, Object>> trClickToDetail(@RequestParam(value="path")String path ) throws IOException {
		System.out.println("클릭"+path);
		File f =new File(path);
			return listLoad(f);
	}
	@RequestMapping("/imageRead.do")
	@ResponseBody
	public String imageRead(@RequestParam(value="path")String path ) throws IOException {
		System.out.println("클릭"+path);
		String Ext = path.substring(path.indexOf("."), path.length());
		
		BASE64Encoder base64Encoder = new BASE64Encoder();
        InputStream in = new FileInputStream(new File(path));
        ByteArrayOutputStream byteOutStream=new ByteArrayOutputStream();
        int len=0;
        byte[] buf = new byte[1024];
        while((len=in.read(buf)) != -1){
        	byteOutStream.write(buf, 0, len);
        }
        byte fileArray[]=byteOutStream.toByteArray();
        String encodeString=base64Encoder.encodeBuffer(fileArray);
		in.close();
		return "data:image/"+Ext+";base64,"+encodeString;
	}
	
	@RequestMapping("/rename.do")
	@ResponseBody
	public List<Map<String, Object>> rename(@RequestParam(value="title")String title , @RequestParam(value="path")String path) throws IOException {
			System.out.println(path); // 전
			System.out.println(title);	// 후
			System.out.println(title.substring(0, title.lastIndexOf("\\")+1)+path);
			File f = new File(title.substring(0, title.lastIndexOf("\\")+1)+path);  //전
			File f1 = new File(title); //후
			f.renameTo(f1);
			
			File f2 = new File(f1.getParent());
			return listLoad(f2);
	}

	/**
	 * 파일 업로드
	 * @param vo
	 * @return 
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/fileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> fileUpload(FileVO vo) throws IllegalStateException, IOException {
		System.out.println(vo.getPath());
		List<Map<String,Object>> list = new ArrayList<>();
		Map<String,Object> fmap = new HashMap<>();
		String path = vo.getPath();
		System.out.println("path예요" + path);
		File f =new File(path);
		
		for(MultipartFile file : vo.getAttach()) {
			if(file.isEmpty() == true) continue;
			
			System.out.println("올린 파일 이름 : " + file.getOriginalFilename());
			file.transferTo(new File(path+"\\" , file.getOriginalFilename()));
			fmap.put("title", file.getOriginalFilename());
			fmap.put("folder", false);
			fmap.put("list", listLoad(f));
			list.add(fmap);
	}
		return list;
}
	
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public String delete(@RequestParam(value="path")String path) {
		System.out.println(path);
		File f = new File(path);
		f.delete();
		return "성공이요";
		
	}
	
	
	/**
	 * 최초 팬시트리 로드시 루트 폴더[사용자 이름] 직속 하위폴더들만 표시
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/drive.do")
	public User drive(Model model,HttpServletRequest request , HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
//		if(user.getName()== null) {
//			System.out.println("들어오는데.... 왜 이동이 안되죠?");
//			response.sendRedirect("/steach/home/home.do");
//		}
				
				File f= new File(Npath+user.getId());
				if(f.exists()) {
					String len = (f.length() < 1024) ? "KB" : (f.length() > Math.pow(1024, 3) ? "GB" : "MB");
					String usedSpaece = f.length()+len;
				}else {
					f.mkdirs(); 					
				}
				
				// 경로를 가지고 있는 배열
				ArrayList<File> subFiles= new ArrayList<File>();
		        // 드라이브 사용 가능한 용량
				String usableSpace = Math.round(f.getUsableSpace()/Math.pow(1024, 3))+"GB";
		        
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
		            } 
		            else if(file.isDirectory()) 
		            { 
		            } 
		        } 

		        model.addAttribute("subFiles", subFiles); //  경로 배열  // 사용 안함
		        model.addAttribute("usableSpace", usableSpace); // 사용 가능한 용량
		        model.addAttribute("list", gson.toJson(listLoad(f)));
		        
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


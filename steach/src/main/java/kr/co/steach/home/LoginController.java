package kr.co.steach.home;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.steach.repository.domain.User;
import kr.co.steach.user.service.UserService;



/**
 * 로그인 및 로그아웃 컨트롤러
 * @author 조성일
 */
@Controller("kr.co.steach.home.LoginController")
@RequestMapping("/login")
public class LoginController {

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
	
	
	/**
	 * 로그인 처리
	 * @param session, user
	 */
	@RequestMapping("login.do")
	@ResponseBody
	public User login(HttpSession session, User user) {
		try {
			String raw = user.getPassword();
			user = service.userLogin(user);
			String encoded = user.getPassword();
			
			// 사용자가 입력한 비밀번호와 암호화 저장된 데이터베이스내의 비밀번호 확인 
			if(passwordEncoder.matches(raw, encoded)) {
				session.setAttribute("user", user);
			} else {
				user = null;
			} // if-else
			
			return user;
		} catch(Exception e) {
			
			return user;
		} // try-catch		
	} // login
	
	/**
	 * 로그아웃 처리
	 * @param session
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); 
		
		return "redirect:/home/home.do";
	} // logout
	
	/**
	 * 인증코드 메일 보내기
	 * @param user
	 */
	@RequestMapping("sendMail.do")
	@ResponseBody
	public void sendMail(User user) {
		service.sendMail(user);
	} // sendMail
	
	
	@RequestMapping("temppasschk.do")
	@ResponseBody
	public String temppasschk(User user) {
		System.out.println(user.getPassword());
		return Integer.toString(service.temppasschk(user));
	} //temppasschk
	

	@RequestMapping("modipass.do")
	@ResponseBody
	public void modipass(User user) {
		service.updatePass(user);
	} // modipass
	
	
} // end class

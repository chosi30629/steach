package kr.co.steach.user.service;

import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.User;
import kr.co.steach.repository.mapper.UserMapper;
import kr.co.steach.util.DriverUtil;

@Service
public class UserServiceImpl implements UserService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private UserMapper mapper;
	
	/**
	 * 비밀번호 암호화 처리에 대한 멤버 필드
	 */
	@Autowired
	PasswordEncoder passwordEncoder;

	
	/**
	 * 회원 등록에 대한 처리
	 * @param user
	 */
	@Override
	public void register(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		mapper.registerUser(user);
		
		/* 개인 drive 생성 */
		DriverUtil.makeDrive(user.getId());
		
	} // register

	/**
	 * 회원 가입시 아이디 중복 체크에 대한 처리
	 * @param user
	 */
	@Override
	public int checkId(User user) {
		return mapper.checkId(user);
	} // checkId

	
	//임시비밀번호 변경후 메일로 보내기
	@Override
	public void sendMail(User user) {

		
		Random rd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<8; i++){
		    if(rd.nextBoolean()){
		    	sb.append((char)((int)(rd.nextInt(26))+97));
		    } else {
		    	sb.append((rd.nextInt(10)));
		    } // if-else
		} // for
		System.out.println("랜덤"+sb.toString());
		user.setPassword(sb.toString());
		System.out.println("복호화" +user.getPassword());
		mapper.temppass(user);
		
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ul_black";								/* 보낼 이메일 Id , pw 입력   ex)asd  // asdasd */
		String hostSMTPpwd = "steach12!@";

		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "ul_black@naver.com";      						   /* 보낼 이메일  ex) asd@naver.com*/
		String fromName = "Steach";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "요청하신 아이디의 임시비밀번호 입니다.";
		msg += "<h3>임시비밀번호는 : " + sb.toString() + " 입니다.</h3>";

		// 받는 사람 Email 주소
		String mail = user.getId();
		
		// 메일 발송
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		} // try-catch
		
	} // sendMail

	
	// 임시비밀번호 체크
	@Override
	public int temppasschk(User user) {
		return mapper.temppasschk(user);
	}
	
	
	/**
	 * 로그인 처리
	 * @param user
	 */
	@Override
	public User userLogin(User user) {
		return mapper.userLogin(user);
	} // userLogin


	// 현재 비밀번호 확인
	@Override
	public User checkPass(String id) {
		return mapper.checkPass(id);
	} // checkPass

	/**
	 * 비밀번호 수정
	 * @param user
	 */
	@Override
	public void updatePass(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		mapper.updatePass(user);
	} // userPass

	// 마이페이지
	public User mypage(String id) {
		return mapper.mypage(id);
	}

	// 전화번호 등록.수정
	@Override
	public void updatePhone(User user) {
		mapper.updatePhone(user);
	}
	
	// 주소 등록.수정
	// 전화번호 등록.수정
	@Override
	public void updateAddr(User user) {
		mapper.updateAddr(user);
	}

	// 프로필 수정
	@Override
	public void profileImg(User user) {
		mapper.profileImg(user);
	}

//	/**
//	 * 파일 등록
//	 * @param userFile
//	 */
//	@Override
//	public void insertFile(UserFile userFile) {
//		mapper.insertFile(userFile);
//	} // insertFile
//
//	/**
//	 * 파일 삭제
//	 * @param userFile
//	 */
//	@Override
//	public void deleteFile(UserFile userFile) {
//		mapper.deleteFile(userFile);
//	} // deleteFile
//
//	/**
//	 * 유저 파일 검색
//	 * @param userFile
//	 */
//	@Override
//	public UserFile selectFile(UserFile userFile) {
//		return mapper.selectFile(userFile);
//	} // selectFile




} // end class

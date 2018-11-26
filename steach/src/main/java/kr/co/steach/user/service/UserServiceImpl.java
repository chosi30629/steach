package kr.co.steach.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.User;
import kr.co.steach.repository.mapper.UserMapper;



/**
 * 유저에 대한 로직 처리
 * @author 조성일
 */
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
	} // register

	/**
	 * 회원 가입시 아이디 중복 체크에 대한 처리
	 * @param user
	 */
	@Override
	public int checkId(User user) {
		return mapper.checkId(user);
	} // checkId


//	/**
//	 * 회원 가입시 인증코드 메일 보내기
//	 * @param user
//	 */
//	@Override
//	public String sendMail(User user) {
//		// Mail Server 설정
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.naver.com";
//		String hostSMTPid = "";								/* 보낼 이메일 Id , pw 입력   ex)asd  // asdasd */
//		String hostSMTPpwd = "";
//
//		// 보내는 사람 Email, 제목, 내용
//		String fromEmail = "";      						   /* 보낼 이메일  ex) asd@naver.com*/
//		String fromName = "cocainProject";
//		String subject = "";
//		String msg = "";
//
//		// 인증키 생성
//		Random rd = new Random();
//		StringBuffer sb = new StringBuffer();
//		
//		for(int i=0; i<5; i++){
//		    if(rd.nextBoolean()){
//		    	sb.append((char)((int)(rd.nextInt(26))+97));
//		    } else {
//		    	sb.append((rd.nextInt(10)));
//		    } // if-else
//		} // for
//
//		// 회원가입 메일 내용
//		subject = "Cocain 회원가입 인증 메일입니다.";
//		msg += "<h3>인증번호는 : " + sb.toString() + " 입니다.</h3>";
//
//		// 받는 사람 Email 주소
//		String mail = user.getEmail();
//		
//		// 메일 발송
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(587);
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg(msg);
//			email.send();
//		} catch (Exception e) {
//			System.out.println("메일발송 실패 : " + e);
//		} // try-catch
//		
//		return sb.toString();
//	} // sendMail

	/**
	 * 로그인 처리
	 * @param user
	 */
	@Override
	public User userLogin(User user) {
		return mapper.userLogin(user);
	} // userLogin

	/**
	 * 현재 비밀번호 확인
	 * @param id
	 */
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

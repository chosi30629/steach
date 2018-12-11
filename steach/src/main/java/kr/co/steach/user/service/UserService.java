package kr.co.steach.user.service;

import kr.co.steach.repository.domain.User;

public interface UserService {

	/**
	 * 회원 등록에 대한 처리
	 * @param user
	 */
	void register(User user);
	
	/**
	 * 회원 가입시 아이디 중복 체크에 대한 처리
	 * @param user
	 */
	int checkId(User user);
	
	
	/**
	 * 로그인 처리
	 * @param user
	 */
	User userLogin(User user);
	
	
	// 임시비밀번호 변경 및 메일 보내기
	void sendMail(User user);

	// 임시비밀번호 체크
	int temppasschk(User user);
	
	/**
	 * 비밀번호 수정
	 * @param user
	 */
	void updatePass(User user);
	
	// 현재 비밀번호 확인할 아이디
	User checkPass(String id);
	

	// 마이페이지 정보
	User mypage(String id);
	
	
	// 전화번호 등록.수정
	void updatePhone(User user);
	// 주소 등록.수정
	void updateAddr(User user);
	
	// 프로필 이미지 수정
	void profileImg(User user);

}

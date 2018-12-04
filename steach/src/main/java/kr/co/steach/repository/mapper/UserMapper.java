package kr.co.steach.repository.mapper;

import kr.co.steach.repository.domain.User;

public interface UserMapper {


	void registerUser(User user);

	User userLogin(User user);
	
	// 임시비밀번호 생성후 변경
	void temppass(User user);
	
	// 임시비밀번호 체크
	int temppasschk(User user);

	// 비밀버호 변경
	void updatePass(User user);
	
	
	// 마이페이지 정보
	User mypage(String id);
	
	// 전화번호 등록.수정
	void updatePhone(User user);
	// 주소 등록.수정
	void updateAddr(User user);
	
	
	
	
	int checkId(User user);

	User checkPass(String id);


	void insertFile(User user);

	void deleteFile(User user);

	User selectFile(User user);

	
}

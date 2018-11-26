package kr.co.steach.repository.mapper;

import kr.co.steach.repository.domain.User;

public interface UserMapper {


	void registerUser(User user);

	User userLogin(User user);

	int checkId(User user);

	User checkPass(String id);

	void updatePass(User user);

	void insertFile(User user);

	void deleteFile(User user);

	User selectFile(User user);
}

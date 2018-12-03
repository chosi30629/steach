package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

public interface ClazzService {

	void createClass(Clazz clazz);

	// 고유번호에 해당하는 클래스번호찾기
	Clazz findclass(String classKey);

	// 클래스 참여하기
	void joinclass(ClassMember member);
	
	// 메인페이지:강의중인클래스
	List<Clazz> teaching(String id);
	
	// 메인페이지:수강중인클래스
	List<Clazz> studying(String id);
}

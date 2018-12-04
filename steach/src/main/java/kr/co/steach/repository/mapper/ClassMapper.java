package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

public interface ClassMapper {
	
	// 클래스 개설하기
	void createClass(Clazz clazz);
	
	// 고유번호에 해당하는 클래스번호찾기
	Clazz findclass(String classKey);
	
	// 클래스 참여하기
	void joinclass(ClassMember member);
	
	// 메인페이지:강의중인클래스
	List<Clazz> teaching(String id);
	
	// 메인페이지:수강중인클래스
	List<Clazz> studying(String id);
	
	
	/* 클래스 번호 에 따른 클래스 정보가져오기 - curriculum, lecture,homework, */
	Clazz selectClassbyClassNo(int classNo);
	

}

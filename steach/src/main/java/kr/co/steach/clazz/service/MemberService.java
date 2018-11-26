package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

public interface MemberService {
	
	/* 클래스 학생 리스트 정보  */
	List<ClassMember> selectMemberByClassNo(int classNo);
	/* 클래스 강사 정보*/
	Clazz selectMasterByClassNo(int classNo);
	
	/* 반장 설정/취소  */
	void updateDoReader(int memNo);
	void updateRemoveReader(int memNo);
	
	/* 클래스 방출하기 */
	void deleteDoIgnore(int memNo);
	
}

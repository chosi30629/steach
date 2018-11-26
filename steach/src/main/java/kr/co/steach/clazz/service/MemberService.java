package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

public interface MemberService {
	
	
	List<ClassMember> selectMemberByClassNo(int classNo);
	
	Clazz selectMasterByClassNo(int classNo);
	
}

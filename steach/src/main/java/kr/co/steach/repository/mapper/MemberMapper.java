package kr.co.steach.repository.mapper;



import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;

public interface MemberMapper {
	
	/**
	 * 
	 * @param classNo
	 * @return ClassMemberInfo VO  member tb + user tb
	 */
	List<ClassMember> selectMemberByClassNo(int classNo);
					
	/**
	 * 
	 * @param classNo
	 * @return Clazz VO class tb + user tb
	 */
	Clazz selectMasterByClassNo(int classNo);
				
	/**
	 * 
	 * @param memNo
	 * : 반장 설정 , 반장 설정 해제 
	 * :p_no 1001(반장) p_no 1002(반원)
	 */
	void updateDoReader(int memNo);
	void updateRemoveReader(int memNo);
	
	/**
	 * 
	 * @param memNo
	 * : 클래스 내보내기 
	 */
	void deleteDoIgnore(int memNo);
	
}

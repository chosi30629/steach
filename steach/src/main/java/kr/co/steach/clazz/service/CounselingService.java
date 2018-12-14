package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Counseling;


public interface CounselingService {

	ClassMember selectStudentInfoByMemberNo(int memNo);
	
	List<Counseling> counselingListBystudentId(ClassMember classMember);

	void insertCounseling(Counseling counseling);

	void updateCounseling(Counseling counseling);
	
	void deleteCounseling(Counseling counseling);
	
} // end interface

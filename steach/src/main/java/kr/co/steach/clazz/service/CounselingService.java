package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.Counseling;


public interface CounselingService {

	List<Counseling> counselingListBystudentId();

	void insertCounseling(Counseling counseling);

	void updateCounseling(Counseling counseling);
	
	void deleteCounseling(Counseling counseling);
	
} // end interface

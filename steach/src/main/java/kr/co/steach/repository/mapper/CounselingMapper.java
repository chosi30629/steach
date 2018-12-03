package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.Counseling;


public interface CounselingMapper {

	List<Counseling> counselingListBystudentId();
	
	void insertCounseling(Counseling counseling);
	
	void updateCounseling(Counseling counseling);
	
	void deleteCounseling(Counseling counseling);
	
} // end interface

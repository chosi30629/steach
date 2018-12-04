package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.Counseling;
import kr.co.steach.repository.mapper.CounselingMapper;


@Service
public class CounselingServiceImpl implements CounselingService {
	
	/**
	 * 상담 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private CounselingMapper mapper;
	
	
	@Override
	public List<Counseling> counselingListBystudentId() {
		return mapper.counselingListBystudentId();
	} // counselingListBystudentId

	@Override
	public void insertCounseling(Counseling counseling) {
		mapper.insertCounseling(counseling);
	} // insertCounseling

	@Override
	public void updateCounseling(Counseling counseling) {
		mapper.updateCounseling(counseling);
	} // updateCounseling

	@Override
	public void deleteCounseling(Counseling counseling) {
		mapper.deleteCounseling(counseling);
	} // deleteCounseling

} // end class

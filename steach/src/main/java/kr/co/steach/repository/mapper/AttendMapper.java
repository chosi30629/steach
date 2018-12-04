package kr.co.steach.repository.mapper;

import kr.co.steach.repository.domain.Attend;

public interface AttendMapper {
	
	// 명단 및 날짜 batch
	void insertattend();
	
	Attend attendStatus(String id);

}

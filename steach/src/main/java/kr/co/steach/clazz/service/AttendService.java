package kr.co.steach.clazz.service;

import kr.co.steach.repository.domain.Attend;

public interface AttendService {

	void insertattend();
	
	Attend attendStatus(String id);


}

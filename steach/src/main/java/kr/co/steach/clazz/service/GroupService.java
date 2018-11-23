package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;


public interface GroupService {

	List<GroupCard> cardList();
	
	void cardOrderUpdate(GroupCard groupCard);
	
} // end interface

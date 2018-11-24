package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;


public interface GroupService {

	List<GroupList> listList();
	
	List<GroupCard> cardList();
	
	void listOrderUpdate(GroupList groupList);
	
	void cardOrderUpdate(GroupCard groupCard);
	
} // end interface

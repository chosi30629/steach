package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;


public interface GroupService {

	List<GroupList> listList();
	
	void insertList(GroupList groupList);
	
	void updateList(GroupList groupList);
	
	void deleteList(GroupList groupList);
	
	void listOrderUpdate(GroupList groupList);

	List<GroupCard> cardList();

	void insertCard(GroupCard groupCard);
	
	void updateCard(GroupCard groupCard);

	void deleteCard(GroupCard groupCard);
	
	void cardOrderUpdate(GroupCard groupCard);
	
} // end interface

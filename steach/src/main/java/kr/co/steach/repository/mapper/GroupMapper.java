package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;


public interface GroupMapper {

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

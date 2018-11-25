package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;


public interface GroupMapper {

	List<GroupList> listList();
	
	List<GroupCard> cardList();
	
	void insertList(GroupList groupList);
	
	void listOrderUpdate(GroupList groupList);

	void cardOrderUpdate(GroupCard groupCard);
	
} // end interface

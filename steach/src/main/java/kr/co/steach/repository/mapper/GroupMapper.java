package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.GroupCard;


public interface GroupMapper {

	List<GroupCard> cardList();
	
	void cardOrderUpdate(GroupCard groupCard);
	
} // end interface

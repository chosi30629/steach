package kr.co.steach.repository.mapper;

import java.util.List;

import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupList;
import kr.co.steach.repository.domain.GroupMember;


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
	
	List<GroupComment> cardCommentList(GroupComment groupComment);
	
	void insertCardComment(GroupComment groupComment);
	
	void updateCardComment(GroupComment groupComment);
	
	void deleteCardComment(GroupComment groupComment);
	
	List<GroupChecklist> cardchecklistList(GroupChecklist groupChecklist);
	
	void addCardChecklist(GroupChecklist groupChecklist);
	
	void updateChecklistStatus(GroupChecklist groupChecklist);
	
	void updateCardChecklist(GroupChecklist groupChecklist);
	
	void deleteCardChecklist(GroupChecklist groupChecklist);
	
	List<Group> groupList(Group group);
	
	List<GroupMember> groupMember(GroupMember groupMember);
	
	List<GroupMember> groupMemberList();
	
	void insertGroup(Group group);
	
	void insertGroupMember(GroupMember groupMember);
	
	void updateGroupCurrentAt();
	
	void memberOrderUpdate(GroupMember groupMember);
	
} // end interface

package kr.co.steach.clazz.service;

import java.util.List;

import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupFile;
import kr.co.steach.repository.domain.GroupList;
import kr.co.steach.repository.domain.GroupMember;


public interface GroupService {

	List<GroupList> listList(int groupNo);
	
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

	Group selectGroupByNo(int groupNo);
	
	List<GroupMember> groupMember(GroupMember groupMember);
	
	List<GroupMember> groupMemberList();
	
	int groupCountByClassNo(int classNo);
	
	void insertGroup(Group group);
	
	void insertGroupMember(GroupMember groupMember);
	
	void updateGroupCurrentAt(int classNo);

	List<Group> randomGroup(Group group);

	void memberOrderUpdate(GroupMember groupMember);

	void updateGroupName(Group group);

	void initClassGroup(Group group);

	void insertCardFile(GroupFile groupFile);
	
	List<GroupFile> selectFileByCardNo(int cardNo);

	List<GroupMember> selectMemberByGroupNo(int groupNo);

	void updateGroupBg(Group group);
	
	void commissionGroupLeader(GroupMember groupMember);
	
} // end interface

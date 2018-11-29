package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupList;
import kr.co.steach.repository.domain.GroupMember;
import kr.co.steach.repository.mapper.GroupMapper;


@Service
public class GroupServiceImpl implements GroupService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private GroupMapper mapper;
	

	@Override
	public List<GroupList> listList() {
		return mapper.listList();
	} // listList

	@Override
	public void insertList(GroupList groupList) {
		mapper.insertList(groupList);
	} // insertList
	
	@Override
	public void updateList(GroupList groupList) {
		mapper.updateList(groupList);
	} // updateList
	
	@Override
	public void listOrderUpdate(GroupList groupList) {
		mapper.listOrderUpdate(groupList);
	} // listOrderUpdate
	
	@Override
	public void deleteList(GroupList groupList) {
		mapper.deleteList(groupList);
	} // deleteList
	
	@Override
	public List<GroupCard> cardList() {
		return mapper.cardList();
	} // cardList

	@Override
	public void insertCard(GroupCard groupCard) {
		mapper.insertCard(groupCard);
	} // insertCard
	
	@Override
	public void updateCard(GroupCard groupCard) {
		mapper.updateCard(groupCard);
	} // updateCard
	
	@Override
	public void cardOrderUpdate(GroupCard groupCard) {
		mapper.cardOrderUpdate(groupCard);
	} // cardOrderUpdate

	@Override
	public void deleteCard(GroupCard groupCard) {
		mapper.deleteCard(groupCard);
	} // deleteCard

	@Override
	public List<GroupComment> cardCommentList(GroupComment groupComment) {
		return mapper.cardCommentList(groupComment);
	} // cardCommentList

	@Override
	public void insertCardComment(GroupComment groupComment) {
		mapper.insertCardComment(groupComment);
	} // insertCardComment

	@Override
	public void updateCardComment(GroupComment groupComment) {
		mapper.updateCardComment(groupComment);
	} // updateCardComment
	
	@Override
	public void deleteCardComment(GroupComment groupComment) {
		mapper.deleteCardComment(groupComment);
	} // deleteCardComment

	@Override
	public List<GroupChecklist> cardchecklistList(GroupChecklist groupChecklist) {
		return mapper.cardchecklistList(groupChecklist);
	} // cardchecklistList

	@Override
	public void addCardChecklist(GroupChecklist groupChecklist) {
		mapper.addCardChecklist(groupChecklist);
	} // addCardChecklist
	
	@Override
	public void updateChecklistStatus(GroupChecklist groupChecklist) {
		mapper.updateChecklistStatus(groupChecklist);
	} // updateChecklistStatus

	@Override
	public void updateCardChecklist(GroupChecklist groupChecklist) {
		mapper.updateCardChecklist(groupChecklist);
	} // updateCardChecklist
	
	@Override
	public void deleteCardChecklist(GroupChecklist groupChecklist) {
		mapper.deleteCardChecklist(groupChecklist);
	} // deleteCardChecklist

	@Override
	public List<GroupMember> groupMemberList() {
		return mapper.groupMemberList();
	} // groupMemberList

	@Override
	public List<Group> groupList() {
		return mapper.groupList();
	} // groupList

	@Override
	public List<GroupMember> groupMember(GroupMember groupMember) {
		return mapper.groupMember(groupMember);
	}

} // end class

package kr.co.steach.clazz.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Group;
import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupChecklist;
import kr.co.steach.repository.domain.GroupComment;
import kr.co.steach.repository.domain.GroupList;
import kr.co.steach.repository.domain.GroupMember;
import kr.co.steach.repository.mapper.GroupMapper;
import kr.co.steach.repository.mapper.MemberMapper;


@Service
public class GroupServiceImpl implements GroupService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private GroupMapper mapper;
	
	/**
	 * 클래스 멤버 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private MemberMapper memberMapper;
	

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
	public List<Group> groupList(Group group) {
		return mapper.groupList(group);
	} // groupList

	@Override
	public List<GroupMember> groupMember(GroupMember groupMember) {
		return mapper.groupMember(groupMember);
	} // groupMember

	@Override
	public void insertGroup(Group group) {
		mapper.insertGroup(group);
	} // insertGroup

	@Override
	public void insertGroupMember(GroupMember groupMember) {
		mapper.insertGroupMember(groupMember);
	} // insertGroupMember

	@Override
	public void updateGroupCurrentAt() {
		mapper.updateGroupCurrentAt();
	} // updateGroupCurrentAt

	/* (non-Javadoc)
	 * groupSize : 생성할 조의 크기
	 * @see kr.co.steach.clazz.service.GroupService#randomGroup(int)
	 */
	@Override
	public List<Group> randomGroup(Group group) {
		
		/*
		 * 랜덤 그룹 생성하기
		 * 
		 * 1. 현재 조 데이터 N 으로 변경(update)
		 * 2. 클래스 학생 목록 가져오기
		 * 3. 그룹 생성하기
		 * 4. 그룹에 조원 설정
		 * 
		 * 데이터 리턴 
		 */
		
		// 1단계 : 현재 조 그룹 'N' 설정하기
		mapper.updateGroupCurrentAt();
		
		// 2단계 : 클래스 학생 목록 가져오기
		int classNo = group.getClassNo();
		List<ClassMember> members = memberMapper.selectMemberByClassNo(group.getClassNo());		
		
		// 멤버 랜덤 섞기
		Collections.shuffle(members);
		
		int groupSize = group.getGroupSize();
		int numGroups = (int)Math.ceil((double)members.size() / groupSize);
		
		outer: for(int i = 0; i < numGroups; i++) {
			// 3단계 : 그룹 생성하기
			Group tempGroup = new Group();
			tempGroup.setClassNo(classNo);
			tempGroup.setGroupGenerator("csi");
			tempGroup.setGroupSequence(i + 1);
			tempGroup.setGroupName((i + 1) + "조");
			mapper.insertGroup(tempGroup);
			
			int groupNo = tempGroup.getGroupNo();
			
			for(int k = 0; k < groupSize; k++) {
				GroupMember groupMember = new GroupMember();
				groupMember.setGroupNo(groupNo);
				if(members.size() == 0) break outer;
				groupMember.setGroupMemberId(members.remove(0).getId());
				groupMember.setGroupMemberOrder(k + 1);
				mapper.insertGroupMember(groupMember);
			} // inner for
		} // outer for
		
		group.setCurrentAt("Y");
		
		return mapper.groupList(group);
	} // randomGroup

	@Override
	public void memberOrderUpdate(GroupMember groupMember) {
		mapper.memberOrderUpdate(groupMember);
	} // memberOrderUpdate

	@Override
	public void updateGroupName(Group group) {
		mapper.updateGroupName(group);
	} // updateGroupName

	@Override
	public void initClassGroup(Group group) {
		mapper.initClassGroup(group);
	} // initClassGroup
	
} // end class

package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.domain.GroupList;
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

} // end class

package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.GroupCard;
import kr.co.steach.repository.mapper.GroupMapper;


@Service
public class GroupServiceImpl implements GroupService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private GroupMapper mapper;
	
	
	@Override
	public List<GroupCard> cardList() {
		return mapper.cardList();
	} // cardList


	@Override
	public void cardOrderUpdate(GroupCard groupCard) {
		mapper.cardOrderUpdate(groupCard);
	} // cardOrderUpdate

} // end class

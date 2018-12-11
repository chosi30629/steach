package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;
import kr.co.steach.repository.mapper.ClassMapper;
import kr.co.steach.util.DriverUtil;



@Service
public class ClazzServiceImpl implements ClazzService {
	
	/**
	 * 매퍼 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private ClassMapper mapper;

	@Override
	public void createClass(Clazz clazz) {
		mapper.createClass(clazz);
	}

	@Override
	public Clazz findclass(String classKey) {
		return mapper.findclass(classKey);
	}

	@Override
	public void joinclass(ClassMember member) {
		mapper.joinclass(member);
	}

	@Override
	public List<Clazz> teaching(String id) {
		return mapper.teaching(id);
	}

	@Override
	public List<Clazz> studying(String id) {
		return mapper.studying(id);
	}

	@Override
	public Clazz selectClassbyClassNo(int classNo) {
		return mapper.selectClassbyClassNo(classNo);
	}
	

	

} // end class

package kr.co.steach.clazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.steach.repository.domain.ClassMember;
import kr.co.steach.repository.domain.Clazz;
import kr.co.steach.repository.mapper.MemberMapper;


@Controller
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper mapper;
	
	@Override
	public List<ClassMember> selectMemberByClassNo(int classNo) {
		
		//System.out.println("impl"+mapper.selectMemberByClassNo(classNo));
		return	mapper.selectMemberByClassNo(classNo);
	}

	@Override
	public Clazz selectMasterByClassNo(int classNo) {
		return mapper.selectMasterByClassNo(classNo);
	}

	@Override
	public void updateDoReader(int memNo) {
		mapper.updateDoReader(memNo);
	}

	@Override
	public void updateRemoveReader(int memNo) {
		mapper.updateRemoveReader(memNo);
		
	}

	@Override
	public void deleteDoIgnore(int memNo) {
		mapper.deleteDoIgnore(memNo);
	}

}

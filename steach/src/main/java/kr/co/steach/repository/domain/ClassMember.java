package kr.co.steach.repository.domain;

import lombok.Data;
/**
 * 
 * @author haedong
 * : ClassMember VO 
 * : pNo - 1001(반장), 1002(반원) 
 * : gNo - 2 
 */
@Data
public class ClassMember {
	private int memNo;
	private int ClassNo;	//클래스번호 
	private int pNo;		//default 1002 
	private int gNo;		//default 2 
	private String id;		//유저 ID 
	
	private User user;
}

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
	private int classNo;	//클래스번호 
	private int pNo;		//default 1002 
	private int gNo;		//default 2 
	private String id;		//유저 ID 
	private int groupNo;
	private User user;

	
	
	//lombok err 수동 추가
	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	
	
	
}

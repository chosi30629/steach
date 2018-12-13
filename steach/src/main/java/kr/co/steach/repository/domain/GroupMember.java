package kr.co.steach.repository.domain;

import lombok.Data;


@Data
public class GroupMember {
	private int groupMemberNo;
	private int groupNo;
	private int pNo;
	private int gNo;
	private String groupMemberId;
	private int groupMemberOrder;
	private int groupSequence;
	private String name;
	private User user;
	private String profilePath;
	private String phone;
	private String addr;
	
	
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
	
} // end class

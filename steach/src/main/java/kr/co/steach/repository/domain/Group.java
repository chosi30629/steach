package kr.co.steach.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;


@Data
public class Group {
	private int groupNo;
	private int classNo;
	private String groupGenerator;
	private int groupSequence;
	private String groupName;
	private Date groupRegDate;
	private String currentAt;
	private List<GroupMember> groupMember;
	
	
} // end class

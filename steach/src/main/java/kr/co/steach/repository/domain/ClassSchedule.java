package kr.co.steach.repository.domain;

import lombok.Data;

@Data
public class ClassSchedule {
	private int schNo;
	private int classNo;
	private String id;
	private String start;
	private String end;
	private String title;
	private String detail;
	private String schId;
	
}

package kr.co.steach.repository.domain;

import lombok.Data;

@Data
public class ClassSchedule {
	private int id;
	private int classNo;
	private String start;
	private String end;
	private String title;
	private String description;
	private boolean allDay;
	private String url;
	private String color;

}

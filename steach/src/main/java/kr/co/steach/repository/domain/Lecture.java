package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Lecture {
	private int lecNo;
	private int classNo;
	private String subject;
	private Date regDate;
	private String master;
	
}

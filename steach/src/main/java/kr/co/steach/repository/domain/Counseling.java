package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class Counseling {
	private int counselingNo;
	private int classNo;
	private String studentId;
	private String counselingWriter;
	private String counselingTitle;
	private String counselingContent;
	private Date counselingRegDate;
	
	
} // end class

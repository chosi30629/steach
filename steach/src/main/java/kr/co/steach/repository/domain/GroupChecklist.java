package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class GroupChecklist {
	private int cardChecklistNo;
	private int cardNo;
	private String cardChecklistWriter;
	private String cardChecklistTitle;
	private String cardChecklistStatus;
	private Date cardChecklistRegDate;
	
} // end class

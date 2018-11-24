package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class GroupList {
	private int listNo;
	private int GroupNo;
	private String listWriter;
	private String listTitle;
	private int listOrder;
	private Date listRegDate;
	
	
} // end class

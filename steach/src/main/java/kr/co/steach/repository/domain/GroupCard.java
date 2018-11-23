package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class GroupCard {
	private int cardNo;
	private int listNo;
	private String cardWriter;
	private String cardTitle;
	private String cardContent;
	private int cardOrder;
	private Date cardRegDate;
	private int[][] orders;
	
} // end class

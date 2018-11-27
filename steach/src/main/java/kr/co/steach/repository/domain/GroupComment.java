package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class GroupComment {
	private int cardCommentNo;
	private int cardNo;
	private String cardCommentWriter;
	private String cardCommentContent;
	private Date cardCommentRegDate;
	
	
} // end class

package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Homework {
	private int hwNo;
	private int boardNo;
	private String id;
	private String hwContent;
	private Date regDate;
}

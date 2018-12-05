package kr.co.steach.repository.domain;

import lombok.Data;

@Data
public class VoteList {
	private int listNo;
	private int boardNo;
	private int selectNo; 
	private String selectName;
		
}

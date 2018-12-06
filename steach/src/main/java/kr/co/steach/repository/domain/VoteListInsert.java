package kr.co.steach.repository.domain;

import lombok.Data;

@Data
public class VoteListInsert {
	/* insert 하기 */
	private int listNo;
	private int[] boardNo;
	private int[] selectNo; 
	private String[] selectName;
}

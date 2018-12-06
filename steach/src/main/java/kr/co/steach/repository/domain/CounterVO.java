package kr.co.steach.repository.domain;

import lombok.Data;

@Data
public class CounterVO {

	//board No lec no count 등 용도로 사용
	
	private int boardNo;
	private int lecNo;
	private int classNo;
	
	private int count; 
	
}

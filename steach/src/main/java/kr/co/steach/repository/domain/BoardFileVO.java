package kr.co.steach.repository.domain;

import lombok.Data;

/*list page 에 출력할 file VO */
@Data
public class BoardFileVO {
	private int fileNo;
	private int boardNo;
	private String fileName;
}

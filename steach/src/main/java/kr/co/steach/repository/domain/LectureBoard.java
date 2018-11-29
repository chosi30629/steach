package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;
/**
 * 
 * @author haedong
 * class 내의 lecture(주제)의 게시글 
 * :gNo 4(수업구분) pNo 1 자료 2 과제 3 보충수업 4 투표
 */
@Data
public class LectureBoard {
	private int boardNo;
	private int lecNo;
	private int gNo;
	private int pNo;
	private String title;
	private String content;
	private Date regDate;
	private String deadline;
	private int memCnt;
	
	private Lecture lecture;
	
	
	
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
}
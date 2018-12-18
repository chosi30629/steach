package kr.co.steach.repository.domain;

import java.util.Date;
import java.util.List;

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
	private Date deadline;
	private int memCnt;
	private List<Homework> homework;
	private Lecture lecture;
	private int count;
	private int classNo;
	

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
	
	public String getTitle() {
		return this.title.replace(".", "");
	}
}

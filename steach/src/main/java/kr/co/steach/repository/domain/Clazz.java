package kr.co.steach.repository.domain;

import lombok.Data;


/**
 * 
 * @author haedong
 * : Class VO 
 */
@Data
public class Clazz {
	private int classNo;			//클래스번호 auto_increment
	private String master;			//개설자
	private String className;		//클래스명
	private String classSubname;	//클래스설명
	private String startTime;		//클래스 시작 시간 
	private String endTime;			//클래스 종료 시간 
	private String beginDate;	    //클래스 시작일
	private String endDate;         //클래스 종료일
	private String classKey;        //클래스 고유키
	private String bgName;          //메인페이지 bg name
	private String seatName;        // 좌석배치 filename

	private User user;
	
	
	public String getClassName() {
		return this.className.replace(".", "");
	}
}

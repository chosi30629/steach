package kr.co.steach.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Attend {
	private int attendNo;			//출석부번호 auto_increment
	private int classNo;			//클래스번호 auto_increment
	private String id;				//명단
	private String attendDate;		//출석일
	private String attendDay;		//출석 요일 
	private Date attendTime;		//출석 시간 
	private int gNo;	    		//출석상태코드
	private String offStatus;		//퇴실여부
	private Date offTime;		   	//퇴실시간
	private String chartMonth;		//월별출석 차트를 보여주기위한
	
	private int attendOn;
	private int attendLate;
	private int attendEarly;
	private int attendOff;
	
	private List<User> user;
}

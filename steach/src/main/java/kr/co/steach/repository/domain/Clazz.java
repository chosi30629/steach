package kr.co.steach.repository.domain;

import lombok.Data;


/**
 * 
 * @author haedong
 * : Class VO 
 */

@Data
public class Clazz {
	private int classNo;			
	private String master;			
	private String className;		
	private String classSubname;	
	private String startTime;		
	private String endTime;			
	private String beginDate;	   
	private String endDate;        
	private String classKey;       
	private String bgName;          
	private String seatName;        
	private User user;
	
	
	public String getClassName() {
		if(this.className!=null) return this.className.replace(".","");
		
		return this.className;
	}
	

	

}

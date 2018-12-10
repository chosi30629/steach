package kr.co.steach.repository.domain;

import java.util.Date;

import lombok.Data;


@Data
public class GroupFile {
	private int cardFileNo;
	private int cardNo;
	private String cardFileWriter;
	private String cardFileName;
	private String cardFilePath;
	private Date cardFileRegDate;
	
	
} // end class

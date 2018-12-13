package kr.co.steach.repository.domain;

import java.util.List;

import lombok.Data;

/* lecture page upload files 
 * 파일 업로드 시 DB에 저장시킬 데이터를 저장하는 VO입니다. */
@Data
public class BoardUploadFileVO {
	private int fileNo;
	private int boardNo;  //upload file 
	private int hwNo;     //upload homework;
	private String id;       //userid
	private List<String> fileName;
}

package kr.co.steach.util;

import java.io.File;

public class DriverUtil {
	/**
	 * 회원 가입 시 사용자의 드라이브를 생성한다.
	 * @param name - 회원가입한 사용자의 이름
	 * @return
	 */
	public static boolean makeDrive(String name) {
		String path = "c://drive//" + name;
		File file = new File(path);
        // 경로에 파일이 존재하면
        if(file.exists()){
             throw new RuntimeException(name + "에 해당하는 드라이브가 존재합니다.");
        }        
        file.mkdirs();
        return true;
	}
}

package kr.co.steach.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {

		private String id;
		private List<MultipartFile> attach;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public List<MultipartFile> getAttach() {
			return attach;
		}
		public void setAttach(List<MultipartFile> attach) {
			this.attach = attach;
		}
	
}

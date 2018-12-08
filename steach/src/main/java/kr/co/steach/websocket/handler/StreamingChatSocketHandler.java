package kr.co.steach.websocket.handler;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Component("streamingChat")
public class StreamingChatSocketHandler extends TextWebSocketHandler {
	FileOutputStream fos = null;
	
	Map<String, WebSocketSession> users = new HashMap<>();
	
	public StreamingChatSocketHandler() {
		System.out.println("객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
	}

	@Override
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		log("chat 바이너리 메세지 들어옴");
		System.out.println("메세지 길이 : " + message.getPayloadLength());
		ByteBuffer buffer = message.getPayload();
		try {
			fos.write(buffer.array());
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void download(WebSocketSession wss) throws Exception {
		FileInputStream fis = new FileInputStream("c:/java-lec/upload/aaa.jpg");
		byte[] arr = new byte[fis.available()];
		fis.read(arr);
		wss.sendMessage(new BinaryMessage(arr));
		fis.close();
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		if (msg.startsWith("filename:")) {
			try {
				fos = new FileOutputStream(
						"c:/java-lec/upload/" + msg.replaceAll("filename:", "")
				);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (msg.startsWith("filedown:")) {
			download(session);
		}
		
		Map<String, Object> map = session.getAttributes();
		System.out.println(map);
		
		log("보내온 메세지 : " + message.getPayload());
		log("보낸 사람 아이디 : " + session.getId());
		
		Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wss = users.get(key);
			if (session.getId().equals(wss.getId())) continue;
			wss.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}
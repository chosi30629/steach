package kr.co.steach.websocket.handler;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.steach.repository.domain.User;


@Component("chat")
public class ChatSocketHandler extends TextWebSocketHandler {
	FileOutputStream fos = null;
	Map<String, List<WebSocketSession>> users = new HashMap<>();

	
	public ChatSocketHandler() {
		System.out.println("객체 생성");
	} // ChatSocketHandler

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
	} // afterConnectionEstablished

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		Set<String> keys = users.keySet();
		for(String key : keys) {
			users.get(key).remove(session);
		} // for
		
		log(session.getId() + " 연결 종료됨");
	} // afterConnectionClosed

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
		} // try-catch
	} // handleBinaryMessage

	private void download(WebSocketSession wss) throws Exception {
		FileInputStream fis = new FileInputStream("c:/java-lec/upload/aaa.jpg");
		byte[] arr = new byte[fis.available()];
		fis.read(arr);
		wss.sendMessage(new BinaryMessage(arr));
		fis.close();
	} // download
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
//		if (msg.startsWith("filename:")) {
//			try {
//				fos = new FileOutputStream(
//						"c:/java-lec/upload/" + msg.replaceAll("filename:", "")
//				);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		if (msg.startsWith("groupNo:")) {
			try {
				if(!users.containsKey(msg.substring(msg.indexOf(":") + 1))) {
					users.put(msg.substring(msg.indexOf(":") + 1), new ArrayList<>());
					users.get(msg.substring(msg.indexOf(":") + 1)).add(session);
				} else {
					users.get(msg.substring(msg.indexOf(":") + 1)).add(session);
				} // inner if-else
				System.out.println(users.toString());
			} catch (Exception e) {
				e.printStackTrace();
			} // try-catch
		} // outer if
		
//		if (msg.startsWith("filedown:")) {
//			download(session);
//		}
		
		Map<String, Object> map = session.getAttributes();
		System.out.println(((User)map.get("user")).getId());
		
		log("보내온 메세지 : " + message.getPayload());
		log("보낸 사람 아이디 : " + session.getId());
		
		try {
			log("그룹번호 : " + message.getPayload().substring(0, message.getPayload().indexOf(",")));
		} catch(Exception e) {
			System.out.println("첫 메시지");
		} // try-catch
		
		try {
			List<WebSocketSession> wss = users.get(message.getPayload().substring(0, message.getPayload().indexOf(",")));
			for(WebSocketSession ws : wss) {
				try {
					System.out.println(ws.toString());
					if (session.getId().equals(ws.getId())) continue;
					ws.sendMessage(new TextMessage(message.getPayload()));
				} catch(Exception e) {
					System.out.println("첫 메시지 보내지 않기");
				} // try-catch
			} // for
		} catch (Exception e) {
			System.out.println("첫 메시지 보내지 않기");
		} // try-catch
	} // handleTextMessage

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	} // handleTransportError

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	} // log
	
} // end class
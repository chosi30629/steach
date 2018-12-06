package kr.co.steach.websocket.handler;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/screen")
public class Screen {
	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

	
	@OnOpen
	public void whenOpening(Session session) throws IOException, EncodeException {
		session.setMaxBinaryMessageBufferSize(698450000);
		sessions.add(session);
	} // whenOpening

	@OnMessage
	public void processVideo(byte[] imageData, Session session) {
		System.out.println("INsite process Video");
		try {
			// Wrap a byte array into a buffer
			ByteBuffer buf = ByteBuffer.wrap(imageData);
			// imageBuffers.add(buf);

			for (Session session2 : sessions) {
				session2.getBasicRemote().sendBinary(buf);
			} // for

		} catch (Throwable ioe) {
			System.out.println("Error sending message " + ioe.getMessage());
		} // try-catch
	} // processVideo

	@OnClose
	public void whenClosing(Session session) {
		System.out.println("Goodbye !");
		sessions.remove(session);
	} // whenClosing

} // end class

package socket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

/**
 * Created by apple on 16/11/1.
 */
public interface WebSocketHandler {

    void afterConnectionEstablished(WebSocketSession session) throws Exception;
    void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception;
    void afterConnectionClosed(WebSocketSession socketSession, CloseStatus closeStatus) throws Exception;
    boolean supportsPartialMessages();
    void handleTransportError(WebSocketSession socketSession,Throwable throwable) throws Exception;

}

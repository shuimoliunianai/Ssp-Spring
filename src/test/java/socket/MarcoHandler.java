package socket;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;

/**
 * Created by apple on 16/11/1.
 */
public class MarcoHandler extends AbstractWebSocketHandler {

    private static final Logger logger = Logger.getLogger(MarcoHandler.class);

    protected void handleTextMessage(WebSocketSession socketSession, TextMessage message) throws Exception
    {
        logger.info("Received message: "+ message.getPayload());
        Thread.sleep(2000);
        socketSession.sendMessage(new TextMessage("Polo!"));
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("Connection established");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        logger.info("Connect closed. Status: " + status);
    }
}

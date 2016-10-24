package org.gameloft.www.lib.Logger;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by apple on 16/10/24.
 * 这个日后再增加分布式日志处理,其实
 * 主要接口在write那
 */
@Component
public class LoggerServer {

    /**
     * log4j
     */
    private Logger logger;

    /**
     * Jackson
     */
    private ObjectMapper objectMapper = new ObjectMapper();

    /**
     * HttpServlet
     */
    @Autowired
    private HttpServletRequest httpServletRequest;

    /**
     * init model
     */
    @PostConstruct
    public void init() {
        logger = Logger.getLogger(LoggerServer.class);
    }

    /**
     * destroy
     */
    @PreDestroy
    public void destroy() {
    }


    /**
     * format messgae
     */
    private String formatMessage(Object message) {
        String jsonMessage = "";
        if (message.getClass().equals(String.class)) {
            return String.valueOf(message);
        }
        synchronized (this) {
            try {
                jsonMessage = objectMapper.writeValueAsString(message);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return jsonMessage;
    }

    /**
     * Debug log
     */
    public void debug(Object message) {
        writeLog("ssp-debug", Level.DEBUG.getSyslogEquivalent(), this.formatMessage(message));
    }

    /**
     * Notice log
     */
    public void notice(Object message) {
        writeLog("ssp-notice", Level.INFO.getSyslogEquivalent(), this.formatMessage(message));
    }

    /**
     * Error Log
     */
    public void error(Object message) {
        writeLog("ssp-error", Level.ERROR.getSyslogEquivalent(), this.formatMessage(message));
    }

    /**
     * write log
     */
    public boolean writeLog(String tag, int level, String message) {
        if (tag.isEmpty() || message.isEmpty()) {
            return false;
        }
        synchronized (this)
        {
            String requestUrl = httpServletRequest.getRequestURI();
            StringBuffer messageLog = httpServletRequest.getRequestURL();
            messageLog.append("[").append(tag).append("]").append("[level:").append(level).append("]").append("[").append(requestUrl).append("]:").append(message);
            logger.info(messageLog);
        }
        return true;
    }

}

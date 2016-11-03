package config;

import org.apache.log4j.Logger;
import org.gameloft.www.socket.MarcoHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * Created by apple on 16/11/1.
 */
@Configuration
@EnableWebMvc
@EnableWebSocket
public class SocketConfiguration extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

    private Logger logger = Logger.getLogger(SocketConfiguration.class);

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        logger.info("register socket");
        registry.addHandler(systemWebSocketHandler(),"/marco").withSockJS();
    }

    @Bean
    public WebSocketHandler systemWebSocketHandler(){
        return new MarcoHandler();
    }


}

package config;

import config.redis.redisConfig;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@Import({redisConfig.class})
public class AppConfiguration {
    private Logger logger = Logger.getLogger(AppConfiguration.class);
    public AppConfiguration()
    {
        logger.info("Start init spring ");
    }


}



import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import redis.redisConfig;

import java.util.Locale;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@EnableTransactionManagement
@Import({redisConfig.class})
public class AppConfiguration {
    private Logger logger = Logger.getLogger(AppConfiguration.class);
    public AppConfiguration()
    {
        logger.info("Start init spring ");
    }

}

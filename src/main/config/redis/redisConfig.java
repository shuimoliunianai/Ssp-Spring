package redis;

/**
 * Created by apple on 16/9/21.
 */

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by ningzhen.ge on 2016/9/21.
 */
@Configuration
@PropertySource({"classpath:application.properties"})
public class redisConfig {
    @Autowired
    Environment env;

    private Logger logger = Logger.getLogger(redisConfig.class);

    public redisConfig()
    {

        logger.info("Start init testRedis  ");
    }
    @Bean
    public RedisConnectionFactory redisCf()
    {
        JedisConnectionFactory cf = new JedisConnectionFactory();
        cf.setHostName(env.getProperty("spring.redis.host"));
        cf.setDatabase(Integer.parseInt(env.getProperty("spring.redis.database")));
        cf.setUsePool(true);
        cf.setPoolConfig(getRedisPoolConfig());
        cf.setTimeout(Integer.parseInt(env.getProperty("spring.redis.timeout")));
        return cf;
    }

    @Bean
    public  JedisPoolConfig getRedisPoolConfig()
    {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxActive(Integer.parseInt(env.getProperty("spring.redis.pool.max-active")));
        config.setMaxWait(Integer.parseInt(env.getProperty("spring.redis.pool.max-wait")));
        config.setMaxIdle(Integer.parseInt(env.getProperty("spring.redis.pool.max-idle")));
        config.setMinIdle(Integer.parseInt(env.getProperty("spring.redis.pool.min-idle")));
        return config;
    }

    @Bean
    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory cf)
    {
        return new StringRedisTemplate(cf);
    }

    @Bean
    public StringRedisSerializer stringRedisSerializer()
    {
        return new StringRedisSerializer();
    }
}

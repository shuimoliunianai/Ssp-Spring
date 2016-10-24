package config;


import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.support.CompositeCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import redis.clients.jedis.JedisPoolConfig;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@PropertySource("classpath:redis.properties")
@ComponentScan(value = {"org.gameloft.www.lib"})
public class AppConfiguration {
    @Autowired
    Environment env;

    private Logger logger = Logger.getLogger(AppConfiguration.class);

    public AppConfiguration()
    {
        logger.info("Start init spring ");
    }

    /**
     * 配置数据库数据源链接池
     */
    @Bean
    public ComboPooledDataSource comboPooledDataSource() throws Exception
    {
        logger.info("Start init DB pool ");
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        Properties properties = new Properties();
        properties.load(new ClassPathResource("c3p0.properties").getInputStream());
        comboPooledDataSource.setProperties(properties);
        return comboPooledDataSource;
    }

    /**
     * 配置Hibernate
     */
    @Bean
    public LocalSessionFactoryBean localSessionFactoryBean(DataSource comboPooledDataSource) throws Exception
    {
        logger.info("Start init hibernate ");
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(comboPooledDataSource);
        Properties properties = new Properties();
        properties.load(new ClassPathResource("hibernate.properties").getInputStream());
        localSessionFactoryBean.setHibernateProperties(properties);
        return localSessionFactoryBean;
    }

    /**
     * 配置Reids
     */
    @Bean
    public RedisConnectionFactory redisCf()
    {
        logger.info("Start init redis ");
        JedisConnectionFactory cf = new JedisConnectionFactory();
        cf.setHostName(env.getProperty("spring.redis.host"));
        cf.setDatabase(Integer.parseInt(env.getProperty("spring.redis.database")));
        cf.setUsePool(true);
        cf.setPoolConfig(getRedisPoolConfig());
        cf.setTimeout(Integer.parseInt(env.getProperty("spring.redis.timeout")));
        return cf;
    }

    /**
     * 配置redis 链接池
     * @return
     */

    @Bean
    public JedisPoolConfig getRedisPoolConfig()
    {
        logger.info("Start init redis pool ");
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
        logger.info("Start init redis template ");
        return new StringRedisTemplate(cf);
    }

    @Bean
    public StringRedisSerializer stringRedisSerializer()
    {
        logger.info("Start init redis serialzer ");
        return new StringRedisSerializer();
    }

    /**
     * 缓存管理器
     */
    @Bean
    public CacheManager cacheManager(RedisTemplate redisTemplate)
    {
        logger.info("Start init Cache ");
        CompositeCacheManager compositeCacheManager = new CompositeCacheManager();
        List<CacheManager> managers = new ArrayList<CacheManager>();
        RedisCacheManager redisCacheManager = new RedisCacheManager(redisTemplate);
        redisCacheManager.setDefaultExpiration(3600);
        managers.add(redisCacheManager);
        compositeCacheManager.setCacheManagers(managers);
        return compositeCacheManager;
    }
}


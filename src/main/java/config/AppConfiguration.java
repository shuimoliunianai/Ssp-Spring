package config;


import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ShardedJedisPool;

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
     * Redis 线程池配置类
     * @return
     */
    @Bean
    public JedisPoolConfig jedisPoolConfig()
    {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxWaitMillis(Integer.valueOf(env.getProperty("spring.redis.pool.max-wait")));
        jedisPoolConfig.setMaxIdle(Integer.valueOf(env.getProperty("spring.redis.pool.max-idle")));
        jedisPoolConfig.setMaxTotal(Integer.valueOf(env.getProperty("spring.redis.pool.max-active")));
        jedisPoolConfig.setMinIdle(Integer.valueOf(env.getProperty("spring.redis.pool.min-idle")));
        jedisPoolConfig.setTestOnReturn(true);
        return jedisPoolConfig;
    }

    /**
     * Redis 集群
     */
    @Bean
    public ShardedJedisPool shardedJedisPool()
    {
        List<JedisShardInfo> redisList = new ArrayList<JedisShardInfo>();
        redisList.add(masterJedisShardInfo());
        redisList.add(slave1JedisShardInfo());
        redisList.add(slave2JedisShardInfo());
        return new ShardedJedisPool(jedisPoolConfig(),redisList);
    }

    /**
     * Mater Redis
     */
    @Bean
    public JedisShardInfo masterJedisShardInfo()
    {
        String host = env.getProperty("spring.redis.master.uri");
        return new JedisShardInfo(host);
    }

    /**
     * Slave1 Redis
     */
    @Bean
    public JedisShardInfo slave1JedisShardInfo()
    {
        String host = env.getProperty("spring.redis.slave1.uri");
        return new JedisShardInfo(host);
    }

    /**
     * Slave2 Redis
     */
    @Bean
    public JedisShardInfo slave2JedisShardInfo()
    {
        String host = env.getProperty("spring.redis.slave2.uri");
        return new JedisShardInfo(host);
    }

    /**
     * reids serializer
     * @return
     */
    @Bean
    public StringRedisSerializer stringRedisSerializer()
    {
        logger.info("Start init redis serialzer ");
        return new StringRedisSerializer();
    }
}


package org.gameloft.www.lib.Redis;

import com.mchange.lang.LongUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPipeline;

import javax.annotation.PreDestroy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by apple on 16/11/3.
 */
@Component
public class RedisClientTemplate {

    private static final Logger log = LoggerFactory.getLogger(RedisClientTemplate.class);

    @Autowired
    private RedisDataSource redisDataSource;

    /**
     * Logger
     */
    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(RedisClientTemplate.class);

    /**
     *
     */
    private ShardedJedisPipeline shardedJedisPipeline;

    /**
     * 设置单个值
     *
     * @param key
     * @param value
     * @return
     */
    public  String set(String key, String value) {
        String result = null;

        ShardedJedis shardedJedis = redisDataSource.getRedisClient();
        if (shardedJedis == null) {
            return null;
        }
        try {
            result = shardedJedis.set(key, value);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    /**
     * 获取单个值
     *
     * @param key
     * @return
     */
    public  String get(String key) {
        String result = null;
        ShardedJedis shardedJedis = redisDataSource.getRedisClient();
        if (shardedJedis == null) {
            return result;
        }

        try {
            result = shardedJedis.get(key);

        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    /**
     * 批量操作
     */
    public Boolean CallPipedOption(String key,String value ,long time)
    {
        if (StringUtils.isEmpty(key) || StringUtils.isEmpty(value))
        {
            return false;
        }
        ShardedJedisPipeline shardedJedisPipeline= redisDataSource.getRedisClient().pipelined();
        if (shardedJedisPipeline == null)
        {
            return false;
        }
        try{
            shardedJedisPipeline.hincrBy(key,value,time);
        }catch (Exception e)
        {
            logger.error(e.getMessage());
            return false;
        }
        return true;
    }

    @PreDestroy
    public void destroyMethod() throws Exception {
        try {
            shardedJedisPipeline.syncAndReturnAll();
        }catch (Exception e)
        {
            logger.error(e.getMessage());
        }
        System.out.println("destroyMethod 被执行");
    }
}

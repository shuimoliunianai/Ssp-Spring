package org.gameloft.www.lib.Redis;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

/**
 * Created by apple on 16/11/3.
 */
@Component
public class RedisDataSourceImpl implements RedisDataSource {

    private static final Logger logger = Logger.getLogger(RedisDataSourceImpl.class);

    /**
     * Reids pool
     */
    @Autowired
    ShardedJedisPool shardedJedisPool;

    /**
     * ThreadLocal
     */
    private static final ThreadLocal<ShardedJedis> threadLocal = new ThreadLocal<ShardedJedis>();

    /**
     * get Redis Client
     * @return
     */
    public  ShardedJedis getRedisClient() {
        ShardedJedis shardedJedis = threadLocal.get();
        if (shardedJedis == null)
        {
            try {
                shardedJedis = shardedJedisPool.getResource();
                threadLocal.set(shardedJedis);
            } catch (Exception e) {
                logger.error("getRedisClent error", e);
            }
        }
        return shardedJedis;
    }

}

package org.gameloft.www.lib.Redis;

import redis.clients.jedis.ShardedJedis;

/**
 * Created by apple on 16/11/3.
 */
public interface RedisDataSource {
    public abstract ShardedJedis getRedisClient();
}

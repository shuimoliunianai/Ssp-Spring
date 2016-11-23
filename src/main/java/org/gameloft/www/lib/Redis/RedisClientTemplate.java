package org.gameloft.www.lib.Redis;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPipeline;

import javax.annotation.PreDestroy;
import java.util.Set;

/**
 * Stats Handle
 * Created by ningzhen.ge on 2016/11/4.
 */
@Component
public class RedisClientTemplate {


    /**
     * pools
     */
    @Autowired
    private redisDataSourceImpl redisDataSource;

    /**
     * 批量处理客户端
     */
    private static ShardedJedisPipeline shardedJedisPipeline;

    /**
     * Logger
     */
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(RedisClientTemplate.class);

    /**
     * @param key   。
     * @param field 。
     * @param value 。
     * @return boolean 。
     */
    public Boolean hset(final String key, final String field, final String value) {
        if (StringUtils.isEmpty(key) || StringUtils.isEmpty(field) || StringUtils.isEmpty(value)) {
            return false;
        }
        ShardedJedis shardedJedis = redisDataSource.getRedisClient();
        if (shardedJedis == null) {
            return false;
        }
        try {
            shardedJedis.hset(key, field, value);
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * @param key   。
     * @param field 。
     * @return boolean 。
     */
    public String hget(final String key, final String field) {
        if (StringUtils.isEmpty(key) || StringUtils.isEmpty(field)) {
            return null;
        }
        ShardedJedis shardedJedis = redisDataSource.getRedisClient();
        if (shardedJedis == null) {
            return null;
        }
        try {
            String response = shardedJedis.hget(key, field);
            return response;
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        } finally {
            destroy();
        }
        return null;
    }

    /**
     * @param hash      。
     * @param arguments 。
     * @return true/false
     */
    public synchronized Boolean addHincrByToPipline(String hash, Set<String> arguments) {
        if (StringUtils.isEmpty(hash) || arguments.isEmpty()) {
            return false;
        }
        try {
            ShardedJedis shardedJedis = redisDataSource.getRedisClient();
            if (shardedJedis == null) {
                return false;
            }
            if (shardedJedisPipeline == null) {
                shardedJedisPipeline = shardedJedis.pipelined();
            }
            for (String argument : arguments) {
                shardedJedisPipeline.hincrBy(hash, argument, 1);
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * 当回收这个Bean时，执行先前的异步写入操作
     */
    @PreDestroy
    public void destroy() {
        if (shardedJedisPipeline != null) {
            shardedJedisPipeline.syncAndReturnAll();
        }
    }


}

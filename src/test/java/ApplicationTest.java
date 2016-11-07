import config.AppConfiguration;
import org.gameloft.www.lib.Logger.LoggerServer;
import org.gameloft.www.lib.Redis.RedisClientTemplate;
import org.gameloft.www.lib.Redis.RedisDataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;
import redis.clients.jedis.ShardedJedisPool;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by apple on 16/9/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfiguration.class)
public class ApplicationTest {

    @Autowired
    RedisClientTemplate redisClientTemplate;
    @Autowired
    ShardedJedisPool shardedJedisPool;
    @Test
    public void test() throws Exception {
//        for (int i=0;i<300;i++)
//        {
//            Thread thread = new ThreadTest(redisClientTemplate,i);
//            thread.start();
//        }
//        Thread.sleep(100000);
//        System.out.println("Acrive:"+shardedJedisPool.getNumActive());
//        System.out.println("Waite:"+shardedJedisPool.getNumWaiters());
//        Jedis jedis = new Jedis("127.0.0.1");
//        Pipeline pipeline = jedis.pipelined();
        for (int i = 0; i < 100000; i++) {
            redisClientTemplate.CallPipedOption("pppppppp","asdasdasd",1L);
        }
//        List<Object> results = pipeline.syncAndReturnAll();
//        jedis.disconnect();
//        ArrayList<Object> arrayList = new ArrayList<Object>();
//        arrayList.add("xxxxxx");
//        arrayList.add("yyyyyyy");
//        redisClientTemplate.CallPipedOption("set",arrayList);
        System.out.println("success");

    }
}

class ThreadTest extends Thread{
    RedisClientTemplate redisClientTemplate;
    int num = 0;
    public ThreadTest(RedisClientTemplate redisClientTemplate,int num)
    {
        this.redisClientTemplate = redisClientTemplate;
        this.num = num;
    }
    public void run()
    {
        while (true)
        {
            redisClientTemplate.set("a"+num, "abc"+Math.random());
            System.out.println("++"+Thread.currentThread().getName()+redisClientTemplate.get("a"+num));
        }
    }
}

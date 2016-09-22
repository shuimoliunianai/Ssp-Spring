import config.AppConfiguration;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.concurrent.TimeUnit;

/**
 * Created by apple on 16/9/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfiguration.class)
public class ApplicationTest {
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Test
    public void test() throws Exception {
        stringRedisTemplate.opsForValue().set("daozi3", "aaa",20,TimeUnit.SECONDS);
        Assert.assertEquals("aaa", stringRedisTemplate.opsForValue().get("daozi3"));
    }
}

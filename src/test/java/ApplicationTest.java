import config.AppConfiguration;
import org.hibernate.validator.HibernateValidator;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 * Created by apple on 16/9/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfiguration.class)
public class ApplicationTest {
    @Autowired
    StringRedisTemplate stringRedisTemplate;

    @Autowired
    ResourceBundleMessageSource resourceBundleMessageSource;
    @Test
    public void test() throws Exception {
        Object[] params = {"John", new GregorianCalendar().getTime()};
        String s = resourceBundleMessageSource.getMessage("payload.request.null",params,Locale.US);
        System.out.println(s);
    }
}

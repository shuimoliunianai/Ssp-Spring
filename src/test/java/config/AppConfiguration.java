package config;

import config.testRedis.redisConfig;
import org.apache.log4j.Logger;
import org.hibernate.validator.HibernateValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@EnableTransactionManagement
@Import({redisConfig.class})
public class AppConfiguration {

    private Logger logger = Logger.getLogger(AppConfiguration.class);
    public AppConfiguration()
    {
        logger.info("Start init spring ");
    }

    @Bean
    public LocalValidatorFactoryBean localValidatorFactoryBean()
    {
        LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
        localValidatorFactoryBean.setProviderClass(HibernateValidator.class);
        localValidatorFactoryBean.setValidationMessageSource(ResourceBundleMessageSource());
        return localValidatorFactoryBean;
    }

    @Bean
    public ResourceBundleMessageSource ResourceBundleMessageSource()
    {
        ResourceBundleMessageSource resourceBundleMessageSource = new ResourceBundleMessageSource();
        resourceBundleMessageSource.setBasename("messages");
        resourceBundleMessageSource.setUseCodeAsDefaultMessage(false);
        return resourceBundleMessageSource;
    }
}

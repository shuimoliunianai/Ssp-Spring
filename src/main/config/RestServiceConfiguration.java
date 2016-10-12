import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.gameloft.www.interceptors.RequestProcessingTimeInterceptor;
import org.gameloft.www.interceptors.i18nLanguageInterceptors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@EnableWebMvc
@ComponentScan("org.gameloft.www")
@ImportResource({"classpath:spring.xml"})
public class RestServiceConfiguration extends WebMvcConfigurerAdapter {
    private static Logger logger = LogManager.getLogger(RestServiceConfiguration.class);

    public RestServiceConfiguration()
    {
        logger.info("Init RestService ");
    }

    /**
     * 注册拦截器
     * @param registry
     */
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new RequestProcessingTimeInterceptor());
    }
}

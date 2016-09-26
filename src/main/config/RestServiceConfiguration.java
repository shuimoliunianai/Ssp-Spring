import interceptors.RequestProcessingTimeInterceptor;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by apple on 16/9/21.
 */
@Configuration
@EnableWebMvc
@ComponentScan("controller")
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

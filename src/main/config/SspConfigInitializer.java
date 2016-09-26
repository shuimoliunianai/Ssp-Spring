
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.util.Log4jConfigListener;

/**
/**
 * Created by apple on 16/9/21.
 */
public class SspConfigInitializer implements WebApplicationInitializer {

    protected Log logger;
    private boolean registerErrorPageFilter = true;
    protected AnnotationConfigWebApplicationContext rootContext;


    @Override
    public void onStartup(ServletContext servletContext) {
        this.logger = LogFactory.getLog(getClass());
        rootContext = new AnnotationConfigWebApplicationContext();

        initializeSpringConfig(servletContext);
        initializeSpringMVCConfig(servletContext);
        registerListener(servletContext);
    }


    /***
     * 初始化 项目配置
     * @param container
     */
    private void initializeSpringConfig(ServletContext container) {
        this.rootContext.register(AppConfiguration.class);
        container.addListener(new ContextLoaderListener(rootContext));
    }


    /**
     * 注册springMVC配置
     * @param container
     */
    private void initializeSpringMVCConfig(ServletContext container) {
        this.rootContext.register(RestServiceConfiguration.class);
        ServletRegistration.Dynamic dispatcher = container.addServlet("Dispatcher",
                new DispatcherServlet(rootContext));
        dispatcher.setLoadOnStartup(2);
        dispatcher.setAsyncSupported(true);
        dispatcher.addMapping("/*");
    }

    /**
     * 注册监听器
     * @param container
     */
    private void registerListener(ServletContext container) {
        container.addListener(RequestContextListener.class);
    }

}

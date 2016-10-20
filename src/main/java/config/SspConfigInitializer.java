package config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.DispatcherType;
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;
import java.util.EnumSet;

/**
/**
 * Created by apple on 16/9/21.
 */
public class SspConfigInitializer implements WebApplicationInitializer {

    protected Log logger;

    @Override
    public void onStartup(ServletContext servletContext) {
        this.logger = LogFactory.getLog(getClass());

        registerFilter(servletContext);
        initializeSpringConfig(servletContext);
        initializeSpringMVCConfig(servletContext);
        registerListener(servletContext);
    }


    /***
     * 初始化 项目配置
     * @param container
     */
    private void initializeSpringConfig(ServletContext container) {
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(AppConfiguration.class);
        container.addListener(new ContextLoaderListener(rootContext));
    }


    /**
     * 注册springMVC配置
     * @param container
     */
    private void initializeSpringMVCConfig(ServletContext container) {

        AnnotationConfigWebApplicationContext Context = new AnnotationConfigWebApplicationContext();
        Context.register(RestServiceConfiguration.class);
        ServletRegistration.Dynamic dispatcher = container.addServlet("Dispatcher", new DispatcherServlet(Context));
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


    /**
     * 注册过滤器
     */
    private void registerFilter(ServletContext context)
    {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setForceEncoding(true);
        characterEncodingFilter.setEncoding("UTF-8");
        javax.servlet.FilterRegistration.Dynamic filter = context.addFilter("encoding",characterEncodingFilter);
        filter.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/");
    }

}

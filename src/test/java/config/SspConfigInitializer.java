package config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

/**
/**
 * Created by apple on 16/9/21.
 */
public class SspConfigInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) {

        initializeSpringConfig(servletContext);
        initializeSpringMVCConfig(servletContext);
        registerListener(servletContext);
    }

    /***
     * 初始化 项目配置
     * @param container
     */
    private void initializeSpringConfig(ServletContext container) {
        // Create the 'root' Spring application context
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(AppConfiguration.class);
        // Manage the life cycle of the root application context
        container.addListener(new ContextLoaderListener(rootContext));
    }


    /**
     * 注册springMVC配置
     * @param container
     */
    private void initializeSpringMVCConfig(ServletContext container) {
        // Create the spring rest servlet's Spring application context
        AnnotationConfigWebApplicationContext dispatcherContext = new AnnotationConfigWebApplicationContext();
        dispatcherContext.register(RestServiceConfiguration.class);

        // Register and map the spring rest servlet
        ServletRegistration.Dynamic dispatcher = container.addServlet("SpringMvc",
                new DispatcherServlet(dispatcherContext));
        dispatcher.setLoadOnStartup(2);
        dispatcher.setAsyncSupported(true);
        dispatcher.addMapping("/*");
    }

    private void registerListener(ServletContext container) {
        container.addListener(RequestContextListener.class);
    }

}

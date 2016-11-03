package config;

import RMI.SpitterService;
import RMI.SpitterServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.remoting.rmi.RmiProxyFactoryBean;
import org.springframework.remoting.rmi.RmiServiceExporter;

/**
 * Created by apple on 16/10/26.
 */
public class TestAppConfiguration {

    @Bean
    public SpitterService spitterService()
    {
        return new SpitterServiceImpl();
    }

    @Bean
    public RmiServiceExporter rmiServiceExporter(SpitterService spitterService)
    {
        RmiServiceExporter rmiServiceExporter = new RmiServiceExporter();
        rmiServiceExporter.setService(spitterService);
        rmiServiceExporter.setServiceName("SpitterService");
        rmiServiceExporter.setServiceInterface(SpitterService.class);
        rmiServiceExporter.setRegistryPort(1199);
        return rmiServiceExporter;
    }
    @Bean
    public RmiProxyFactoryBean spitterClientService()
    {
        RmiProxyFactoryBean rmiProxy = new RmiProxyFactoryBean();
        rmiProxy.setServiceUrl("rmi://127.0.0.1:1199/SpitterService");
        rmiProxy.setServiceInterface(SpitterService.class);
        return rmiProxy;
    }
}

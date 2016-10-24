package org.gameloft.www.lib.Util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Created by apple on 16/10/24.
 * Auth bu Daozi
 */
public class SpringUtil implements ApplicationContextAware {
    /**
     * Application context
     */
    private static  ApplicationContext applicationContext;

    /**
     * set application context
     * @param context
     * @throws Exception
     */
    public void setApplicationContext(ApplicationContext context)  throws BeansException
    {
        SpringUtil.applicationContext = context;
    }

    /**
     * get application context
     */
    public static ApplicationContext getApplicationContext()
    {
        return applicationContext;
    }
}

package org.gameloft.www.interceptors;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.logging.log4j.ThreadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * Created by apple on 16/10/12.
 */
public class i18nLanguageInterceptors extends HandlerInterceptorAdapter {
    private static final Logger logger = LogManager.getLogger(i18nLanguageInterceptors.class);

    @Autowired
    SessionLocaleResolver sessionLocaleResolver;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        sessionLocaleResolver.setLocale(request,response, Locale.ENGLISH);
        return true;
    }
}

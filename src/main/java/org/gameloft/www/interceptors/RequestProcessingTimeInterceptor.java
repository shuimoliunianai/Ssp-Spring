package org.gameloft.www.interceptors;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.ThreadContext;
/**
 * Created by apple on 16/9/26.
 */
public class RequestProcessingTimeInterceptor extends HandlerInterceptorAdapter {
    private static final Logger logger = LogManager.getLogger(RequestProcessingTimeInterceptor.class);

    /**
     * 拦截器预处理
     * 记录请求时间
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        long startTime = System.currentTimeMillis();
        request.setAttribute("startTime",startTime);
        ThreadContext.put("request_id", "12345");
        return true;
    }

    /**
     * 返回线程总运行的时间
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(
            HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        long startTime = (Long) request.getAttribute("startTime");
        logger.info("["+request.getRequestURL().toString()+"] Request Time: "+(System.currentTimeMillis() - startTime) + "ms ");
    }
}

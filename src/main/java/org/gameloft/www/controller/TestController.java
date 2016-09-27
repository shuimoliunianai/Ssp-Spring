package org.gameloft.www.controller;

import org.gameloft.www.model.Response;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by apple on 16/9/26.
 */
@RestController
public class TestController {
    private static Logger logger = Logger.getLogger(TestController.class);
    @RequestMapping(
            value = {"/test"},
            method = {RequestMethod.GET}
    )
    public void test()
    {
        System.out.println("hello");
    }
    @RequestMapping(
            value = {"/"},
            method = {RequestMethod.GET}
    )
    public Response index()
    {
        Response response = new Response();
        response.setContent("false request");
        return response;
    }
}

package controller;

import model.TestModel;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public TestModel index()
    {
        TestModel testModel = new TestModel();
        testModel.setName("daozi");
        testModel.setAge("12");
        return testModel;
    }
}

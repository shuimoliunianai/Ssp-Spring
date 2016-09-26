package controller;

import model.TestModel;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by apple on 16/9/26.
 */
@RestController
@RequestMapping({"/partners"})
public class PartnersController {

    @RequestMapping(
            value = {"/getAdvertisement"},
            method = {RequestMethod.POST},
            produces = {"application/json"}
    )
    public void getAdvertisement(@RequestBody TestModel test)
    {
        System.out.println(test.toString());
    }
}

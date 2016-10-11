package org.gameloft.www.controller;

import org.apache.log4j.Logger;
import org.gameloft.www.handles.PartnerHandle;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Payload;
import org.gameloft.www.model.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by apple on 16/9/26.
 */
@RestController
@RequestMapping({"/partners"})
public class PartnersController {

    private static final Logger logger = Logger.getLogger(PartnersController.class);
    @RequestMapping(
            value = {"/getAdvertisement"},
            method = {RequestMethod.POST},
            produces = {"application/json"}
    )
    public void getAdvertisement(@Valid  @RequestBody Payload payload) {
//        PartnerResponse partnerResponse = new PartnerResponse();
//        PartnerHandle partnerHandle = new PartnerHandle(payload.getPartners().get(0).getName(),payload.getRequest());
//        partnerHandle.call();
        }

}

package org.gameloft.www.abstracts;

import org.gameloft.www.interfaces.PartnerInterface;
import org.gameloft.www.model.PartnerRequest;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Request;

/**
 * Created by apple on 16/9/27.
 */
public class PartnerAbstract implements PartnerInterface {

    public PartnerAbstract() {
    }
    @Override
    public PartnerRequest prepareRequest(Request request) {
        return null;
    }

    @Override
    public PartnerResponse processResponse(String response) {
        return null;
    }


}

package org.gameloft.www.partners.inmobi;

import org.gameloft.www.abstracts.PartnerAbstract;
import org.gameloft.www.model.PartnerRequest;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Request;
import org.springframework.stereotype.Component;

/**
 * Created by apple on 16/9/27.
 */
@Component
public class inmobiPartner extends PartnerAbstract {

    public inmobiPartner() {
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

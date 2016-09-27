package org.gameloft.www.interfaces;

import org.gameloft.www.model.PartnerRequest;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Request;

/**
 * Created by apple on 16/9/27.
 */
public interface PartnerInterface {

    PartnerRequest prepareRequest(Request var1);

    PartnerResponse processResponse(String var1);

}

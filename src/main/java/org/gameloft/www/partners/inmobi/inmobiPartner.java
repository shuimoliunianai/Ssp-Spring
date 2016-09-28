package org.gameloft.www.partners.inmobi;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.openrtb.OpenRtb;
import org.gameloft.www.abstracts.PartnerAbstract;
import org.gameloft.www.lib.v23.BidRequest;
import org.gameloft.www.lib.v23.BidResponse;
import org.gameloft.www.model.PartnerRequest;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Request;
import org.springframework.stereotype.Component;

import java.util.HashMap;

/**
 * Created by apple on 16/9/27.
 */
@Component
public class inmobiPartner extends PartnerAbstract {

    public inmobiPartner() {
    }

    public PartnerRequest prepareRequest(Request request) {
        return new PartnerRequest("http://www.test.com", "POST", (new BidRequest(request)).jsonSerialize());
    }

    public PartnerResponse processResponse(String response) {
        ObjectMapper objectMapper = new ObjectMapper();
        InmobiResponse inmobiResponse = new InmobiResponse();
        try{
             inmobiResponse =objectMapper.readValue(response,InmobiResponse.class);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
//        BidResponse bidResponse = new BidResponse(response);
//        OpenRtb.BidResponse.SeatBid.Bid bid = bidResponse.getResponseObject().getSeatbid(0).getBid(0);
//        String adm = null;
//        String nurl = null;
//        if(bid.hasAdm()) {
//            adm = bid.getAdm();
//        }
//
//        if(bid.hasNurl()) {
//            nurl = bid.getNurl();
//        }

        return new PartnerResponse("success", Double.valueOf(100.00), inmobiResponse.getContent(), "www.test.com", this);
    }

    public String parseResponse(PartnerResponse partnerResponse) {
        HashMap model = new HashMap();
        model.put("markup", partnerResponse.getContent());
        model.put("overlay", "no");
        return this.getRenderingService().renderTemplate("image.vm", model);
    }
}

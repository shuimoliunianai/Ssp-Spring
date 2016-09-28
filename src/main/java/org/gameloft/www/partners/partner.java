//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.ssp.partners.netadge;

import com.google.openrtb.OpenRtb.BidResponse.SeatBid.Bid;
import java.util.HashMap;
import org.gameloft.ssp.core.abstracts.AbstractPartner;
import org.gameloft.ssp.core.lib.openrtb.v23.BidRequest;
import org.gameloft.ssp.core.lib.openrtb.v23.BidResponse;
import org.gameloft.ssp.core.models.PartnerRequest;
import org.gameloft.ssp.core.models.PartnerResponse;
import org.gameloft.ssp.core.models.Request;

public class Partner extends AbstractPartner {
    public Partner() {
    }

    public PartnerRequest prepareRequest(Request request) {
        return new PartnerRequest("http://us.netadge.com/rtb/gamelofttest", "POST", (new BidRequest(request)).jsonSerialize());
    }

    public PartnerResponse processResponse(String response) {
        BidResponse bidResponse = new BidResponse(response);
        Bid bid = bidResponse.getResponseObject().getSeatbid(0).getBid(0);
        String adm = null;
        String nurl = null;
        if(bid.hasAdm()) {
            adm = bid.getAdm();
        }

        if(bid.hasNurl()) {
            nurl = bid.getNurl();
        }

        return new PartnerResponse("success", Double.valueOf(bid.getPrice()), adm, nurl, this);
    }

    public String parseResponse(PartnerResponse partnerResponse) {
        HashMap model = new HashMap();
        model.put("markup", partnerResponse.getContent());
        model.put("overlay", "no");
        return this.getRenderingService().renderTemplate("image.vm", model);
    }
}

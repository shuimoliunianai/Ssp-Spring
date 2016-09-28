//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.lib.v23;

import com.google.openrtb.json.OpenRtbJsonFactory;

import java.io.IOException;

public class BidResponse {
    private com.google.openrtb.OpenRtb.BidResponse responseObject;

    public BidResponse(String response) {
        this.responseObject = this.jsonDeserialize(response);
    }

    private com.google.openrtb.OpenRtb.BidResponse jsonDeserialize(String jsonResp) {
        OpenRtbJsonFactory openRtbJsonFactory = OpenRtbJsonFactory.create();
        com.google.openrtb.OpenRtb.BidResponse bidResponse = null;

        try {
            bidResponse = openRtbJsonFactory.newReader().readBidResponse(jsonResp);
        } catch (IOException var5) {
            var5.printStackTrace();
        }

        return bidResponse;
    }

    public com.google.openrtb.OpenRtb.BidResponse getResponseObject() {
        return this.responseObject;
    }
}

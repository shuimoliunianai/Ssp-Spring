//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.model;

import org.gameloft.www.interfaces.PartnerInterface;

public class PartnerResponse {
    private String status = "failed";
    private Double price = Double.valueOf(0.0D);
    private String content = "";
    private String nurl = "";
    private PartnerInterface partnerObject = null;

    public PartnerResponse() {
    }

    public PartnerResponse(String status) {
        this.status = status;
    }

    public PartnerResponse(String status, Double price, String content) {
        this.status = status;
        this.price = price;
        this.content = content;
    }

    public PartnerResponse(String status, Double price, String content, String nurl, PartnerInterface partnerObject) {
        this.status = status;
        this.price = price;
        this.content = content;
        this.nurl = nurl;
        this.partnerObject = partnerObject;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getPrice() {
        return this.price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNurl() {
        return this.nurl;
    }

    public void setNurl(String nurl) {
        this.nurl = nurl;
    }

    public PartnerInterface getPartnerObject() {
        return this.partnerObject;
    }

    public void setPartnerObject(PartnerInterface partnerObject) {
        this.partnerObject = partnerObject;
    }
}

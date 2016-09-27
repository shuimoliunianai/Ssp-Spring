//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.model;

public class PartnerRequest {
    private String url;
    private String method;
    private String content;

    public PartnerRequest(String url, String method, String content) {
        this.url = url;
        this.method = method;
        this.content = content;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMethod() {
        return this.method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

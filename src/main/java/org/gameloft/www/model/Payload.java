//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.model;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Scope("request")
@JsonInclude(Include.NON_NULL)
@JsonPropertyOrder({"partners", "request"})
public class Payload {
    @JsonProperty("partners")
    private List<Partner> partners = new ArrayList<Partner>();
    @JsonProperty("request")
    private Request request;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    public Payload() {
    }

    @JsonProperty("partners")
    public List<Partner> getPartners() {
        return this.partners;
    }

    @JsonProperty("partners")
    public void setPartners(List<Partner> partners) {
        this.partners = partners;
    }

    @JsonProperty("request")
    public Request getRequest() {
        return this.request;
    }

    @JsonProperty("request")
    public void setRequest(Request request) {
        this.request = request;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }
}

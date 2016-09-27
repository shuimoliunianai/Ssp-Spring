//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.model;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@JsonInclude(Include.NON_NULL)
@JsonPropertyOrder({"name", "priority", "creative_ids"})
public class Partner {
    @JsonProperty("name")
    private String name;
    @JsonProperty("priority")
    private Integer priority;
    @JsonProperty("creative_ids")
    private List<Integer> creativeIds = new ArrayList<Integer>();
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String,Object>();

    public Partner() {
    }

    @JsonProperty("name")
    public String getName() {
        return this.name;
    }

    @JsonProperty("name")
    public void setName(String name) {
        this.name = name;
    }

    @JsonProperty("priority")
    public Integer getPriority() {
        return this.priority;
    }

    @JsonProperty("priority")
    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @JsonProperty("creative_ids")
    public List<Integer> getCreativeIds() {
        return this.creativeIds;
    }

    @JsonProperty("creative_ids")
    public void setCreativeIds(List<Integer> creativeIds) {
        this.creativeIds = creativeIds;
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

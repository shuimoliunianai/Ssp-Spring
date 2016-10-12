package org.gameloft.www.partners.inmobi;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by apple on 16/9/28.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class InmobiResponse {
    @JsonProperty
    private String status;
    @JsonProperty
    private String content;

    public String getStatus() {
        return status;
    }
    @JsonProperty
    public void setStatus(String status) {
        this.status = status;
    }
    @JsonProperty
    public String getContent() {
        return content;
    }
    @JsonProperty
    public void setContent(String content) {
        this.content = content;
    }
}

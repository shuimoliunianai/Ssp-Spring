package org.gameloft.www.model;
import org.springframework.validation.annotation.*;
/**
 * Created by apple on 16/9/27.
 */
public class Response {
    private String status = "failed";
    private String content = "";

    public Response() {
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

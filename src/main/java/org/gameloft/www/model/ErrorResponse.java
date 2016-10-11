package org.gameloft.www.model;

/**
 * Created by apple on 16/10/11.
 */
public class ErrorResponse {

    private boolean status;

    private int code;

    private String description;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public int getCode()
    {
        return code;
    }
}

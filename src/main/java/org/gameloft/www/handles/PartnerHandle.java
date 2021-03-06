package org.gameloft.www.handles;

import org.gameloft.www.interfaces.PartnerInterface;
import org.gameloft.www.lib.HttpClient;
import org.gameloft.www.model.PartnerRequest;
import org.gameloft.www.model.PartnerResponse;
import org.gameloft.www.model.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * Created by apple on 16/9/27.
 */
@Component
@Scope("request")
public class PartnerHandle {

    /**
     * redis
     */
    @Autowired
    StringRedisTemplate stringRedisTemplate;

    /**
     *
     */
    private Request request;

    /**
     * partnerName
     */
    private String partnerName;

    /**
     * partnerClass
     */
    private Class<?> partnerClass;

    /**
     * partnerObject
     */
    private Object partnerObject;

    /**
     * construct
     */
    public PartnerHandle(String partnerName,Request request)
    {
        this.partnerName = partnerName;
        this.request = request;
    }
    /**
     * prepareRequest
     */
    public PartnerRequest prepareRequest()
    {
        if (this.partnerClass == null || this.partnerObject == null)
        {
            this.loadClass();
        }
        PartnerRequest prepareRequest = null;
        try{
            Method method = this.partnerClass.getMethod("prepareRequest", Request.class);
            prepareRequest = (PartnerRequest)method.invoke(this.partnerObject, this.request);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return prepareRequest;
    }

    /**
     * processResponse
     */
    public PartnerResponse processResponse(String response)
    {
        if(this.partnerClass == null || this.partnerObject == null) {
            this.loadClass();
        }

        PartnerResponse processedResponse = null;

        try {
            Method e = this.partnerClass.getMethod("processResponse", new Class[]{String.class});
            processedResponse = (PartnerResponse)e.invoke(this.partnerObject, new Object[]{response});
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return processedResponse;
    }

    /**
     * load Class
     */
    public void loadClass()
    {
        try{
            this.partnerClass = Class.forName(this.getClassDirectory());
            this.partnerObject = this.partnerClass.newInstance();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * get class path
     */
    public String getClassDirectory()
    {
        return "org.gameloft.www.partners." + this.partnerName.toLowerCase()+"."+ this.partnerName.toLowerCase() + "Partner";
    }
    /**
     * call
     */
    public PartnerResponse call()
    {
        PartnerRequest partnerRequest = this.prepareRequest();
        String response = null;
        try {
            response = HttpClient.post(partnerRequest.getUrl(), partnerRequest.getContent());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return response != null && !response.isEmpty()?this.processResponse(response):new PartnerResponse("failed");
    }
}

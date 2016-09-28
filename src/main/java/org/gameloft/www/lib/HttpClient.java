//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.lib;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.IOException;

public class HttpClient {
    public HttpClient() {
    }

    public static String post(String url, String payload) throws Throwable {
        String responseBody = null;

        try {
            CloseableHttpClient e = HttpClients.createDefault();
            Throwable var4 = null;

            try {
                HttpPost httpPost = new HttpPost(url);
                httpPost.setEntity(new StringEntity(payload, "utf8"));
                httpPost.setHeader("Content-type", "application/json");
                BasicResponseHandler responseHandler = new BasicResponseHandler();
                responseBody = (String)e.execute(httpPost, responseHandler);
            } catch (Throwable var15) {
                var4 = var15;
                throw var15;
            } finally {
                if(e != null) {
                    if(var4 != null) {
                        try {
                            e.close();
                        } catch (Throwable var14) {
                            //noinspection Since15
                            var14.addSuppressed(var4);
                        }
                    } else {
                        e.close();
                    }
                }

            }
        } catch (IOException var17) {
            var17.printStackTrace();
        }

        return responseBody;
    }
}

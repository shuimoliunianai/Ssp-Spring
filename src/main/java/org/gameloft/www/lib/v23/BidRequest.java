//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.lib.v23;

import com.google.openrtb.OpenRtb.BidRequest.*;
import com.google.openrtb.OpenRtb.BidRequest.Content.ContentContext;
import com.google.openrtb.OpenRtb.BidRequest.Device.ConnectionType;
import com.google.openrtb.OpenRtb.BidRequest.Device.DeviceType;
import com.google.openrtb.OpenRtb.BidRequest.Imp.Banner;
import com.google.openrtb.OpenRtb.CreativeAttribute;
import com.google.openrtb.json.OpenRtbJsonFactory;
import org.gameloft.www.model.Request;

import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

public class BidRequest {
    private CreativeAttribute[] battr;
    private String[] bcat;
    private String[] mimes;
    private Builder builder;

    public BidRequest(Request request) {
        this.battr = new CreativeAttribute[]{CreativeAttribute.AUDIO_AUTO_PLAY, CreativeAttribute.AUDIO_USER_INITIATED, CreativeAttribute.EXPANDABLE_AUTOMATIC, CreativeAttribute.PROVOCATIVE_OR_SUGGESTIVE, CreativeAttribute.ANNOYING, CreativeAttribute.SURVEYS, CreativeAttribute.USER_INTERACTIVE, CreativeAttribute.WINDOWS_DIALOG_OR_ALERT_STYLE};
        this.bcat = new String[]{"IAB7", "IAB9-9", "IAB13", "IAB14-2", "IAB14-3", "IAB15-5", "IAB23", "IAB24", "IAB25", "IAB26"};
        this.mimes = new String[]{"text/html", "image/gif", "image/jpeg", "image/png"};
        this.setBuilder(request);
    }

    private Boolean attributeExists(String attribute) {
        return Boolean.valueOf(!attribute.equalsIgnoreCase("na"));
    }

    private void setBuilder(Request request) {
        this.builder = com.google.openrtb.OpenRtb.BidRequest.newBuilder().setId(UUID.randomUUID().toString()).addImp(Imp.newBuilder().setId("1").setBidfloor(0.5D).setBidfloorcur("USD").setBanner(Banner.newBuilder().setW(320).setH(50).addAllBattr(Arrays.asList(this.battr)).addAllMimes(Arrays.asList(this.mimes))).setSecure(false)).setApp(App.newBuilder().setId(request.getProductId()).setName(request.getAppName()).setBundle(request.getPkgName()).addCat("IAB9-30").addCat("IAB19-6").addCat("IAB19-26").setPaid(false).setPublisher(Publisher.newBuilder().setId("GAMELOFT").setName("GAMELOFT").setDomain("gameloft.com").addCat("IAB9-30").addCat("IAB19-6").addCat("IAB19-26")).setContent(Content.newBuilder().setContext(ContentContext.GAME).addCat("IAB9-30").addCat("IAB19-6").addCat("IAB19-26"))).setDevice(Device.newBuilder().setUa(request.getUserAgent()).setLmt(true).setIp(request.getIp()).setDevicetype(DeviceType.TABLET).setOs(request.getOs()).setOsv(request.getFirmware()).setHwv(request.getDeviceModel()).setLanguage(request.getDeviceLang()).setCarrier(request.getCarrierName()).setConnectiontype(ConnectionType.CELL_UNKNOWN).setIfa("dadsadasd12131321").setDidsha1("dasdadasda1231231").setDidmd5("dasdada1231213").setDpidsha1("dasdadas1231231").setDpidmd5("adsadasda123123").setGeo(Geo.newBuilder().setCountry("FRA"))).setUser(User.newBuilder().setGender("male").setYob(1992)).setAt(AuctionType.SECOND_PRICE).addAllBcat(Arrays.asList(this.bcat)).setTest(true);
    }

    public Builder getBuilder() {
        return this.builder;
    }

    public String jsonSerialize() {
        OpenRtbJsonFactory openRtbJsonFactory = OpenRtbJsonFactory.create();
        String serializedJson = null;

        try {
            serializedJson = openRtbJsonFactory.newWriter().writeBidRequest(this.builder.build());
        } catch (IOException var4) {
            var4.printStackTrace();
        }

        return serializedJson;
    }
}

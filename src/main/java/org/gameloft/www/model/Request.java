//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.gameloft.www.model;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@JsonInclude(Include.NON_NULL)
@JsonPropertyOrder({"type", "fullscreen", "width", "height", "country", "user_agent", "os", "firmware", "pkg_name", "app_name", "aaid", "imei", "wma", "idfa", "hdidfv", "ip", "conn", "carrier_id", "carrier_name", "mcc", "mnc", "oid", "shopapp_id", "product_id", "device_lang", "device_model", "device_time", "pricing_model", "pricing_model_value", "pricing_currency", "gps_acc", "gps_lat", "gps_long", "device_type", "gender", "user_age", "game_orientation", "mraid"})
@Component
public class Request {
    @JsonProperty("type")
    private String type;
    @JsonProperty("fullscreen")
    private Integer fullscreen;
    @JsonProperty("width")
    private String width;
    @JsonProperty("height")
    private String height;
    @JsonProperty("country")
    private String country;
    @JsonProperty("user_agent")
    private String userAgent;
    @JsonProperty("os")
    private String os;
    @JsonProperty("firmware")
    private String firmware;
    @JsonProperty("pkg_name")
    private String pkgName;
    @JsonProperty("app_name")
    private String appName;
    @JsonProperty("aaid")
    private String aaid;
    @JsonProperty("imei")
    private String imei;
    @JsonProperty("wma")
    private String wma;
    @JsonProperty("idfa")
    private String idfa;
    @JsonProperty("hdidfv")
    private String hdidfv;
    @JsonProperty("ip")
    private String ip;
    @JsonProperty("conn")
    private String conn;
    @JsonProperty("carrier_id")
    private String carrierId;
    @JsonProperty("carrier_name")
    private String carrierName;
    @JsonProperty("mcc")
    private String mcc;
    @JsonProperty("mnc")
    private String mnc;
    @JsonProperty("oid")
    private String oid;
    @JsonProperty("shopapp_id")
    private String shopappId;
    @JsonProperty("product_id")
    private String productId;
    @JsonProperty("device_lang")
    private String deviceLang;
    @JsonProperty("device_model")
    private String deviceModel;
    @JsonProperty("device_time")
    private String deviceTime;
    @JsonProperty("pricing_model")
    private String pricingModel;
    @JsonProperty("pricing_model_value")
    private String pricingModelValue;
    @JsonProperty("pricing_currency")
    private String pricingCurrency;
    @JsonProperty("gps_acc")
    private String gpsAcc;
    @JsonProperty("gps_lat")
    private String gpsLat;
    @JsonProperty("gps_long")
    private String gpsLong;
    @JsonProperty("device_type")
    private String deviceType;
    @JsonProperty("gender")
    private String gender;
    @JsonProperty("user_age")
    private String userAge;
    @JsonProperty("game_orientation")
    private String gameOrientation;
    @JsonProperty("mraid")
    private String mraid;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    public Request() {
    }

    @JsonProperty("type")
    public String getType() {
        return this.type;
    }

    @JsonProperty("type")
    public void setType(String type) {
        this.type = type;
    }

    @JsonProperty("fullscreen")
    public Integer getFullscreen() {
        return this.fullscreen;
    }

    @JsonProperty("fullscreen")
    public void setFullscreen(Integer fullscreen) {
        this.fullscreen = fullscreen;
    }

    @JsonProperty("width")
    public String getWidth() {
        return this.width;
    }

    @JsonProperty("width")
    public void setWidth(String width) {
        this.width = width;
    }

    @JsonProperty("height")
    public String getHeight() {
        return this.height;
    }

    @JsonProperty("height")
    public void setHeight(String height) {
        this.height = height;
    }

    @JsonProperty("country")
    public String getCountry() {
        return this.country;
    }

    @JsonProperty("country")
    public void setCountry(String country) {
        this.country = country;
    }

    @JsonProperty("user_agent")
    public String getUserAgent() {
        return this.userAgent;
    }

    @JsonProperty("user_agent")
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    @JsonProperty("os")
    public String getOs() {
        return this.os;
    }

    @JsonProperty("os")
    public void setOs(String os) {
        this.os = os;
    }

    @JsonProperty("firmware")
    public String getFirmware() {
        return this.firmware;
    }

    @JsonProperty("firmware")
    public void setFirmware(String firmware) {
        this.firmware = firmware;
    }

    @JsonProperty("pkg_name")
    public String getPkgName() {
        return this.pkgName;
    }

    @JsonProperty("pkg_name")
    public void setPkgName(String pkgName) {
        this.pkgName = pkgName;
    }

    @JsonProperty("app_name")
    public String getAppName() {
        return this.appName;
    }

    @JsonProperty("app_name")
    public void setAppName(String appName) {
        this.appName = appName;
    }

    @JsonProperty("aaid")
    public String getAaid() {
        return this.aaid;
    }

    @JsonProperty("aaid")
    public void setAaid(String aaid) {
        this.aaid = aaid;
    }

    @JsonProperty("imei")
    public String getImei() {
        return this.imei;
    }

    @JsonProperty("imei")
    public void setImei(String imei) {
        this.imei = imei;
    }

    @JsonProperty("wma")
    public String getWma() {
        return this.wma;
    }

    @JsonProperty("wma")
    public void setWma(String wma) {
        this.wma = wma;
    }

    @JsonProperty("idfa")
    public String getIdfa() {
        return this.idfa;
    }

    @JsonProperty("idfa")
    public void setIdfa(String idfa) {
        this.idfa = idfa;
    }

    @JsonProperty("hdidfv")
    public String getHdidfv() {
        return this.hdidfv;
    }

    @JsonProperty("hdidfv")
    public void setHdidfv(String hdidfv) {
        this.hdidfv = hdidfv;
    }

    @JsonProperty("ip")
    public String getIp() {
        return this.ip;
    }

    @JsonProperty("ip")
    public void setIp(String ip) {
        this.ip = ip;
    }

    @JsonProperty("conn")
    public String getConn() {
        return this.conn;
    }

    @JsonProperty("conn")
    public void setConn(String conn) {
        this.conn = conn;
    }

    @JsonProperty("carrier_id")
    public String getCarrierId() {
        return this.carrierId;
    }

    @JsonProperty("carrier_id")
    public void setCarrierId(String carrierId) {
        this.carrierId = carrierId;
    }

    @JsonProperty("carrier_name")
    public String getCarrierName() {
        return this.carrierName;
    }

    @JsonProperty("carrier_name")
    public void setCarrierName(String carrierName) {
        this.carrierName = carrierName;
    }

    @JsonProperty("mcc")
    public String getMcc() {
        return this.mcc;
    }

    @JsonProperty("mcc")
    public void setMcc(String mcc) {
        this.mcc = mcc;
    }

    @JsonProperty("mnc")
    public String getMnc() {
        return this.mnc;
    }

    @JsonProperty("mnc")
    public void setMnc(String mnc) {
        this.mnc = mnc;
    }

    @JsonProperty("oid")
    public String getOid() {
        return this.oid;
    }

    @JsonProperty("oid")
    public void setOid(String oid) {
        this.oid = oid;
    }

    @JsonProperty("shopapp_id")
    public String getShopappId() {
        return this.shopappId;
    }

    @JsonProperty("shopapp_id")
    public void setShopappId(String shopappId) {
        this.shopappId = shopappId;
    }

    @JsonProperty("product_id")
    public String getProductId() {
        return this.productId;
    }

    @JsonProperty("product_id")
    public void setProductId(String productId) {
        this.productId = productId;
    }

    @JsonProperty("device_lang")
    public String getDeviceLang() {
        return this.deviceLang;
    }

    @JsonProperty("device_lang")
    public void setDeviceLang(String deviceLang) {
        this.deviceLang = deviceLang;
    }

    @JsonProperty("device_model")
    public String getDeviceModel() {
        return this.deviceModel;
    }

    @JsonProperty("device_model")
    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }

    @JsonProperty("device_time")
    public String getDeviceTime() {
        return this.deviceTime;
    }

    @JsonProperty("device_time")
    public void setDeviceTime(String deviceTime) {
        this.deviceTime = deviceTime;
    }

    @JsonProperty("pricing_model")
    public String getPricingModel() {
        return this.pricingModel;
    }

    @JsonProperty("pricing_model")
    public void setPricingModel(String pricingModel) {
        this.pricingModel = pricingModel;
    }

    @JsonProperty("pricing_model_value")
    public String getPricingModelValue() {
        return this.pricingModelValue;
    }

    @JsonProperty("pricing_model_value")
    public void setPricingModelValue(String pricingModelValue) {
        this.pricingModelValue = pricingModelValue;
    }

    @JsonProperty("pricing_currency")
    public String getPricingCurrency() {
        return this.pricingCurrency;
    }

    @JsonProperty("pricing_currency")
    public void setPricingCurrency(String pricingCurrency) {
        this.pricingCurrency = pricingCurrency;
    }

    @JsonProperty("gps_acc")
    public String getGpsAcc() {
        return this.gpsAcc;
    }

    @JsonProperty("gps_acc")
    public void setGpsAcc(String gpsAcc) {
        this.gpsAcc = gpsAcc;
    }

    @JsonProperty("gps_lat")
    public String getGpsLat() {
        return this.gpsLat;
    }

    @JsonProperty("gps_lat")
    public void setGpsLat(String gpsLat) {
        this.gpsLat = gpsLat;
    }

    @JsonProperty("gps_long")
    public String getGpsLong() {
        return this.gpsLong;
    }

    @JsonProperty("gps_long")
    public void setGpsLong(String gpsLong) {
        this.gpsLong = gpsLong;
    }

    @JsonProperty("device_type")
    public String getDeviceType() {
        return this.deviceType;
    }

    @JsonProperty("device_type")
    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    @JsonProperty("gender")
    public String getGender() {
        return this.gender;
    }

    @JsonProperty("gender")
    public void setGender(String gender) {
        this.gender = gender;
    }

    @JsonProperty("user_age")
    public String getUserAge() {
        return this.userAge;
    }

    @JsonProperty("user_age")
    public void setUserAge(String userAge) {
        this.userAge = userAge;
    }

    @JsonProperty("game_orientation")
    public String getGameOrientation() {
        return this.gameOrientation;
    }

    @JsonProperty("game_orientation")
    public void setGameOrientation(String gameOrientation) {
        this.gameOrientation = gameOrientation;
    }

    @JsonProperty("mraid")
    public String getMraid() {
        return this.mraid;
    }

    @JsonProperty("mraid")
    public void setMraid(String mraid) {
        this.mraid = mraid;
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

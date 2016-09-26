package model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by apple on 16/9/26.
 */
@Component
@Scope("request")
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({"namw","age"})
public class TestModel {
    @JsonProperty
    private String name;

    @JsonProperty
    private String age;

    @JsonProperty("name")
    public String getName() {
        return name;
    }

    @JsonProperty("name")
    public void setName(String name) {
        this.name = name;
    }

    @JsonProperty("age")
    public String getAge() {
        return age;
    }

    @JsonProperty("age")
    public void setAge(String age) {
        this.age = age;
    }
}

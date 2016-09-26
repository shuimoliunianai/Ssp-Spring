package json;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.junit.Before;

/**
 * Created by apple on 16/9/26.
 */
public class Test {

    private static Logger logger = Logger.getLogger(Test.class);
    @org.junit.Test
    public void test() throws Exception
    {
        TestJson testJson = new TestJson();
        testJson.setAge("12");
        testJson.setName("daozi");
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonString = objectMapper.writeValueAsString(testJson);
        logger.info(jsonString);
        String jsonTest2 = "{\"name\":\"daozi2\",\"age\":\"12\"}";
        objectMapper.readValue(jsonString, testJson.getClass());
        logger.info(testJson.toString());
    }

}
@JsonPropertyOrder({"name","age"})
@JsonInclude(JsonInclude.Include.NON_NULL)
class TestJson {
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

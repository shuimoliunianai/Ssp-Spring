package json;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.gameloft.www.model.Partner;
import org.gameloft.www.model.Payload;
import org.apache.log4j.Logger;

import java.io.InputStream;

/**
 * Created by apple on 16/9/26.
 */
public class Test {

    private static Logger logger = Logger.getLogger(Test.class);
    @org.junit.Test
    public void test() throws Exception
    {
        InputStream inputStream = ClassLoader.getSystemResourceAsStream("request.json");
        Payload payload = new Payload();
        ObjectMapper objectMapper = new ObjectMapper();
        Payload payload1 = objectMapper.readValue(inputStream,payload.getClass());
        logger.info(payload1);
    }

}

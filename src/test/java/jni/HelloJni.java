package jni;

import org.junit.Test;

/**
 * Created by apple on 16/10/22.
 */
public class HelloJni {

    @Test
    public  void test()
    {
        System.out.println(System.getProperty("java.library.path"));
    }
}

package jni;

/**
 * Created by apple on 16/10/11.
 */
public class LearnJNi {
    static {
        //System.loadLibrary("ljni");
        System.load("/web/maccode/idea/JNIProject/jni/liblearnjni.so");
    }
    public native void displayHelloWorld();
    public native int getInt();
    public native String getString();

    public void callFromJNI1()
    {
        System.out.println("callFromJNI1");
    }

    public void callFromJNI2(int k)
    {
        System.out.println("callFromJNI2:" + k);
    }

    public String callFromJNI3(int k,String text,byte[] bytes)
    {
        System.out.println("callFromJNI3:" + k + ",text:" + text);
        return "get it!";
    }

    public LearnJNi() {
        displayHelloWorld();
        System.out.println("getInt:" + getInt());
        System.out.println("getString:" + getString());
    }
}

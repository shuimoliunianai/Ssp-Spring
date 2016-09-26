package poolManager;

import org.junit.Test;

/**
 * Created by apple on 16/9/24.
 */
public class test {
    @Test
    public void test()
    {
//        MyThread mt1 = new MyThread();
//        MyThread mt2 = new MyThread();
//        MyThread mt3 = new MyThread();
//        mt1.start();
//        mt2.start();
//        mt3.start();
//        MyThread mt = new MyThread();
//        Thread mt1= new Thread(mt,"一号窗口");
//        Thread mt2= new Thread(mt,"二号窗口");
//        Thread mt3= new Thread(mt,"三号窗口");
//        mt1.start();
//        mt2.start();
//        mt3.start();
        Thread t1 = new Thread(new MyThread2(),"一号窗口");
        Thread t2 = new Thread(new MyThread2(),"二号窗口");
        Thread t3 = new Thread(new MyThread2(),"三号窗口");
        t1.start();
        t2.start();
        t3.start();

    }
}

class MyThread extends Thread{
    private  static  int ticket = 10;
    private String name;

    public synchronized void run(){
        for(int i =0;i<500;i++){
            if(ticket>0){
                System.out.println(Thread.currentThread().getName()+"卖票---->"+(ticket--));
            }
        }
    }
}

class MyThread2 implements Runnable{
    private int ticket = 10;
    private String name;

    public void run(){
        for(int i =0;i<500;i++){
            if(this.ticket>0){
                System.out.println(Thread.currentThread().getName()+"卖票---->"+(this.ticket--));
            }
        }
    }
}
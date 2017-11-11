/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 *
 * @author kysik
 */
public class MyLoggingInterceptor implements Interceptor {
    
    public MyLoggingInterceptor() {
    }
    
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public void init() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        String className = actionInvocation.getAction().getClass().getName();
        long startTime = System.currentTimeMillis();
        System.out.println("Before calling action: " + className);

        String result = actionInvocation.invoke();

        long endTime = System.currentTimeMillis();
        System.out.println("After calling action: " + className
                        + " Time taken: " + (endTime - startTime) + " ms");

        return result;
    }
    
}

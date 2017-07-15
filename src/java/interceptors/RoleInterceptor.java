/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import static org.apache.struts2.StrutsStatics.HTTP_REQUEST;

/**
 *
 * @author kysik
 */
public class RoleInterceptor implements Interceptor {
    private final Map<String, Object> interceptorConfigs = new HashMap();

    public Map<String, Object> getInterceptorConfigs() {
        return interceptorConfigs;
    }


    public void addInterceptorConfig(final String configName, final String configValue) {
        interceptorConfigs.put(configName, configValue);
    }

    public RoleInterceptor() {
    }
    
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public void init() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext context = actionInvocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
        HttpSession session = request.getSession(false);

        System.out.println("asdasdfasdfasdf");
        
        // session will almost *never* be null. Check for a valid user object.
        if (session == null) {
            return "role";
        }
        
        if (session.getAttribute("ROLE") == null) {
            return "role";
        }
        int role = (int) session.getAttribute("ROLE");
        int requiredRole = (int) interceptorConfigs.get("role");
        if (role != requiredRole) {
            return "role";
        }

        return actionInvocation.invoke();
    }
    
}

<%-- 
    Document   : login
    Created on : Jul 11, 2017, 10:32:56 AM
    Author     : kysik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Restaurant automation system</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <s:head/>
        <s:include value="layout/head.jsp"/>
    </head>
    <body>
        <div class="login-cotainer">
            <div class="login-block">
                <h1 class="float-left">Login</h1>
                <h3 class="float-right lose-focus">Restaurant automation system</h3>
                <div class="clear"></div>
                ${requestScope.MSG}
                <s:form action="login" theme="simple">
                    <s:textfield name="username" cssClass="input" placeholder="Username"/>
                    <s:password name="password" cssClass="input" placeholder="Username"/>
                    <s:submit label="Login" cssClass="btn btn-primary float-right"/>
                    <div class="clear"></div>
                </s:form>
            </div>
        </div>
    </body>
</html>

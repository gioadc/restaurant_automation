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
                <s:if test="%{#request.ERROR != null}">
                    <div class="alert alert-warning">
                        <s:property value="%{#request.ERROR}"/>
                    </div>
                </s:if>
                <s:form action="login" theme="simple">
                    <s:textfield name="username" cssClass="input" placeholder="Username"/>
                    <s:password name="password" cssClass="input" placeholder="Password"/>
                    <s:submit value="Login" cssClass="btn btn-primary float-right"/>
                    <div class="clear"></div>
                </s:form>
            </div>
        </div>
    </body>
</html>

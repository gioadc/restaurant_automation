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
    </head>
    <body>
        <div class="body">
            <h1>Login</h1>
            <h2>Restaurant automation system</h2>
            <s:form action="login">
                <s:textfield name="username" label="Username"/>
                <s:password name="password" label="Password"/>
                <s:submit label="Login"/>
            </s:form>
        </div>
    </body>
</html>

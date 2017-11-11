<%-- 
    Document   : serveError
    Created on : Jul 17, 2017, 2:13:51 PM
    Author     : kysik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error when getting table</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <div class="container">
                <div class="alert alert-warning">
                    There are something wrong!
                </div>
                <a href="index" class="btn btn-primary"> < Return to Serve Page</a>
            </div>
        </div>
    </body>
</html>

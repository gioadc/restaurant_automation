<%-- 
    Document   : addNewFood
    Created on : Jul 17, 2017, 2:40:29 PM
    Author     : THINHPHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Food</title>
        <s:head/>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <h1 class="text-center">Create New Food</h1>
            <div class="row">
                <div class="container-fluid text-center">
                    <div class="center-block container col-md-6 col-md-offset-3">
                        <s:form action="CreateNewFood" theme="simple">
                            <s:textfield name="name" placeholder="Food Name" required="true" minLength="3" cssClass="input"/>
                            <s:textfield name="price" type="number" min="0" required="true" placeholder="Price" cssClass="input"/>
                            <s:submit value="Create New Food" cssClass="btn btn-success"/>               
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

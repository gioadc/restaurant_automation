<%-- 
    Document   : createNewEmployee
    Created on : Jul 17, 2017, 2:57:59 PM
    Author     : KIETTTSE62520
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Employee</title>
        <s:head/>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <h1 class="text-center">Create New Employee</h1>
            <div class="row">
                <div class="container-fluid text-center">
                    <div class="center-block container col-md-6 col-md-offset-3">
                        <s:form action="createNewEmployee" theme="simple">
                            <s:textfield name="userID" placeholder="User ID" value="%{userID}" cssClass="input"/>
                            <s:password name="password" placeholder="Password" value="%{password}" cssClass="input"/>
                            <s:textfield name="name" placeholder="Name" value="%{name}" cssClass="input"/>
                            <s:textfield name="phone" placeholder="Phone" value="%{phone}" cssClass="input"/>
                            <s:textfield name="role" type="number" min="0" max="4" value="%{role}" placeholder="Role" cssClass="input"/>
                            <s:submit value="Create New Employee" cssClass="btn btn-success"/>
                            <s:reset value="Reset" cssClass="btn btn-primary"/>
                        </s:form><br/>
                        <s:if test="%{exception.message.contains('duplicate')}">
                            <p class="alert alert-warning">
                                <s:property value="userID"/> is existed !
                            </p>
                        </s:if>
                        <div class="clear"></div>
                    </div>
                        <div class="clear"></div>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : manageEmployee
    Created on : Jul 17, 2017, 12:45:40 PM
    Author     : KIETTTSE62520
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Employee</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <div class="row">
                <div class="container-fluid">
                    <s:include value="../layout/header.jsp"/>
                    <h2>List Employee <s:a href="createNewEmployee.jsp" cssClass="btn btn-success float-right">Create New Employee</s:a></h2>
                    <s:if test="%{employees != null}">
                        <table class="result-table text-center">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>User ID</th>
                                    <th>Password</th>
                                    <th>Full Name</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Remove</th>
                                    <th>Update</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:iterator var="dto" value="employees" status="counter">
                                    <s:form action="updateEmployee" theme="simple">
                                        <tr>
                                            <td><s:property value="%{#counter.count}"/></td>
                                            <td><s:property value="%{#dto.userID}"/></td>
                                            <td>
                                                <s:textfield name="password" value="%{#dto.password}" cssClass="input"/>
                                            </td>
                                            <td>
                                                <s:textfield name="name" value="%{#dto.name}" cssClass="input"/>
                                            </td>
                                            <td>
                                                <s:textfield name="phone" value="%{#dto.phone}" cssClass="input"/>
                                            </td>
                                            <td>
                                                <s:property value="%{#dto.roleString}"/>
                                            </td>
                                            <td><s:url var="deleteLink" action="deleteEmployee">
                                                    <s:param name ="id" value="%{#dto.userID}"/>
                                                </s:url>
                                                <s:a href="%{deleteLink}" cssClass="btn btn-danger">Delete</s:a></td>
                                            <td><s:submit value="Update" cssClass="btn btn-primary"/>
                                                <s:hidden name="userID" value="%{#dto.userID}"/>
                                            </td>
                                        </tr>
                                    </s:form>
                                </s:iterator>
                            </tbody>
                        </table>
                    </s:if>
                </div>
            </div>
        </div>
    </body>
</html>

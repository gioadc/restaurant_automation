<%-- 
    Document   : createOrder
    Created on : Jul 13, 2017, 8:58:36 PM
    Author     : KIETTTSE62520
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Management</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <h2>Menu Management<a href="createNewFood.jsp" class="btn btn-success float-right">Create New Food</a></h2>
            <s:if test="%{foods != null}">
                <table class="result-table text-center">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Food ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator var="dto" value="foods" status="counter">
                            <s:form action="UpdateFood" theme="simple">
                                <tr>
                                    <td>
                                        <s:property value="%{#counter.count}"/>
                                    </td>
                                    <td>
                                        <s:property value="%{#dto.itemID}"/>
                                        <s:hidden name="itemID" value="%{#dto.itemID}"/>
                                    </td>
                                    <td>
                                        <s:textfield name="name" value="%{#dto.name}" cssClass="input"/>
                                    </td>
                                    <td>
                                        <s:textfield name="price" value="%{#dto.price}" cssClass="input"/>
                                    </td>
                                    <td>
                                        <s:url var="delLink" value="DeleteFood">
                                            <s:param name="pk" value="%{#dto.itemID}"/>
                                        </s:url>
                                        <s:a href="%{delLink}" cssClass="btn btn-danger">Delete</s:a>
                                        </td>
                                        <td><s:submit value="Update" cssClass="btn btn-primary"/></td>
                                </tr>
                            </s:form>
                        </s:iterator>
                    </tbody>
                </table>
            </s:if>
        </div>
    </body>
</html>

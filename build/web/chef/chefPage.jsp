<%-- 
    Document   : chefPage
    Created on : Jul 13, 2017, 11:56:31 PM
    Author     : THINHPHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chef Page</title>
    </head>
    <body>

        <font color="red">
        Welcome, <s:property value="%{#session.USERID}"/>
        </font>
        <h1>Chef Page!</h1>

        <h2>Uncooked food List:</h2>
        <s:if test="%{listOrderDetails != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Order Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>          
                    <s:iterator var="dto" value="%{listOrderDetails}" status="counter">
                        <s:form action="UpdateChefId" theme="simple">
                            <tr>
                                <td>
                                    <s:property value="%{#counter.count}"/>
                                </td>
                                <td align="center">
                                    <s:property value="%{#dto.itemID}"/>

                                </td>
                                <td>
                                    <s:property value="%{#dto.name}"/>
                                </td>
                                <td align="center">
                                    <s:property value="%{#dto.orderTimeStr}"/>
                                </td>
                                <td>
                                    <s:submit value="Get Cooking"/>
                                    <s:hidden name="id" value="%{#dto.ID}"/>
                                </td>
                            </tr>
                        </s:form>
                    </s:iterator>
                </tbody>
            </table>
        </s:if>
        <s:if test="%{listOrderDetails == null}">
            <h3>Nothing in uncooked food List!!!</h3>
        </s:if>

        <h2>Cooking List:</h2>
        <s:if test="%{cookingList != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Order Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>          
                    <s:iterator var="dto" value="%{cookingList}" status="counter">
                        <s:form action="Complete" theme="simple">
                            <tr>
                                <td>
                                    <s:property value="%{#counter.count}"/>
                                </td>
                                <td align="center">
                                    <s:property value="%{#dto.itemID}"/>
                                </td>
                                <td>
                                    <s:property value="%{#dto.name}"/>
                                </td>
                                <td align="center">
                                    <s:property value="%{#dto.orderTimeStr}"/>
                                </td>
                                <td>
                                    <s:submit value="Done"/>
                                    <s:hidden name="id" value="%{#dto.ID}"/>
                                </td>
                            </tr>
                        </s:form>
                    </s:iterator>
                </tbody>
            </table>
        </s:if>   
        <s:if test="%{cookingList == null}">
            <h3>Nothing in cooking list!!!</h3>
        </s:if>

    </body>
</html>

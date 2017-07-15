<%-- 
    Document   : waiter
    Created on : Jul 13, 2017, 2:01:21 PM
    Author     : KIETTTSE62520
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Waiter</title>
    </head>
    <body>
        <h1>Waiter</h1>
        Welcome, <s:property value="%{#session.FULLNAME}"/><br/>
        <s:if test="%{tables != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Table ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <s:iterator var="dto" value="tables" status="counter">
                        <s:form action="serve" theme="simple">
                            <tr>
                                <td><s:property value="%{#counter.count}"/></td>
                                <td><s:property value="%{#dto.tableID}"/>
                                    <s:hidden name="tableID" value="%{#dto.tableID}"/>
                                </td>
                                <td><s:submit value="Serve"/></td>
                            </tr>
                        </s:form>
                    </s:iterator>

                </tbody>
            </table>

        </s:if>
        
        <s:if test="%{tables == null}">
            <h2><font color='red'>All of tables are serving</font></h2>
        </s:if>
    </body>
</html>

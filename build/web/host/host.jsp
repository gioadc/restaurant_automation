<%-- 
    Document   : host
    Created on : Jul 14, 2017, 1:45:09 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Host Page</title>
    </head>
    <body>
        Welcome <strong><s:property value="%{#session.FULLNAME}"/></strong> to page for Host !
        <h1>Page for Host</h1>
        <s:if test="%{#Error.equals('')}">
            <h1><s:property value="%{Error}"/></h1>
            <h1>1</h1>
        </s:if>
        <s:if test="%{list != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>TableID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator var="dto" value="list" status="counter">
                        <s:form action="update" method="POST" theme="simple">
                            <tr>
                                <td>
                                    <s:property value="%{#counter.count}" />
                                </td>
                                <td>
                                    <s:property value="%{#dto.tableID}" />
                                </td>
                                <td>
                                    <s:submit value="Book" />
                                    <s:hidden name="tableID" type="number" value="%{#dto.tableID}"/>
                            </td>
                        </s:form>
                    </s:iterator>
                    
                </tbody>
            </table>

        </s:if>
        <s:if test="%{list == null}">
            <h3>No table is empty now ! Please wait for a minute ! Thank you so much !</h3>
        </s:if>
    </body>
</html>

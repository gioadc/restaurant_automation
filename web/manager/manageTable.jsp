<%-- 
    Document   : manageTable
    Created on : Jul 17, 2017, 4:00:36 PM
    Author     : THINHPHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table Management</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <h1>Table Management</h1>
            <table class="result-table text-center">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Table ID</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator var="dto" value="%{allTableList}" status="counter">
                        <tr>
                            <td>
                                <s:property value="%{#counter.count}"/>
                            </td>
                            <td>
                                <s:property value="%{#dto.tableID}"/>
                            </td>
                            <td>
                                <s:property value="%{#dto.tableStatusStr}"/>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </body>
</html>

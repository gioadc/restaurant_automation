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
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <s:if test="%{#Error.equals('')}">
                <h1><s:property value="%{Error}"/></h1>
                <h1>1</h1>
            </s:if>
            <s:if test="%{list != null}">
                <table class="result-table">
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
                                <tr class="text-center">
                                    <td>
                                        #<s:property value="%{#counter.count}" />
                                    </td>
                                    <td>
                                        <s:property value="%{#dto.tableID}" />
                                    </td>
                                    <td>
                                        <s:submit value="Book" cssClass="btn btn-primary"/>
                                        <s:hidden name="tableID" type="number" value="%{#dto.tableID}"/>
                                    </td>
                                </s:form>
                            </s:iterator>

                    </tbody>
                </table>

            </s:if>
            <s:if test="%{list == null}">
                <div class="container">
                    <h3 class="alert alert-warning">No table is empty now ! Please wait for a minute ! Thank you so much !</h3>
                </div>
            </s:if>
        </div>
    </body>
</html>

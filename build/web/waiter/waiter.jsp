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
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <s:if test="%{tables != null}">
                <table class="result-table text-center">
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
                                    <td>#<s:property value="%{#counter.count}"/></td>
                                    <td><s:property value="%{#dto.tableID}"/>
                                        <s:hidden name="tableID" value="%{#dto.tableID}"/>
                                    </td>
                                    <td><s:submit value="Serve" cssClass="btn btn-primary"/></td>
                                </tr>
                            </s:form>
                        </s:iterator>

                    </tbody>
                </table>

            </s:if>

            <s:if test="%{tables == null}">
                <div class="container">
                    <h2 class="alert alert-success">All of tables are serving, enjoy your time! :)</h2>
                </div>
            </s:if>
        </div>
    </body>
</html>

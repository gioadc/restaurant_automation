<%-- 
    Document   : searchtable
    Created on : Jul 15, 2017, 1:14:46 PM
    Author     : Orion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bus boy</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body" >
            <s:include value="../layout/header.jsp"/>
            <div class="row">
                <div class="container-fluid">   
                    <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center">Dirty Table List</h2>
                        </div>
                        <s:if test="%{listDirtyTables != null}">
                            <table class="result-table text-center">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>TableID</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>          
                                    <s:iterator var="dto" value="%{listDirtyTables}" status="counter">
                                        <s:form action="ChangeTableStatus" theme="simple">
                                            <tr>
                                                <td>
                                                    <s:property value="%{#counter.count}"/>
                                                </td>
                                                <td>
                                                    <s:property value="%{#dto.tableID}"/>
                                                </td>
                                                <td>
                                                    <s:submit cssClass="btn btn-primary" value="Get Cleaning"/>
                                                    <s:hidden name="tableID" value="%{#dto.tableID}"/>
                                                </td>
                                            </tr>
                                        </s:form>
                                    </s:iterator>
                                </tbody>
                            </table>

                        </s:if>
                        <s:if test="%{listDirtyTables == null}">
                            <div class="container">
                                <h3 class="alert alert-success text-center">No table is dirty now ! <br>Very good !</h3>
                            </div>
                        </s:if>
                        <div class="divider"></div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center">Cleaning List:</h2>
                        </div>
                        <s:if test="%{listCleaningTables != null}">
                            <table class="result-table text-center">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>TableID</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>          
                                    <s:iterator var="dto" value="%{listCleaningTables}" status="counter">
                                        <s:form action="UpdateBusboyId" theme="simple">
                                            <tr>
                                                <td>
                                                    <s:property value="%{#counter.count}"/>
                                                </td>
                                                <td>
                                                    <s:property value="%{#dto.tableID}"/>
                                                </td>
                                                <td>
                                                    <s:submit cssClass="btn btn-success" value="Done"/>
                                                    <s:hidden name="tableID" value="%{#dto.tableID}"/>
                                                </td>
                                            </tr>
                                        </s:form>
                                    </s:iterator>
                                </tbody>
                            </table>

                        </s:if>   
                        <s:if test="%{listCleaningTables == null}">
                            <div class="container">
                                <h3 class="alert alert-success text-center">No table is need to cleaning now ! <br/>Good Job !</h3>
                            </div>
                        </s:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

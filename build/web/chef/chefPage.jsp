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
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>

            <div class="row">
                <div class="container-fluid">
                    <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center text-center">Uncooked food List</h2>
                        </div>
                        <table id="wait_list" class="result-table text-center
                               <s:if test="%{listOrderDetails == null}">empty-table</s:if>   
                               ">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Item Name</th>
                                    <th>Order Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:if test="%{listOrderDetails != null}">
                                    <s:iterator var="dto" value="%{listOrderDetails}" status="counter">
                                        <tr id="item_cooking_<s:property value="%{#dto.ID}"/>">
                                            <s:form action="UpdateChefId" theme="simple">
                                                <td>
                                                    <s:property value="%{#counter.count}"/>
                                                </td>
                                                <td>
                                                    <s:property value="%{#dto.name}"/>
                                                </td>
                                                <td>
                                                    <s:property value="%{#dto.orderTimeStr}"/>
                                                </td>
                                                <td>
                                                    <s:submit value="Cook" cssClass="btn btn-primary"/>
                                                    <s:hidden name="id" value="%{#dto.ID}"/>
                                                </td>
                                            </s:form>
                                        </tr>
                                    </s:iterator>
                                </s:if>

                            </tbody>
                        </table>
                        <s:if test="%{listOrderDetails == null}">
                            <div class="container empty-alert">
                                <h3 class="alert alert-success text-center">Nothing in uncooked food List!!!</h3>
                            </div>
                        </s:if>
                        
                        <div class="divider"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center">Cooking List</h2>
                        </div>
                        <s:if test="%{cookingList != null}">
                            <table id="cooking_list" class="result-table text-center">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Item Name</th>
                                        <th>Order Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>          
                                    <s:iterator var="dto" value="%{cookingList}" status="counter">
                                        <tr id="item_cooking_<s:property value="%{#dto.ID}"/>">
                                            <td>
                                                <s:property value="%{#counter.count}"/>
                                            </td>
                                            <td>
                                                <s:property value="%{#dto.name}"/>
                                            </td>
                                            <td>
                                                <s:property value="%{#dto.orderTimeStr}"/>
                                            </td>
                                            <td>
                                                <s:form action="Complete" theme="simple">
                                                    <s:submit value="Done" cssClass="btn btn-success"/>
                                                    <s:hidden name="id" value="%{#dto.ID}"/>
                                                </s:form>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </s:if>   
                        <s:if test="%{cookingList == null}">
                            <div class="container">
                                <h3 class="alert alert-success text-center">Nothing in cooking list!!!</h3>
                            </div>
                        </s:if>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <script src="../files/js/jquery.min.js"></script>
            <script src="../files/js/app.js"></script>
            <script type="text/javascript">
                $('document').ready(function () {
                    setTimeout(load_wait_list, 3000);
                });
            </script>
        </div>
    </body>
</html>

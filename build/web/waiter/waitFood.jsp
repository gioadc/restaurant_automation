<%-- 
    Document   : waitFood
    Created on : Jul 14, 2017, 7:02:59 PM
    Author     : KIETTTSE62520
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wait Food</title>
        <s:include value="../layout/head.jsp"/>
    </head>
<body>
    <div class="body">
        <s:include value="../layout/header.jsp"/>
        
        <div class="row">
            <div class="container-fluid">
                <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center">
                                Food Ordered
                                <s:url var="getFood" action="getFood"></s:url>
                                <s:a href="%{#getFood}" cssClass="btn btn-primary">Order More</s:a>
                            </h2>
                        </div>
                        
                        <s:if test="%{listFoodsOrdered == null}">
                            <h3 class="alert alert-warning">Nothing has been ordered!</h3>
                        </s:if>
                        <s:if test="%{listFoodsOrdered != null}">
                            <table class="result-table text-center">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:set var="total" value="0"/>
                                    <s:iterator var="dto" value="listFoodsOrdered" status="counter">
                                        <tr>
                                            <td><s:property value="%{#counter.count}"/></td>
                                            <td><s:property value="%{#dto.name}"/></td>
                                            <td><s:property value="%{#dto.price}"/></td>
                                            <td><s:property value="%{#dto.quantity}"/></td>
                                            <td class="text-right"><s:property value="#dto.price * #dto.quantity"/>
                                                <s:set var="total" value="#dto.price * #dto.quantity + #total"/>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                    <tr>
                                        <td colspan="4" class="text-right">Total</td>
                                        <td class="text-right"><s:property value="%{#total}"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" class="text-right">
                                            <s:url var="payBill" action="payBill"></s:url>
                                            <s:a href="%{#payBill}" cssClass="btn btn-success">Pay Bill</s:a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                        </s:if>
                    <div class="divider"></div>
                </div>
                    <div class="col-md-6">
                        <div class="container">
                            <h2 class="block-title text-center">
                                Ready food
                            </h2>
                        </div>
                        <table id="ready_list" class="result-table text-center
                        <s:if test="%{listFoodsReady == null}">empty-table</s:if>
                               ">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:if test="%{listFoodsReady != null}">
                                    <s:iterator var="dto" value="listFoodsReady" status="counter">
                                        <tr id="item_ready_<s:property value="%{#dto.ID}"/>">
                                            <td><s:property value="%{#counter.count}"/></td>
                                            <td><s:property value="%{#dto.name}"/></td>
                                            <td>
                                                <s:form action="takeFood" theme="simple">
                                                    <s:submit value="Take" cssClass="btn btn-success"/>
                                                    <s:hidden name="id" value="%{#dto.ID}"/>
                                                </s:form>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </s:if>
                            </tbody>
                        </table>
                    </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <script src="../files/js/jquery.min.js"></script>
    <script src="../files/js/app.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            setTimeout(load_ready_list, 3000);
        });
    </script>
</body>
</html>

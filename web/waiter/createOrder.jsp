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
        <title>Create New Order</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <s:if test="%{foods != null}">
                <div class="container">
                    <h2 class="block-title text-center">Menu</h2>
                </div>
                <table class="result-table text-center">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator var="dto" value="foods" status="counter">
                            <tr>
                                <s:form action="addToCart" theme="simple">
                                    <td>#<s:property value="%{#counter.count}"/></td>
                                    <td><s:property value="%{#dto.name}"/>
                                        <s:hidden name="name" value="%{#dto.name}"/>
                                    </td>
                                    <td><s:property value="%{#dto.price}"/>
                                        <s:hidden name="price" value="%{#dto.price}"/>
                                    </td>
                                    <td><s:textfield name="quantity" value="1" cssClass="input"/></td>
                                    <td>
                                        <s:hidden name="itemID" value="%{#dto.itemID}"/>
                                        <s:submit value="Order" cssClass="btn btn-primary"/>
                                    </td>
                                </s:form>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </s:if>

            <s:if test="%{#session.CART.items != null}">
                <div class="divider"></div>
                <div class="container">
                    <h2 class="block-title text-center">Your Order</h2>
                </div>
                <table class="result-table text-center">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:set var="total" value="0"/>
                        <s:iterator var="item" value="%{#session.CART.items}" status="counter">
                            <tr>
                                <s:form action="updateItem" theme="simple">
                                    <td>#<s:property value="%{#counter.count}"/></td>
                                    <td><s:property value="#item.value.name"/></td>
                                    <td><s:property value="#item.value.price"/></td>
                                    <td><s:textfield name="quantity" value="%{#item.value.quantity}" cssClass="input"/></td>
                                    <td><s:property value="#item.value.price * #item.value.quantity"/>
                                        <s:set var="total" value="#item.value.price * #item.value.quantity + #total"/>
                                    </td>
                                    <td>
                                        <s:url var="removeLink" action="removeItem">
                                            <s:param name ="id" value="%{#item.value.itemID}"/>
                                        </s:url>
                                        <s:a href="%{removeLink}" cssClass="btn btn-danger">Remove</s:a>
                                        </td>
                                        <td>
                                        <s:hidden name="id" value="%{#item.value.itemID}"/>
                                        <s:submit value="Update" cssClass="btn btn-primary"/>
                                    </td>
                                </s:form>
                            </tr>
                        </s:iterator>
                        <tr>
                            <td colspan="4" align='right' border='none'>Total</td>
                            <td align='left'><s:property value="%{#total}"/></td>
                            <td colspan="2">
                                <s:url var="checkOut" action="insertOrder"></s:url>
                                <s:a href="%{#checkOut}" cssClass="btn btn-success">Check Out</s:a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

            </s:if>
        </div>
    </body>
</html>

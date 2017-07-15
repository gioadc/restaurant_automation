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
    </head>
    <body>
        <h1>Create New Order</h1>
        Welcome, <s:property value="%{#session.FULLNAME}"/>

        <h2>Menu</h2>
        <s:if test="%{foods != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Food ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator var="dto" value="foods" status="counter">
                        <s:form action="addToCart" theme="simple">
                            <tr>
                                <td><s:property value="%{#counter.count}"/></td>
                                <td><s:property value="%{#dto.itemID}"/>
                                    <s:hidden name="itemID" value="%{#dto.itemID}"/>
                                </td>
                                <td><s:property value="%{#dto.name}"/>
                                    <s:hidden name="name" value="%{#dto.name}"/>
                                </td>
                                <td><s:property value="%{#dto.price}"/>
                                    <s:hidden name="price" value="%{#dto.price}"/>
                                </td>
                                <td><s:textfield name="quantity" value="1"/></td>
                                <td><s:submit value="Order"/></td>
                            </tr>
                        </s:form>
                    </s:iterator>
                </tbody>
            </table>
        </s:if>

        <s:if test="%{#session.CART.items != null}">
            <h2>Your Order</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Food ID</th>
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
                        <s:form action="updateItem" theme="simple">
                            <tr>
                                <td><s:property value="%{#counter.count}"/></td>
                                <td><s:property value="#item.value.itemID"/></td>
                                <td><s:property value="#item.value.name"/></td>
                                <td><s:property value="#item.value.price"/></td>
                                <td><s:textfield name="quantity" value="%{#item.value.quantity}"/></td>
                                <td><s:property value="#item.value.price * #item.value.quantity"/>
                                    <s:set var="total" value="#item.value.price * #item.value.quantity + #total"/>
                                </td>
                                <td>
                                    <s:url var="removeLink" action="removeItem">
                                        <s:param name ="id" value="%{#item.value.itemID}"/>
                                    </s:url>
                                    <s:a href="%{removeLink}">Remove</s:a>
                                    </td>
                                    <td>
                                    <s:hidden name="id" value="%{#item.value.itemID}"/>
                                    <s:submit value="Update"/>
                                </td>
                            </tr>
                        </s:form>
                    </s:iterator>
                    <tr>
                        <td colspan="5" align='right' border='none'>Total</td>
                        <td align='left'><s:property value="%{#total}"/></td>
                        <td colspan="2">
                            <s:url var="checkOut" action="insertOrder"></s:url>
                            <s:a href="%{#checkOut}">Check Out</s:a>
                        </td>
                        </tr>
                    </tbody>
                </table>

        </s:if>

    </body>
</html>

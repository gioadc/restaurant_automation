<%-- 
    Document   : index
    Created on : Jul 13, 2017, 4:51:20 PM
    Author     : kysik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager | Restaurant automation</title>
        <s:include value="../layout/head.jsp"/>
    </head>
    <body>
        <div class="body">
            <s:include value="../layout/header.jsp"/>
            <h2 class="block-title float-left">Statistics</h2>
            <form action="index" method="POST" class="report-filter float-right">
                <input name="start" id="start_time" class="input" type="datetime" value="${start}" placeholder="Begin">
                <input name="end" id="end_time" class="input" type="datetime" value="${end}" placeholder="End">
                <input type="submit" class="btn btn-success" value="Get">
            </form>
            <div class="clear"></div>
            
            <div class="container">
                Turnaround time: ${data.turnaroundTime/60} minutes <br>
                Prepare Time: ${data.prepareTime/60} minutes
            </div>
            <div class="divider"></div>
            <div class="container">
                <h3 class="block-title">Foods had been ordered in this time</h3>
            </div>
            <s:if test="%{listOrderDetail != null}">
                <div class="limit-height">
                    <table class="result-table text-center">
                        <thead>
                            <tr>
                                <th>.No</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator var="dto" value="listOrderDetail" status="status">
                                <tr>
                                    <td><s:property value="%{#status.count}"/></td>
                                    <td><s:property value="%{#dto.name}"/></td>
                                    <td class="text-right"><s:property value="%{#dto.price}"/></td>
                                    <td class="text-right"><s:property value="%{#dto.quantity}"/></td>
                                    <td class="text-right"><s:property value="%{#dto.price * #dto.quantity}"/></td>
                                </tr>
                            </s:iterator>
                            <tr class="text-right">
                                <td colspan="3">
                                    <strong>Total</strong>
                                </td>
                                <td>
                                    <strong><s:property value="%{data.total}"/></strong>
                                </td>
                                <td>
                                    <strong><s:property value="%{data.income}"/></strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </s:if>
            <s:if test="%{listOrderDetail == null}">
                <h3 class="alert alert-warning">No record found!</h3>
            </s:if>
            <s:if test="%{data['dateOfWeek'] != null}">
                <div class="divider"></div>
                <div class="tab">
                    <s:iterator var="entry" value="data['dateOfWeek']">
                        <button class="tablinks" onclick="openTab(event, '<s:property value="%{dwString[#entry.key]}"/>')"><s:property value="%{dwString[#entry.key]}"/></button>
                    </s:iterator>
                </div>
                <s:iterator var="entry" value="data['dateOfWeek']">
                    <div id="<s:property value="%{dwString[#entry.key]}"/>" class="tabcontent limit-height">
                        <s:if test="%{#entry.value == null}">
                            <div class="container">
                                <h3 class="text-center">No record found!</h3>
                            </div>
                        </s:if>
                        <s:if test="%{#entry.value != null}">
                            <table class="result-table text-center">
                                <thead>
                                    <tr>
                                        <th>.No</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator var="dto" status="status" value="#entry.value">
                                        <tr>
                                            <td>
                                                <s:property value="%{#status.count}"/>
                                            </td>
                                            <td>
                                                <s:property value="%{#dto.name}"/>
                                            </td>
                                            <td class="text-right">
                                                <s:property value="%{#dto.price}"/>
                                            </td>
                                            <td class="text-right">
                                                <s:property value="%{#dto.quantity}"/>
                                            </td>
                                            <td class="text-right">
                                                <s:property value="%{#dto.price * #dto.quantity}"/>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </s:if>
                    </div>
                </s:iterator>
            </s:if>
        </div>
        <script type="text/javascript" src="../files/js/jquery.min.js"></script>
        <script type="text/javascript" src="../files/js/app.js"></script>
        <script type="text/javascript" src="../files/utils/datetimepicker/jquery.datetimepicker.full.min.js"></script>
        <script type="text/javascript">
            document.getElementsByClassName("tablinks")[0].click();
            $('#start_time').datetimepicker({
                dayOfWeekStart : 1,
                timepicker:false,
                format:'m/d/Y H:i:s',
                defaultTime:'00:00:00',
                maxDate: '+1970/01/02',
            });
            $('#end_time').datetimepicker({
                dayOfWeekStart : 1,
                timepicker:false,
                format:'m/d/Y H:i:s',
                defaultTime:'23:59:59',
                maxDate: '+1970/01/02',
            });
        </script>
    </body>
</html>

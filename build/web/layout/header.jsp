<%-- 
    Document   : header
    Created on : Jul 15, 2017, 4:42:17 PM
    Author     : kysik
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div>
    <div class="top-bar">
        <span class="float-left">Welcome <strong>${sessionScope.FULLNAME}</strong>, have a nice day!</span>
        <span class="float-right"><a href="${pageContext.request.contextPath}/logout">Logout</a></span>
        <div class="clear"></div>
    </div>

    <h1 class="site-title text-center">RESTAURANT AUTOMATION SYSTEM</h1>

    <div class="clear"></div>
    <s:if test="%{#session.ROLE == 0}">
        <div class="menu text-center">
            <a href="manageEmployee">Manage Employees</a>
            <a href="getTable">Manage Tables</a>
            <a href="getFood">Manage Foods</a>
            <a href="statistics">Statistics</a>
        </div>
    </s:if>
    <hr>
</div>
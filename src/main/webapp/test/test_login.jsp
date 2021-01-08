<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/8
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试登录</title>
</head>
<body>
<form action="test_login_mid_receive.jsp">
    <input name="id" type="text" value="用户名">
    <input name="password" type="password" value="">
    <input type="submit" value="提交">
</form>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    session.setAttribute("id", id);
    session.setAttribute("password", password);
%>
</body>
</html>

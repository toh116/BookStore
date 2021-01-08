<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/8
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试接收数据</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
%>
<h4>
    登录成功<br>
    您的名字是：<%=id%>
</h4>
</body>
</html>

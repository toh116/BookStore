<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/7
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //检测是否登录
    if (session.getAttribute("user_name").equals("Login")) {
        //重定向到登录界面
        response.sendRedirect("user_login.jsp");
    }
%>
<html>
<head>
    <title><%=session.getAttribute("user_name")%> 's Shopping Cart</title>
    <%
        out.println("<script>alert('欢迎！')</script>");
        //测试session是否销毁
//        out.println(session.getAttribute("user_id"));
//        out.println(session.getAttribute("user_password"));
    %>
</head>
<body>

</body>
</html>

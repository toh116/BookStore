<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/8
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    if (id.equals("123") && password.equals("123")) {
        session.setAttribute("id", id);
        pageContext.forward("test_receive.jsp");
    } else {
        pageContext.forward("test_login.jsp");
    }
%>

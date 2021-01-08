<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/9
  Time: 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //接收表单请求，查看表单中名称为"Logout"的内容，如果其内容为"Login"，则向服务器申请重置登录状态
    //user_message.jsp里面有个<form>表单，其中button按钮的value为"Logout"
    if (request.getParameter("Logout").equals("Logout")) {
        //将用户名重设为Login，恢复无登录状态
        session.setAttribute("user_name", "Login");
        //返回主页
        pageContext.forward("front_index.jsp");
    }
%>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (!session.getAttribute("user_name").equals("Login")) {
        //重定向跳转
        response.sendRedirect("user_message.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/iconfont.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <title>Milky Way's bookstore.user.login</title>
</head>
<body>
<form action="user_login_control.jsp">
    <div id="bigBox">
        <h1>LOGIN</h1>
        <div class="inputBox">
            <div class="inputText">
                <span class="iconfont icon-nickname"></span>
                <label>
                    <input name="user_id" type="text" placeholder="User name" value=""/>
                </label>
            </div>
            <div class="inputText">
                <span class="iconfont icon-visible"></span>
                <input name="user_password" type="password" placeholder="Password" value=""/>
            </div>
        </div>
        <input class="loginButton" type="submit" value="Login"/>
    </div>
</form>
<%
    //获取<form>表单信息，这里分别是用户名和密码
    String user_id = request.getParameter("user_id");
    String user_password = request.getParameter("user_password");
    //将信息存入session中
    session.setAttribute("user_id", user_id);
    session.setAttribute("user_password", user_password);
%>
</body>
</html>

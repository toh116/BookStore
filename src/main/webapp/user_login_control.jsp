<%@ page import="java.sql.ResultSet" %>
<%@ page import="bookshop.suyu.Connection_DataBase" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/8
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="bean_Connction_DataBase" scope="page" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<jsp:useBean id="bean_user" class="bookshop.suyu.User"></jsp:useBean>
<%
    String user_id = request.getParameter("user_id");
    String user_password = request.getParameter("user_password");
    ResultSet resultSet = Connection_DataBase.query("select * from bookshop.user where user_id = " + user_id);
    //使用result.next()方法将游标移动到表的第一行，因为user_id是pk，所以数据肯定只有一行
    try {
        if (resultSet.next()) {
            //表中第3列存的是用户密码，这里是用于比对输入密码和数据库中的密码是否一致
            if (user_password.equals(resultSet.getString(3))) {
                //若一致则将将用户名保存到session中
                session.setAttribute("user_name", resultSet.getString(2));
                session.setAttribute("user_image", resultSet.getString(4));
                //销毁用户id和password，应该会安全点
                session.removeAttribute("user_id");
                session.removeAttribute("user_password");
                //客户端跳转（重定向）（网页地址不变，可以清空一些重要信息），常用的跳转还有服务器端跳转 -> pageContext.forward() 会保存一些信息，地址栏会跟着变;
                response.sendRedirect("bookstore_link1.jsp");
            } else {
                response.sendRedirect("user_login.jsp");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("user_login.jsp");
    }

%>
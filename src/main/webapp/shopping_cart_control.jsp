<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/10
  Time: 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="bean_Connection_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%
    //获取用户id
    String user_id = (String) session.getAttribute("user_id");
    //获取书本id
    String book_id = (String) session.getAttribute("book_id");
    //存入session，防止重定向跳转丢失book_id造成book_introduce.jsp脚本因缺少book_id而找不到书籍
    session.setAttribute("book_id", book_id);
    //该sql语句用于检索shopping_cart表，查询用户购物车
    String sql = "insert into bookshop.shopping_cart values (" + user_id + "," + book_id + ")";
    //执行该语句
    bean_Connection_DataBase.update(sql);
    //断开数据库连接
    bean_Connection_DataBase.close();
    //重定向跳转到书本介绍脚本
    response.sendRedirect("book_introduce.jsp");
%>
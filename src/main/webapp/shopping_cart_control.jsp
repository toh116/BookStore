<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/10
  Time: 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="bean_Connection_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%
    out.println("<script>alert(已添加到购物车！)</script>");
    String user_id = (String) session.getAttribute("user_id");
    String book_id = (String) session.getAttribute("book_id");
    session.setAttribute("book_id",book_id);
    String sql = "insert into bookshop.shopping_cart values ("+user_id+","+book_id+")";
    bean_Connection_DataBase.insert(sql);
    response.sendRedirect("book_introduce.jsp");
%>
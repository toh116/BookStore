<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/7
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="bean_Connction_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%
    ResultSet resultSet = null;
    //检测是否登录
    if (session.getAttribute("user_name").equals("Login")) {
        //如果用户没有登陆，则重定向到登录界面
        response.sendRedirect("user_login.jsp");
    } else {
        //获取用户id，不同的用户购物车也不同
        String user_id = (String) session.getAttribute("user_id");
        //查询该用户购物车中的记录
        resultSet = bean_Connction_DataBase.query("SELECT book_name, book_picture, book_price, book_number FROM bookshop.shopping_cart, bookshop.book_list where user_id = " + user_id + " and shopping_cart.book_id = book_list.book_id;");
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Milky Way's bookstore</title>
    <link href="css/cart.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="car">
    <div class="good">
        <table>
            <tr>
                <td width=20%>商品名称</td>
                <td width=20%>图片</td>
                <td width=20%>单价</td>
                <td width=20%>数量</td>
                <td width=20%>操作</td>
            </tr>
        </table>
    </div>
    <%--参照组，子div--%>
    <%--    <div class="goods">--%>
    <%--        <table>--%>
    <%--            <tr>--%>
    <%--                <td width=20% height="50">旁氏洗发露</td>--%>
    <%--                <td width=20% height="50">图片1</td>--%>
    <%--                <td width=20% height="50">99</td>--%>
    <%--                <td width=20% height="50">1</td>--%>
    <%--                <td width=20% height="50"><a href="">--%>
    <%--                    <button class="btn1">删除</button>--%>
    <%--                </a></td>--%>
    <%--            </tr>--%>
    <%--        </table>--%>
    <%--    </div>--%>
    <%
        //初始化购物车中商品的总价、总数
        int sum = 0;int number = 0;
        //移动游标打印表格
        while (resultSet!=null && resultSet.next()) {
            //打印表格
            out.println("<div class=goods>" +
                    "<table>"
                    + "<tr>"
                    + "<td width=20% height=50" + ">《" + resultSet.getString(1) + "》</td>"
                    + "<td width=20% height=50" + ">" + "<img src=" + resultSet.getString(2) + " width=50 height=50" + "></td>"
                    + "<td width=20% height=50" + ">" + resultSet.getString(3) + "</td>"
                    + "<td width=20% height=50" + ">1</td>"
                    + "<td width=20% height=50" + "><a href=>"
                    + " <button class=btn1>删除</button>"
                    + "</a></td>"
                    + "</tr>"
                    + "</table>"
                    + "</div>"
                    + "<div class=goods>" +
                    "<table>"
                    + "<tr>"
                    + "<td width=20% " + "></td>"
                    + "<td width=20% " + "></td>"
                    + "<td width=20% " + "></td>"
                    + "<td width=20% " + "></td>"
                    + "<td width=20% " + "></td>"
                    + "</tr>"
                    + "</table>"
                    + "</div>"
            );
            //计算总价
            sum = sum + Integer.valueOf(resultSet.getString(3));
            //计算总数
            number = number + 1;
        }
    %>
    <%
        //如果价格为0，则说明购物车为空，跳入指定jsp脚本
        if (sum == 0) {
            response.sendRedirect("shopping_cart_null.jsp");
        }
    %>
    <div class="goods2">
        <table>
            <tr>
                <td width=700>
                    <div>
                        <img src="images/cart.png" width="50" height="50"><img width="25">Milky Way's bookstore ->
                        Shopping Cart
                    </div>
                </td>
                <td width=200>商品总价：<%=sum%>  元</td>
                <td width=200>商品总数：<%=number%> 件</td>
            </tr>

        </table>
    </div>
    <div class="goods1">
        <table>
            <tr>
                <td width="700"></td>
                <td width="200">
                    <button class="btn2">确认购买</button>
                </td>
                <td width="200">
                    <button class="btn3">全部清空</button>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>


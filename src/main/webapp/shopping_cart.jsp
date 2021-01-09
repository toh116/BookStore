<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/7
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    //检测是否登录
    if (session.getAttribute("user_name").equals("Login")) {
        //重定向到登录界面
        response.sendRedirect("user_login.jsp");
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
    <div class="goods">
        <table>
            <tr>
                <td width=20%>旁氏洗发露</td>
                <td width=20%>图片1</td>
                <td width=20%>99</td>
                <td width=20%>1</td>
                <td width=20%><a>
                    <button class="btn1">删除</button>
                </a></td>
            </tr>
        </table>
    </div>
    <div class="goods">
        <table>
            <tr>
                <td width=20%>旁氏洗发露</td>
                <td width=20%>图片1</td>
                <td width=20%>99</td>
                <td width=20%>1</td>
                <td width=20%><a>
                    <button class="btn1">删除</button>
                </a></td>
            </tr>
        </table>
    </div>
    <div class="goods2">
        <table>
            <tr>
                <td width=700>
                    <div>
                        <img src="images/cart.png" width="50" height="50"><img width="25">Milky Way's bookstore ->
                        Shopping Cart
                    </div>
                </td>
                <td width=200>商品总价：</td>
                <td width=200>商品总数：</td>
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


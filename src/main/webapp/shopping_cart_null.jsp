<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.Book" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
    <%--参照组--%>
    <div class="goods">
        <table>
            <tr>
                <td width=12.5%></td>
                <td width=12.5%></td>
                <td width=50%>您的购物车还空着噢，赶快去购物吧！（棒读.jpg）</td>
                <td width=12.5%></td>
                <td width=12.5%></td>
            </tr>
        </table>
    </div>
    <div class="goods">
        <table>
            <tr>
                <td width=20%></td>
                <td width=20%></td>
                <td width=20%></td>
                <td width=20%></td>
                <td width=20%></td>
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
                <td width=200>商品总价：0</td>
                <td width=200>商品总数：0</td>
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
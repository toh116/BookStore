<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String book_picture = request.getParameter("book_picture");
    String book_name = request.getParameter("book_name");
    String book_price = request.getParameter("book_price");
    String book_number = request.getParameter("book_number");
    String book_introduce = request.getParameter("book_introduce");
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Milky Way's bookstore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/eCommerceStyle.css" rel="stylesheet" type="text/css">
    <!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
    <script>var __adobewebfontsappname__ = "dreamweaver"</script>
    <script src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js"
            type="text/javascript"></script>
</head>

<body>
<div id="mainWrapper">
    <header>
        <!-- This is the header content. It contains Logo and links -->
        <div id="logo">
            <!-- <img src="logoImage.png" alt="sample logo"> -->
            <!-- Company Logo text -->
            <a href="front_index.jsp" class="not_underline"> Home</a></div>
        <div id="headerLinks"><a href="user_login.jsp" title="user"><%=session.getAttribute("user_name")%>
        </a><a href="cart.jsp" id="href_link" title="Cart">Cart</a>
        </div>
    </header>
    <section id="offer">
        <!-- The offer section displays a banner text for promotions -->
        <h2>OFFER 50%</h2>
        <p>REALLY AWESOME DISCOUNTS THIS JULY</p>
    </section>
    <div id="content">
        <section class="sidebar">
            <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
            <input type="text" id="search" value="search">
            <div id="menubar">
                <nav class="menu">
                    <h2>
                        <!-- Title for menuset 1 -->
                        科普教育&nbsp;</h2>
                    <hr>
                    <ul>
                        <!-- List of links under menuset 1 -->
                        <li><a href="bookstore_link1.jsp" title="Link">程序设计类&nbsp;</a></li>
                        <li><a href="bookstore_link2.jsp" title="Link">教育类</a></li>
                        <li><a href="bookstore_link3.jsp" title="Link">经营类</a></li>
                        <li class="notimp">
                            <!-- notimp class is applied to remove this link from the tablet and phone views --><a
                                href="bookstore_link4.jsp" title="Link">生活类&nbsp;</a></li>
                    </ul>
                </nav>
                <nav class="menu">
                    <h2>其他&nbsp; </h2>
                    <!-- Title for menuset 2 -->
                    <hr>
                    <ul>
                        <!--List of links under menuset 2 -->
                        <li><a href="bookstore_link5.jsp" title="Link">待上架&nbsp;</a></li>
                        <li><a href="bookstore_link6.jsp" title="Link">待上架&nbsp;</a></li>
                        <li><a href="bookstore_link7.jsp" title="Link">待上架&nbsp;</a></li>
                        <li class="notimp">
                            <!-- notimp class is applied to remove this link from the tablet and phone views --><a
                                href="bookstore_link8.jsp" title="Link">待上架</a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="mainContent">
            <div class="productRow"><!-- Each product row contains info of 3 elements -->
                <article class="productInfo"><!-- Each individual product description -->
                    <div><img alt="sample" src="<%=book_picture%>"></div>
                    <br>
                    <p class="price">《<%=book_name%>》<br>￥ <%=book_price%>
                    </p>
                    <p class="productContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库存：<%=book_number%>
                        <br><br><%=book_introduce%>
                    </p>
                    <input type="button" name="button" value="Buy" class="buyButton" onclick="login()">
                    <script>
                        function login() {
                            //获取id = headerLinks 的标签中的文字内容
                            var user_name = document.getElementById("headerLinks").innerText;
                            //使用正则表达式检索是否含有"Login"字符串，如果有，则返回true。用户没有登陆的话默认是Login，其实就是用来检测用户是否登录的
                            //至于为什么用到正则表达式，其实是因为...用模板做的前端，然后他div居然是嵌套的...这样就导致里面的内容有些杂，只能正则匹配了
                            //如果用户处于无登录状态，则跳转到用户登陆界面
                            if (user_name.includes("Login")) {
                                window.location = "user_login.jsp";
                            } else {
                                window.location = "cart.jsp"
                            }
                        }
                    </script>
                </article>
            </div>
        </section>
    </div>
    <footer>
        <!-- This is the footer with default 3 divs -->
        <div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius sem neque. Integer ornare.</p>
        </div>
        <div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius sem neque. Integer ornare.</p>
        </div>
        <div class="footerlinks">
            <p><a href="admin_login.jsp">后台管理 </a></p>
            <p><a href="call_me.jsp" title="Link">联系我们</a></p>
            <p><a href="https://www.microsoft.com/zh-cn/" title="Link">帮助</a></p>
        </div>
    </footer>
</div>
</body>
</html>

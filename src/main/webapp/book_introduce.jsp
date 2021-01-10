<%@ page import="bookshop.suyu.Book" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bookshop.suyu.BookType" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="bean_Connction_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<jsp:useBean id="bean_Book" class="bookshop.suyu.Book"></jsp:useBean>
<%
    String book_id = request.getParameter("book_id");
    if (book_id == null) {
        book_id = (String) session.getAttribute("book_id");
    }
    ResultSet resultSet =  bean_Connction_DataBase.query("select * from bookshop.book_list where book_id = "+book_id);
    ResultSet resultSet_book_type = bean_Connction_DataBase.query("select book_type from bookshop.book_manage");
    ArrayList<BookType> bookTypeArrayList = new ArrayList<>();
    //根据id查找书籍
    try {
        if (resultSet.next()) {
            bean_Book = new Book();
            bean_Book.setBook_name(resultSet.getString(2));
            bean_Book.setBook_introduce(resultSet.getString(4));
            bean_Book.setBook_price(resultSet.getString(5));
            bean_Book.setBook_picture(resultSet.getString(6));
            bean_Book.setBook_number(resultSet.getString(7));
        }
    } catch (Exception e) {
        out.println("找不到此书籍");
        e.printStackTrace();
    }
    //读取数据库中所有书籍的分类名称
    try {
        while (resultSet_book_type.next()){
            BookType bookType = new BookType();
            bookType.setType_name(resultSet_book_type.getString(1));
            bookTypeArrayList.add(bookType);
        }
    } catch (Exception e) {
        out.println("无效分类");
        e.printStackTrace();
    }
    //关闭数据库连接
    bean_Connction_DataBase.close();

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
        <div id="headerLinks"><a href="user_login.jsp" title="user">
            <img src="<%=session.getAttribute("user_image")%>" width="5%" height="5%"><%=session.getAttribute("user_name")%>
        </a><a href="shopping_cart.jsp" id="href_link" title="Cart">Cart</a>
        </div>
    </header>
    <%
        session.setAttribute("book_id",book_id);
    %>
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
                        科普教育</h2>
                    <hr>
                    <ul>
                        <!-- List of links under menuset 1 -->
                        <li><a href="bookstore_link1.jsp" title="Link"><%=bookTypeArrayList.get(0).getType_name()%></a></li>
                        <li><a href="bookstore_link2.jsp" title="Link"><%=bookTypeArrayList.get(1).getType_name()%></a></li>
                        <li><a href="bookstore_link3.jsp" title="Link"><%=bookTypeArrayList.get(2).getType_name()%></a></li>
                        <li class="notimp">
                            <!-- notimp class is applied to remove this link from the tablet and phone views --><a
                                href="bookstore_link4.jsp" title="Link"><%=bookTypeArrayList.get(3).getType_name()%></a></li>
                    </ul>
                </nav>
                <nav class="menu">
                    <h2>其他</h2>
                    <!-- Title for menuset 2 -->
                    <hr>
                    <ul>
                        <!--List of links under menuset 2 -->
                        <li><a href="bookstore_link5.jsp" title="Link"><%=bookTypeArrayList.get(4).getType_name()%></a></li>
                        <li><a href="bookstore_link6.jsp" title="Link"><%=bookTypeArrayList.get(5).getType_name()%></a></li>
                        <li><a href="bookstore_link7.jsp" title="Link"><%=bookTypeArrayList.get(6).getType_name()%></a></li>
                        <li class="notimp">
                            <!-- notimp class is applied to remove this link from the tablet and phone views --><a
                                href="bookstore_link8.jsp" title="Link"><%=bookTypeArrayList.get(7).getType_name()%></a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="mainContent">
            <div class="productRow"><!-- Each product row contains info of 3 elements -->
                <article class="productInfo"><!-- Each individual product description -->
                    <form action="shopping_cart_control.jsp">
                    <div><img alt="sample" src="<%=bean_Book.getBook_picture()%>"></div>
                    <br>
                    <p class="price">《<%=bean_Book.getBook_name()%>》<br>￥ <%=bean_Book.getBook_price()%>
                    </p>
                    <p class="productContent"><img title="add to cart" src="images/cart.png" width="50" height="50" onclick="login()">库存：<%=bean_Book.getBook_number()%>
                        <br><%=bean_Book.getBook_introduce()%>
                    </p>
                    <input type="submit" name="button" value="Buy" class="buyButton" onclick="login()">
                    </form>
                    <script>
                        function login() {
                            //获取id = headerLinks 的标签中的文字内容
                            var user_name = document.getElementById("headerLinks").innerText;
                            //使用正则表达式检索是否含有"Login"字符串，如果有，则返回true。用户没有登陆的话默认是Login，其实就是用来检测用户是否登录的
                            //至于为什么用到正则表达式，其实是因为...用模板做的前端，然后他div居然是嵌套的...这样就导致里面的内容有些杂，只能正则匹配了
                            //如果用户处于无登录状态，则跳转到用户登陆界面
                            if (user_name.includes("Login")) {
                                window.location = "user_login.jsp"
                            } else {
                                //将书本添加进购物车的一个脚本
                                window.location = "shopping_cart_control.jsp"
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
            <p><a href="bookstore_call_me.jsp" title="Link">联系我们</a></p>
            <p><a href="https://www.microsoft.com/zh-cn/" title="Link">帮助</a></p>
        </div>
    </footer>
</div>
</body>
</html>


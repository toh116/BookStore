<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.Book" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bookshop.suyu.BookType" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用javabean包装java类，将其引入到该页面中--%>
<jsp:useBean id="bean_Connction_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<jsp:useBean id="bean_Book" class="bookshop.suyu.Book"></jsp:useBean>
<%
    //根据指定sql语句查询结果
    ResultSet resultSet_book_type = bean_Connction_DataBase.query("select book_type from bookshop.book_manage");
    ResultSet resultSet_book = bean_Connction_DataBase.query("select * from bookshop.book_list where book_type = 7");
    //Book型的list集合
    ArrayList<Book> bookArrayList = new ArrayList<>();
    //BookType型的list集合
    ArrayList<BookType> bookTypeArrayList = new ArrayList<>();
    //用于判断书本分类是否存在的布尔型变量
    boolean book_exist = false;
    while (resultSet_book.next()) {
        //移动游标获取结果集中的数据，存入Book对象
        bean_Book = new Book();
        bean_Book.setBook_id(resultSet_book.getString(1));
        bean_Book.setBook_name(resultSet_book.getString(2));
        bean_Book.setBook_subname(resultSet_book.getString(3));
        bean_Book.setBook_introduce(resultSet_book.getString(4));
        bean_Book.setBook_price(resultSet_book.getString(5));
        bean_Book.setBook_picture(resultSet_book.getString(6));
        bean_Book.setBook_number(resultSet_book.getString(7));
        bean_Book.setBook_type(resultSet_book.getString(8));
        bookArrayList.add(bean_Book);
    }
    if (bookArrayList != null) {
        //书本分类存在
        book_exist = true;
    }
    while (resultSet_book_type.next()) {
        BookType bookType = new BookType();
        bookType.setType_name(resultSet_book_type.getString(1));
        bookTypeArrayList.add(bookType);
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
        <div id="headerLinks"><a href="user_login.jsp" title="user"><img src="<%=session.getAttribute("user_image")%>"
                                                                         width="5%"
                                                                         height="5%"><%=session.getAttribute("user_name")%>
        </a><a href="shopping_cart.jsp" title="Cart">Cart</a>
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
                        科普教育</h2>
                    <hr>
                    <ul>
                        <!-- List of links under menuset 1 -->
                        <li><a href="bookstore_link1.jsp" title="Link"><%=bookTypeArrayList.get(0).getType_name()%>
                        </a></li>
                        <li><a href="bookstore_link2.jsp" title="Link"><%=bookTypeArrayList.get(1).getType_name()%>
                        </a></li>
                        <li><a href="bookstore_link3.jsp" title="Link"><%=bookTypeArrayList.get(2).getType_name()%>
                        </a></li>
                        <li class="notimp">
                            <!-- notimp class is applied to remove this link from the tablet and phone views --><a
                                href="bookstore_link4.jsp" title="Link"><%=bookTypeArrayList.get(3).getType_name()%>
                        </a></li>
                    </ul>
                </nav>
                <nav class="menu">
                    <h2>其他</h2>
                    <!-- Title for menuset 2 -->
                    <hr>
                    <ul>
                        <!--List of links under menuset 2 -->
                        <li><a href="bookstore_link5.jsp" title="Link"><%=bookTypeArrayList.get(4).getType_name()%>
                        </a></li>
                        <li><a href="bookstore_link6.jsp" title="Link"><%=bookTypeArrayList.get(5).getType_name()%>
                        </a></li>
                        <li><a href="bookstore_link7.jsp" title="Link"><%=bookTypeArrayList.get(6).getType_name()%>
                        </a></li>
                        <li class="notimp">
                            <a href="bookstore_link8.jsp" title="Link"><%=bookTypeArrayList.get(7).getType_name()%>
                            </a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="mainContent">
            <div class="productRow"><!-- Each product row contains info of 3 elements -->
                <%--                参照组--%>
                <%--                <div class="div_form">--%>
                <%--                    <article class="productInfo"><!-- Each individual product description -->--%>
                <%--                        <div><img alt="sample" src="<%=bookArrayList.get(0).getBook_picture()%>"></div>--%>
                <%--                        <p class="price">《<%=bookArrayList.get(0).getBook_name()%>》</p>--%>
                <%--                        <p class="productContent">￥ <%=bookArrayList.get(0).getBook_price()%>--%>
                <%--                        </p>--%>
                <%--                        <input type="button" name="button" value="Buy" class="buyButton">--%>
                <%--                    </article>--%>
                <%--                </div>--%>
                <%
                    //如果这个类型的书本存在，就out这些书本div
                    if (book_exist) {
                        for (int i = 0; i < bookArrayList.size(); i++) {
                            out.println("<article class= productInfo>" +
                                    "<div>" + "<a href=book_introduce.jsp?book_id=" + bookArrayList.get(i).getBook_id() +
                                    " style=color:grey;text-decoration:none;>" +
                                    "<img alt= sample src=" + bookArrayList.get(i).getBook_picture() + "></div>" +
                                    "<p class= price>《" + bookArrayList.get(i).getBook_name() + "》</p>" +
                                    "<p class= productContent>￥ " + bookArrayList.get(i).getBook_price() + "</p>" +
                                    "<input type= button name= button value= Buy class= buyButton>" +
                                    "</article>");
                        }
                    }
                    //关闭out流
                    out.close();
                %>
            </div>
        </section>
    </div>
    <footer>
        <!-- This is the footer with default 3 divs -->
        <div>
            <p>Welcome to my website -> Milky Way's bookstore!</p>
        </div>
        <div>
            <p>Thank you for your use, welcome to come again next time!</p>
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


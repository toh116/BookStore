<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.Book" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bookshop.suyu.BookType" %>
<%@ page import="bookshop.suyu.Connection_DataBase" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用javabean包装java类，将其引入到该页面中--%>
<jsp:useBean id="bean_Connction_DataBase" scope="page" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%--使用javabean包装java类，将其引入到该页面中--%>
<jsp:useBean id="bean_book_type" scope="page" class="bookshop.suyu.BookType"></jsp:useBean>
<%--查询book_manage(书籍分类)表的所有数据，返回一个结果集合resultSet_book_type--%>
<% ResultSet resultSet_book_type = Connection_DataBase.query("select * from bookshop.book_manage");%>
<%
    //将session中name为"booklist_type1的信息赋值到集合，也就是类型1的所有书籍
    ArrayList<Book> bookArrayList = (ArrayList<Book>) session.getAttribute("booklist_type1");
    //用于标记某分类下类型书籍是否存在
    boolean book_exist = true;
    if (bookArrayList.size() == 0) {
        //集合的size为0则说明该分类下没有书籍
        book_exist = false;
    }
%>
<%
    ArrayList<BookType> bookTypeArrayList = new ArrayList<>();
    while (resultSet_book_type.next()) {
        try {
            //常规数据读取，list拿来装BookType对象
            bean_book_type = new BookType();
            bean_book_type.setType_id(resultSet_book_type.getString(1));
            bean_book_type.setType_name(resultSet_book_type.getString(2));
            //我在book_manage表中预先设置了book_type的值为null，后期如果想更改子分类的话直接把null改了就行
            //如果book_type的值为null，说明没有管理员去更改子分类的名字，则默认该子分类名称为"未上架"
            if (bean_book_type.getType_name().equals("null")) {
                bean_book_type.setType_name("未上架");
            }
            bookTypeArrayList.add(bean_book_type);
        } catch (Exception e) {
            //抛出堆栈轨迹
            e.printStackTrace();
        }
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
        <div id="headerLinks"><a href="user_login.jsp" title="user"><%=session.getAttribute("user_name")%>
        </a><a href="cart.jsp" title="Cart">Cart</a>
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
                <%--                <article class="productInfo"><!-- Each individual product description -->--%>
                <%--                    <div><img alt="sample" src="<%=bookArrayList.get(0).getBook_picture()%>"></div>--%>
                <%--                    <p class="price">《<%=bookArrayList.get(0).getBook_name()%>》</p>--%>
                <%--                    <p class="productContent">￥ <%=bookArrayList.get(0).getBook_price()%></p>--%>
                <%--                    <input type="button" name="button" value="Buy" class="buyButton">--%>
                <%--                </article>--%>
                <%
                    //flag不为false则说明集合不为空
                    //不为空就说明该子分类下有书籍
                    //有书就打印,这里用out打印了该集合内所有的书籍<div>
                    if (book_exist) {
                        for (int i = 0; i < bookArrayList.size(); i++) {
                            out.println("<article class= productInfo>" +
                                    "<div>" + "<a href=book_introduce.jsp?book_name=" + bookArrayList.get(i).getBook_name() +
                                    "&book_picture=" + bookArrayList.get(i).getBook_picture() +
                                    "&book_price=" + bookArrayList.get(i).getBook_price() +
                                    "&book_number=" + bookArrayList.get(i).getBook_number() +
                                    "&book_introduce=" + bookArrayList.get(i).getBook_introduce() +
                                    " style=color:grey;text-decoration:none;>" +
                                    "<img alt= sample src=" + bookArrayList.get(i).getBook_picture() + "></div>" +
                                    "<p class= price>《" + bookArrayList.get(i).getBook_name() + "》</p>" +
                                    "<p class= productContent>￥ " + bookArrayList.get(i).getBook_price() + "</p>" +
                                    "<input type= button name= button value= Buy class= buyButton>" +
                                    "</article>");
                        }
                    }
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
            <p><a href="call_me.jsp" title="Link">联系我们</a></p>
            <p><a href="https://www.microsoft.com/zh-cn/" title="Link">帮助</a></p>
        </div>
    </footer>
</div>
</body>
</html>


<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.Book" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bookshop.suyu.Connection_DataBase" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--使用javabean包装java类，将其引入到该页面中--%>
<jsp:useBean id="bean_Connction_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%--使用javabean包装java类，将其引入到该页面中--%>
<jsp:useBean id="bean_book" class="bookshop.suyu.Book"></jsp:useBean>
<%--查询book表的所有数据，返回一个结果集合resultSet_book--%>
<% ResultSet resultSet_book = Connection_DataBase.query("select * from bookshop.book_list");%>
<%
    //设置默认登陆状态为无用户登录
    if (session.getAttribute("user_name") == null) {
        session.setAttribute("user_name", "Login");
    }
%>
<%
    //所有书本
    ArrayList<Book> bookArrayList = new ArrayList<>();
    //分类一的书本
    ArrayList<Book> bookArrayList_type1 = new ArrayList<>();
    //分类二的书本
    ArrayList<Book> bookArrayList_type2 = new ArrayList<>();
    //分类三的书本
    ArrayList<Book> bookArrayList_type3 = new ArrayList<>();
    //分类四的书本
    ArrayList<Book> bookArrayList_type4 = new ArrayList<>();
    //分类五的书本
    ArrayList<Book> bookArrayList_type5 = new ArrayList<>();
    //分类六的书本
    ArrayList<Book> bookArrayList_type6 = new ArrayList<>();
    //分类七的书本
    ArrayList<Book> bookArrayList_type7 = new ArrayList<>();
    //分类八的书本
    ArrayList<Book> bookArrayList_type8 = new ArrayList<>();

    while (resultSet_book.next()) {
        try {
            //访问结果集合resultSet_book用List装Book对象的数据
            bean_book = new Book();
            bean_book.setBook_id(resultSet_book.getString(1));
            bean_book.setBook_name(resultSet_book.getString(2));
            bean_book.setBook_subname(resultSet_book.getString(3));
            bean_book.setBook_introduce(resultSet_book.getString(4));
            bean_book.setBook_price(resultSet_book.getString(5));
            bean_book.setBook_picture(resultSet_book.getString(6));
            bean_book.setBook_number(resultSet_book.getString(7));
            bean_book.setBook_type(resultSet_book.getString(8));
            if (bean_book.getBook_type().equals("1")) {
                bookArrayList_type1.add(bean_book);
            }
            if (bean_book.getBook_type().equals("2")) {
                bookArrayList_type2.add(bean_book);
            }
            if (bean_book.getBook_type().equals("3")) {
                bookArrayList_type3.add(bean_book);
            }
            if (bean_book.getBook_type().equals("4")) {
                bookArrayList_type4.add(bean_book);
            }
            if (bean_book.getBook_type().equals("5")) {
                bookArrayList_type5.add(bean_book);
            }
            if (bean_book.getBook_type().equals("6")) {
                bookArrayList_type6.add(bean_book);
            }
            if (bean_book.getBook_type().equals("7")) {
                bookArrayList_type7.add(bean_book);
            }
            if (bean_book.getBook_type().equals("8")) {
                bookArrayList_type8.add(bean_book);
            }
            bookArrayList.add(bean_book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //关闭数据库连接
    bean_Connction_DataBase.close();
    //session.setAttribute用于页面之间发送数据 (name,value)
    //session可以看成是一个数据包，用于跟踪信息，保存状态等
    session.setAttribute("booklist_type1", bookArrayList_type1);
    session.setAttribute("booklist_type2", bookArrayList_type2);
    session.setAttribute("booklist_type3", bookArrayList_type3);
    session.setAttribute("booklist_type4", bookArrayList_type4);
    session.setAttribute("booklist_type5", bookArrayList_type5);
    session.setAttribute("booklist_type6", bookArrayList_type6);
    session.setAttribute("booklist_type7", bookArrayList_type7);
    session.setAttribute("booklist_type8", bookArrayList_type8);
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Milky Way's bookstore</title>
    <style type="text/css">
        @import url("css/simpleGridTemplate.css");
    </style>
</head>
<body>
<!-- Main Container -->
<div class="container">
    <!-- Header -->
    <header class="header">
        <h4 class="logo"><a href="bookstore_link1.jsp" class="not_underline">Milky Way's bookstore</a></h4>
    </header>
    <!-- Hero Section -->
    <section class="intro">
        <div class="column">
            <h3>Su yu&nbsp;</h3>
            <img src="images/head_picture.png" alt="" width="25%" height="25%"></div>
        <div class="column">
            <p>A blockhead</p>
            <p>First of all, thank you very much for visiting this website,
                and second, I am very glad that you can enjoy with me the
                first JSP project that my team and I have completed. I will do my best to answer your questions.
                About the daily maintenance of the website, please stamp the link below the website
                <br>(●´▽｀●)</p>
        </div>
    </section>
    <!-- Stats Gallery Section -->
    <div class="gallery">
        <%--        <%=%>标签用于从后端（服务器）读取数据到前端（用户）--%>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(0).getBook_name()%>
        &book_picture=<%=bookArrayList.get(0).getBook_picture()%>
        &book_price=<%=bookArrayList.get(0).getBook_price()%>
        &book_number=<%=bookArrayList.get(0).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(0).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(0).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(0).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(0).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(0).getBook_introduce()%>
            </p>
        </div>
        <%--        <%=%>标签用于从后端（服务器）读取数据到前端（用户）--%>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(23).getBook_name()%>
        &book_picture=<%=bookArrayList.get(23).getBook_picture()%>
        &book_price=<%=bookArrayList.get(23).getBook_price()%>
        &book_number=<%=bookArrayList.get(23).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(23).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(23).getBook_picture()%>" alt="" width="200" class="cards"/></a>
            <h4><%=bookArrayList.get(23).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(23).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(23).getBook_introduce()%>
            </p>
        </div>
        <%--        <%=%>标签用于从后端（服务器）读取数据到前端（用户）--%>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(40).getBook_name()%>
        &book_picture=<%=bookArrayList.get(40).getBook_picture()%>
        &book_price=<%=bookArrayList.get(40).getBook_price()%>
        &book_number=<%=bookArrayList.get(40).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(40).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(40).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(40).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(40).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(40).getBook_introduce()%>
            </p>
        </div>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(22).getBook_name()%>
        &book_picture=<%=bookArrayList.get(22).getBook_picture()%>
        &book_price=<%=bookArrayList.get(22).getBook_price()%>
        &book_number=<%=bookArrayList.get(22).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(22).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(22).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(22).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(22).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(22).getBook_introduce()%>
            </p>
        </div>
    </div>
    <div class="gallery">
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(2).getBook_name()%>
        &book_picture=<%=bookArrayList.get(2).getBook_picture()%>
        &book_price=<%=bookArrayList.get(2).getBook_price()%>
        &book_number=<%=bookArrayList.get(2).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(2).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(2).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(2).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(2).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(2).getBook_introduce()%>
            </p>
        </div>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(3).getBook_name()%>
        &book_picture=<%=bookArrayList.get(3).getBook_picture()%>
        &book_price=<%=bookArrayList.get(3).getBook_price()%>
        &book_number=<%=bookArrayList.get(3).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(3).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(3).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(3).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(3).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(3).getBook_introduce()%>
            </p>
        </div>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(4).getBook_name()%>
        &book_picture=<%=bookArrayList.get(4).getBook_picture()%>
        &book_price=<%=bookArrayList.get(4).getBook_price()%>
        &book_number=<%=bookArrayList.get(4).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(4).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(4).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(4).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(4).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(4).getBook_introduce()%>
            </p>
        </div>
        <div class="thumbnail"><a href="book_introduce.jsp?book_name=<%=bookArrayList.get(5).getBook_name()%>
        &book_picture=<%=bookArrayList.get(5).getBook_picture()%>
        &book_price=<%=bookArrayList.get(5).getBook_price()%>
        &book_number=<%=bookArrayList.get(5).getBook_number()%>
        &book_introduce=<%=bookArrayList.get(5).getBook_introduce()%>
        ">
            <img src="<%=bookArrayList.get(5).getBook_picture()%>" alt="" width="350" class="cards"/></a>
            <h4><%=bookArrayList.get(5).getBook_name()%>
            </h4>
            <p class="tag"><%=bookArrayList.get(5).getBook_subname()%>
            </p>
            <p class="text_column"><%=bookArrayList.get(5).getBook_introduce()%>
            </p>
        </div>
        <%
            //            这里使用了jsp内置对象之一:out 该对象无需实例化可以直接使用,用于输出一些信息到前端（客户）上,可以打印各种信息,甚至是标签等,这里是打印了40个div(书)
            for (int i = 10; i < bookArrayList.size(); i++) {
                out.println("<div class= thumbnail><a href= book_introduce.jsp><img src=" + bookArrayList.get(i).getBook_picture() + " width= 350 class= cards/>" +
                        "</a><h4>" + bookArrayList.get(i).getBook_name() + "</h4><p class= tag>" + bookArrayList.get(i).getBook_subname() + "</p><p class= text_column>"
                        + bookArrayList.get(i).getBook_introduce() + "</p></div>");
            }
        %>
    </div>
    <!-- Footer Section -->
    <footer id="contact">
        <p class="hero_header">GET MORE INFORMATION</p>
        <div class="button"><a href="bookstore_link1.jsp" class="not_underline">Shopping now! </a></div>
    </footer>
    <!-- Copyrights Section -->
    <div class="copyright">&copy;2019 - <strong>SUYU</strong></div>
</div>
<!-- Main Container Ends -->
</body>
</html>


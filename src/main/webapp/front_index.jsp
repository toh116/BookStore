<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.Book" %>
<%@ page import="java.sql.SQLException" %>
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
<%--查询book表的所有数据，返回一个结果集合resultSet_book--%>
<% ResultSet resultSet_book = bean_Connction_DataBase.query("select * from bookshop.book_list");%>
<%
    //设置默认登陆状态为无用户登录
    if (session.getAttribute("user_name") == null) {
        session.setAttribute("user_name", "Login");
    }
    //设置默认头像为游客头像
    if (session.getAttribute("user_image") == null) {
        session.setAttribute("user_image", "images/profile.png");
    }
%>
<%
    //存放所有书本的集合
    ArrayList<Book> bookArrayList = new ArrayList<>();
    //将数据库中的书本加入集合
    while (resultSet_book.next()) {
        try {
            //访问结果集合resultSet_book用List装Book对象的数据
            Book book = new Book();
            book.setBook_id(resultSet_book.getString(1));
            book.setBook_name(resultSet_book.getString(2));
            book.setBook_subname(resultSet_book.getString(3));
            book.setBook_introduce(resultSet_book.getString(4));
            book.setBook_price(resultSet_book.getString(5));
            book.setBook_picture(resultSet_book.getString(6));
            book.setBook_number(resultSet_book.getString(7));
            book.setBook_type(resultSet_book.getString(8));
            bookArrayList.add(book);
        } catch (SQLException e) {
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
            <img src="images/admin_picture.png" alt="" width="25%" height="25%" onclick=call_me()></div>
        <script>
            function call_me() {
                window.location = "bookstore_call_me.jsp";
            }
        </script>
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
        <%
            int[] A = {23,0,33,22,40};
            for (int i = 0; i < 4; i++) {
                out.println("<div class= thumbnail><a href=book_introduce.jsp?book_id="+bookArrayList.get(A[i]).getBook_id()+">"+
                        " <img src= "+bookArrayList.get(A[i]).getBook_picture()+" width= 350 height= 200 class= cards/></a>" +
                        " <h4>"+bookArrayList.get(A[i]).getBook_name()+
                        " </h4>" +
                        " <p class= tag>+"+bookArrayList.get(A[i]).getBook_subname()+
                        " </p>" +
                        " <p class= text_column>"+bookArrayList.get(A[i]).getBook_introduce()+
                        " </p>" +
                        "</div>"
                );
            }
        %>
        <%
            for (int i = 10; i < bookArrayList.size(); i++) {
                out.println("<div class= thumbnail><a href=book_introduce.jsp?book_id="+bookArrayList.get(i).getBook_id()+">"+
        " <img src= "+bookArrayList.get(i).getBook_picture()+" width= 350 height= 200 class= cards/></a>" +
        " <h4>"+bookArrayList.get(i).getBook_name()+
        " </h4>" +
        " <p class= tag>+"+bookArrayList.get(i).getBook_subname()+
        " </p>" +
        " <p class= text_column>"+bookArrayList.get(i).getBook_introduce()+
        " </p>" +
    "</div>"
    );
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


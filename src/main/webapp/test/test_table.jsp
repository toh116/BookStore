<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookshop.suyu.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/9
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean_Connection_DataBase" class="bookshop.suyu.Connection_DataBase"></jsp:useBean>
<%
    ResultSet resultSet = bean_Connection_DataBase.query("select * from bookshop.user");
    ArrayList<User> userArrayList = new ArrayList<User>();
    while (resultSet.next()) {
        User user = new User();
        user.setUser_id(resultSet.getString(1));
        user.setUser_name(resultSet.getString(2));
        user.setUser_password(resultSet.getString(3));
        userArrayList.add(user);
    }
    bean_Connection_DataBase.close();
%>
<html>
<head>
    <title>表格测试</title>
</head>
<body>
<table border="1">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>pass</td>
    </tr>
    <%
        for (User user : userArrayList) {
            out.println("<tr>"
                    + "<td>" + user.getUser_id() + "</td>" +
                    "<td>" + user.getUser_name() + "</td>" +
                    "<td>" + user.getUser_password() + "</td>" +
                    "</tr>");
        }
        ;
    %>
</table>
</body>
</html>

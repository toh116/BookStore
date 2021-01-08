<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/9
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome !-> <%=session.getAttribute("user_name")%>
    </title>
</head>
<body>
<form action="user_logout.jsp">
    <input type="submit" value="Logout" name="Logout">
</form>
</body>
</html>

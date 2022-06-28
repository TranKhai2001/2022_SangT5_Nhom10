<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 02/05/2022
  Time: 2:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%if(session.getAttribute("n")!=null){%>
    login success
<%=session.getAttribute("n")%>
<%}else{%>
login failed<%}%>
</body>
</html>

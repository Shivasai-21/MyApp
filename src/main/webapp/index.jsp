<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dev Server Test</title>
</head>
<body>
    <h1>JSP Dev Server Check</h1>
    <p>Welcome! This JSP page is running on: 
        <%= application.getServerInfo() %>
    </p>
    <p>Current time: <%= new java.util.Date() %></p>
    <p>Request served from: <%= request.getRemoteAddr() %></p>
</body>
</html>


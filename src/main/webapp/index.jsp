<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Production App</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        header { background: #2c3e50; color: white; padding: 10px; }
        footer { margin-top: 20px; font-size: 0.9em; color: #555; }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to My Production App</h1>
    </header>

    <main>
        <h2>Dynamic Content</h2>
        <p>Hello, <c:out value="${userName}" default="Guest"/>!</p>
        <p>Current time: <c:out value="${currentTime}"/></p>

        <h2>Product List</h2>
        <ul>
            <c:forEach var="product" items="${products}">
                <li><c:out value="${product.name}"/> - $<c:out value="${product.price}"/></li>
            </c:forEach>
        </ul>
    </main>

    <footer>
        &copy; <c:out value="${year}"/> MyCompany. All rights reserved.
    </footer>
</body>
</html>

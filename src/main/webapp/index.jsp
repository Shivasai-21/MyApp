%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Production JSP Example</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        header { background: #2c3e50; color: white; padding: 10px; }
        footer { margin-top: 20px; font-size: 0.9em; color: #555; }
        table { border-collapse: collapse; width: 50%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <header>
        <h1>My Production JSP Page</h1>
    </header>

    <main>
        <h2>Dynamic Server Data</h2>
        <p>Current time: <%= new java.util.Date() %></p>
        <p>Server: <%= application.getServerInfo() %></p>

        <h2>Sample Product Table</h2>
        <table>
            <tr><th>Product</th><th>Price</th></tr>
            <%
                String[] products = {"Laptop", "Phone", "Headphones"};
                double[] prices = {75000.0, 35000.0, 5000.0};
                for (int i = 0; i < products.length; i++) {
            %>
                <tr>
                    <td><%= products[i] %></td>
                    <td>₹<%= prices[i] %></td>
                </tr>
            <%
                }
            %>
        </table>
    </main>

    <footer>
        &copy; <%= java.time.Year.now() %> MyCompany. All rights reserved.
    </footer>
</body>
</html>

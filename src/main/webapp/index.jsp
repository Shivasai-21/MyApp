<%@ page import="java.util.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>MyStore -- Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        body { font-family: Arial; margin: 20px; }
        .product { border: 1px solid #ccc; padding: 10px; margin: 10px; }
        .cart { margin-top: 20px; padding: 10px; border: 1px solid #000; }
    </style>
</head>
<body>
    <h1>Welcome to My Store</h1>

    <%
        // Sample product list
        class Product {
            String name;
            double price;
            Product(String n, double p) { name = n; price = p; }
        }

        List<Product> products = Arrays.asList(
            new Product("Laptop", 75000.0),
            new Product("Smartphone", 25000.0),
            new Product("Headphones", 2000.0)
        );

        // Handle cart in session (use implicit session object)
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Add product to cart if requested
        String addItem = request.getParameter("add");
        if (addItem != null) {
            int index = Integer.parseInt(addItem);
            cart.add(products.get(index));
        }
    %>

    <h2>Products</h2>
    <%
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
    %>
        <div class="product">
            <b><%= p.name %></b><br>
            Price: ₹<%= p.price %><br>
            <a href="shop.jsp?add=<%= i %>">Add to Cart</a>
        </div>
    <%
        }
    %>

    <div class="cart">
        <h2>Your Cart</h2>
        <%
            if (cart.isEmpty()) {
                out.println("Cart is empty.");
            } else {
                double total = 0;
                for (Product p : cart) {
                    out.println(p.name + " - ₹" + p.price + "<br>");
                    total += p.price;
                }
                out.println("<b>Total: ₹" + total + "</b>");
            }
        %>
    </div>
</body>
</html>

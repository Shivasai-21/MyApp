<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
     * BazaarX - Amazon-style e-commerce homepage
     * JSP + HTML + CSS + Vanilla JavaScript
     * Replace demo product data/images with database-backed data in production.
     */
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="BazaarX online shopping - electronics, fashion, home, books and more.">
<title>BazaarX - Online Shopping</title>

<style>
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:Arial,Helvetica,sans-serif;background:#eaeded;color:#111;line-height:1.35}
button,input,select{font:inherit}
button{cursor:pointer}
a{text-decoration:none;color:inherit}
img{display:block;max-width:100%}

:root{
  --nav:#131921;
  --nav2:#232f3e;
  --accent:#febd69;
  --yellow:#ffd814;
  --orange:#ff9900;
  --blue:#146eb4;
  --green:#007600;
  --border:#d5d9d9;
  --white:#fff;
  --muted:#565959;
  --link:#007185;
}

/* TOP HEADER */
.top-strip{
  height:32px;background:#0b1117;color:#ddd;
  display:flex;align-items:center;justify-content:flex-end;
  padding:0 22px;gap:22px;font-size:12px
}
.top-strip a:hover{color:#fff;text-decoration:underline}

.main-header{
  min-height:68px;background:var(--nav);color:#fff;
  display:flex;align-items:center;gap:10px;padding:8px 18px;
  position:sticky;top:0;z-index:1000
}
.logo{
  width:145px;height:50px;display:flex;align-items:center;
  justify-content:center;font-size:25px;font-weight:800;
  border:1px solid transparent;border-radius:2px;flex-shrink:0
}
.logo:hover{border-color:#fff}
.logo span{color:#ff9900}
.location{
  width:145px;display:flex;gap:7px;align-items:center;padding:7px;
  border:1px solid transparent;flex-shrink:0
}
.location:hover{border-color:#fff}
.location small{display:block;color:#ccc;font-size:11px}
.location strong{display:block;font-size:14px}

.search{
  height:44px;display:flex;flex:1;min-width:250px;
  border-radius:5px;overflow:hidden;background:#fff
}
.search select{width:58px;border:0;background:#f3f3f3;color:#333;padding:0 6px;border-right:1px solid #ddd}
.search input{flex:1;border:0;outline:0;padding:0 13px;font-size:15px;color:#111}
.search button{width:52px;border:0;background:var(--accent);font-size:20px}
.search button:hover{background:#f3a847}

.header-action{
  min-width:80px;height:50px;padding:5px 8px;color:#fff;
  display:flex;flex-direction:column;justify-content:center;
  border:1px solid transparent;border-radius:2px;position:relative
}
.header-action:hover{border-color:#fff}
.header-action small{font-size:11px;color:#ddd}
.header-action strong{font-size:14px;white-space:nowrap}
.cart-action{min-width:92px;flex-direction:row;align-items:center;gap:6px}
.cart-icon{font-size:30px}
.cart-count{
  position:absolute;left:28px;top:4px;color:#f08804;font-size:17px;font-weight:800
}

/* NAV */
.category-nav{
  height:42px;background:var(--nav2);color:#fff;
  display:flex;align-items:center;padding:0 18px;gap:4px;
  overflow-x:auto;white-space:nowrap;scrollbar-width:none
}
.category-nav::-webkit-scrollbar{display:none}
.category-nav a{
  padding:10px 12px;font-size:14px;border:1px solid transparent
}
.category-nav a:hover{border-color:#fff}

/* SEARCH SUGGESTIONS */
.suggestions{
  position:absolute;top:100%;left:0;right:0;background:#fff;
  color:#111;border:1px solid #bbb;box-shadow:0 3px 8px #0003;
  display:none;z-index:1200;max-height:360px;overflow:auto
}
.search-box{position:relative;display:flex;flex:1}
.suggestion{
  padding:10px 14px;display:flex;justify-content:space-between;
  gap:15px;font-size:14px;border-bottom:1px solid #eee
}
.suggestion:hover{background:#f3f3f3}

/* PAGE */
.container{max-width:1500px;margin:auto;padding:0 18px}
.hero{
  min-height:390px;position:relative;overflow:hidden;
  background:linear-gradient(100deg,#dfe9f4,#fff 55%,#dbe8f5);
}
.hero-slide{
  min-height:390px;padding:65px 8%;display:flex;align-items:center;
  justify-content:space-between;gap:30px
}
.hero-copy{max-width:610px;z-index:2}
.hero-kicker{font-size:15px;color:#555;margin-bottom:8px}
.hero h1{font-size:42px;line-height:1.08;margin-bottom:14px}
.hero p{font-size:18px;color:#333;max-width:560px;margin-bottom:20px}
.primary{
  background:var(--yellow);border:1px solid #fcd200;
  border-radius:24px;padding:11px 22px;font-weight:700
}
.primary:hover{background:#f7ca00}
.secondary{
  background:#fff;border:1px solid #888;border-radius:24px;
  padding:11px 22px;font-weight:700;margin-left:8px
}
.hero-product{
  width:350px;height:280px;object-fit:cover;border-radius:12px;
  box-shadow:0 18px 35px #0002
}
.hero-dots{position:absolute;bottom:15px;left:50%;transform:translateX(-50%);display:flex;gap:7px}
.hero-dot{width:9px;height:9px;border-radius:50%;background:#777;cursor:pointer}
.hero-dot.active{width:25px;border-radius:8px;background:#111}

/* CATEGORY / CARDS */
.section{margin:22px 0}
.section-card{background:#fff;padding:22px}
.section-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:15px}
.section-head h2{font-size:25px}
.section-head a{color:var(--link);font-size:14px}
.section-head a:hover{text-decoration:underline}

.category-grid{
  display:grid;grid-template-columns:repeat(8,1fr);gap:14px
}
.category-card{
  background:#fff;border:1px solid var(--border);min-height:145px;
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  text-align:center;padding:12px;transition:.18s
}
.category-card:hover{box-shadow:0 3px 10px #0002;transform:translateY(-2px)}
.category-card img{height:90px;width:110px;object-fit:contain;margin-bottom:8px}
.category-card strong{font-size:14px}

/* DEALS */
.deal-grid{
  display:grid;grid-template-columns:repeat(4,1fr);gap:18px
}
.deal-card{
  background:#fff;padding:16px;min-height:330px;position:relative
}
.deal-title{font-size:21px;margin-bottom:13px}
.deal-img{width:100%;height:190px;object-fit:contain;background:#f7f7f7}
.deal-price{margin-top:12px}
.deal-price strong{font-size:27px}
.discount{background:#cc0c39;color:#fff;font-size:12px;padding:5px 7px;margin-left:7px}
.deal-card a{display:block;color:var(--link);font-size:13px;margin-top:10px}

/* PRODUCTS */
.product-grid{
  display:grid;grid-template-columns:repeat(5,1fr);gap:14px
}
.product{
  background:#fff;min-width:0;position:relative;padding:12px;
  border:1px solid transparent;transition:.15s
}
.product:hover{border-color:#bbb;box-shadow:0 3px 10px #0002}
.product-img{
  width:100%;height:210px;object-fit:contain;background:#fff;margin-bottom:9px
}
.badge{display:inline-block;background:#cc0c39;color:#fff;padding:4px 7px;font-size:11px;font-weight:700;margin-bottom:6px}
.product-brand{font-size:12px;color:#565959;margin-bottom:3px}
.product-name{font-size:15px;min-height:42px}
.rating{color:#f08804;margin:7px 0;font-size:14px}
.rating span{color:#007185;font-size:12px;margin-left:5px}
.price{font-size:24px;margin:5px 0}
.price sup{font-size:13px}
.mrp{text-decoration:line-through;color:#565959;font-size:12px}
.off{color:#cc0c39;font-size:12px;font-weight:700;margin-left:4px}
.delivery{font-size:12px;color:#565959;margin-top:6px}
.delivery b{color:#007600}
.add-cart{
  width:100%;margin-top:10px;background:var(--yellow);
  border:1px solid #fcd200;border-radius:20px;padding:8px;font-size:13px
}
.add-cart:hover{background:#f7ca00}
.wishlist{
  position:absolute;right:12px;top:12px;width:32px;height:32px;
  border-radius:50%;border:1px solid #ddd;background:#fff;font-size:17px
}
.wishlist.active{color:#c4002f}

/* PROMO */
.promo{
  background:#fff;display:grid;grid-template-columns:repeat(4,1fr);
  border:1px solid var(--border)
}
.promo-item{padding:22px;display:flex;gap:14px;border-right:1px solid var(--border)}
.promo-item:last-child{border:0}
.promo-icon{font-size:34px}
.promo-item strong{display:block;font-size:15px}
.promo-item span{font-size:12px;color:#565959}

/* FOOTER */
.back-top{background:#37475a;color:#fff;text-align:center;padding:15px;font-size:13px}
.back-top:hover{background:#485769}
footer{background:#232f3e;color:#ddd}
.footer-main{
  max-width:1300px;margin:auto;padding:40px 22px;
  display:grid;grid-template-columns:2fr repeat(4,1fr);gap:35px
}
.footer-main h3{color:#fff;font-size:16px;margin-bottom:13px}
.footer-main a{display:block;color:#ddd;font-size:13px;margin:8px 0}
.footer-main a:hover{text-decoration:underline}
.footer-desc{font-size:13px;line-height:1.6;color:#ccc}
.footer-bottom{
  border-top:1px solid #45505e;text-align:center;padding:20px;font-size:12px;color:#bbb
}

/* DRAWER / MODAL */
.overlay{
  position:fixed;inset:0;background:#0007;display:none;z-index:2000
}
.overlay.open{display:block}
.cart{
  position:fixed;right:0;top:0;bottom:0;width:min(440px,94vw);
  background:#fff;z-index:2100;transform:translateX(100%);
  transition:transform .25s;display:flex;flex-direction:column
}
.cart.open{transform:translateX(0)}
.cart-head{padding:18px;border-bottom:1px solid #ddd;display:flex;justify-content:space-between}
.cart-head h2{font-size:22px}
.close{border:0;background:#eee;border-radius:50%;width:32px;height:32px}
.cart-items{flex:1;overflow:auto;padding:15px}
.cart-item{display:flex;gap:10px;padding:12px 0;border-bottom:1px solid #ddd}
.cart-item img{width:75px;height:75px;object-fit:contain}
.cart-info{flex:1}
.cart-info strong{display:block;font-size:14px}
.cart-info small{color:#565959}
.qty{display:flex;gap:8px;align-items:center;margin-top:7px}
.qty button{width:25px;height:25px;border:1px solid #aaa;background:#fff}
.cart-foot{border-top:1px solid #ddd;padding:18px}
.cart-total{display:flex;justify-content:space-between;font-size:19px;font-weight:700;margin-bottom:13px}
.checkout{width:100%;padding:12px;border:1px solid #fcd200;background:var(--yellow);border-radius:20px;font-weight:700}
.empty{text-align:center;color:#565959;padding:60px 15px}

.modal{
  position:fixed;left:50%;top:50%;transform:translate(-50%,-46%);
  width:min(850px,94vw);max-height:90vh;overflow:auto;background:#fff;
  z-index:2200;display:none;box-shadow:0 20px 60px #0007
}
.modal.open{display:block;transform:translate(-50%,-50%)}
.modal-body{display:grid;grid-template-columns:1fr 1fr}
.modal-image{padding:25px;background:#fafafa;display:flex;align-items:center;justify-content:center}
.modal-image img{width:100%;height:380px;object-fit:contain}
.modal-info{padding:28px}
.modal-info h2{font-size:25px;margin:8px 0}
.modal-info p{color:#565959;font-size:14px;line-height:1.6;margin:12px 0}
.modal-price{font-size:30px;font-weight:700;margin:12px 0}

/* TOAST */
.toast{
  position:fixed;bottom:25px;left:50%;transform:translateX(-50%);
  background:#111;color:#fff;padding:12px 20px;border-radius:4px;
  display:none;z-index:3000;box-shadow:0 5px 20px #0005
}
.toast.show{display:block}

/* RESPONSIVE */
@media(max-width:1100px){
  .location{display:none}
  .category-grid{grid-template-columns:repeat(4,1fr)}
  .deal-grid{grid-template-columns:repeat(2,1fr)}
  .product-grid{grid-template-columns:repeat(4,1fr)}
  .footer-main{grid-template-columns:repeat(3,1fr)}
}
@media(max-width:800px){
  .top-strip{display:none}
  .main-header{flex-wrap:wrap;position:relative}
  .logo{width:105px}
  .header-action{min-width:65px}
  .search{order:3;flex-basis:100%}
  .hero-slide{padding:40px 6%;min-height:350px}
  .hero h1{font-size:32px}
  .hero-product{width:250px;height:220px}
  .product-grid{grid-template-columns:repeat(2,1fr)}
  .promo{grid-template-columns:repeat(2,1fr)}
  .promo-item:nth-child(2){border-right:0}
  .modal-body{grid-template-columns:1fr}
}
@media(max-width:520px){
  .main-header{padding:7px 9px}
  .logo{font-size:21px;width:90px}
  .header-action{display:none}
  .cart-action{display:flex}
  .category-nav{padding:0 8px}
  .container{padding:0 8px}
  .hero{min-height:420px}
  .hero-slide{display:block;padding:35px 25px}
  .hero-product{width:100%;height:190px;margin-top:20px}
  .hero h1{font-size:29px}
  .category-grid{grid-template-columns:repeat(2,1fr)}
  .deal-grid{grid-template-columns:1fr}
  .product-grid{grid-template-columns:repeat(2,1fr);gap:8px}
  .product{padding:9px}
  .product-img{height:160px}
  .product-name{font-size:13px}
  .price{font-size:20px}
  .promo{grid-template-columns:1fr}
  .promo-item{border-right:0;border-bottom:1px solid var(--border)}
  .footer-main{grid-template-columns:1fr 1fr;gap:22px}
  .footer-main>div:first-child{grid-column:1/-1}
}
</style>
</head>

<body>

<!-- SMALL UTILITY BAR -->
<div class="top-strip">
  <a href="#">Customer Service</a>
  <a href="#">Sell on BazaarX</a>
  <a href="#">Gift Cards</a>
  <a href="#">Today's Deals</a>
  <a href="#">Track Order</a>
</div>

<!-- MAIN AMAZON-STYLE HEADER -->
<header class="main-header">
  <a class="logo" href="#">Bazaar<span>X</span></a>

  <div class="location">
    <span style="font-size:24px">📍</span>
    <div><small>Deliver to</small><strong id="locationText">Hyderabad 500001</strong></div>
  </div>

  <div class="search-box">
    <form class="search" id="searchForm">
      <select id="searchCategory" aria-label="Search category">
        <option>All</option>
        <option>Electronics</option>
        <option>Mobiles</option>
        <option>Fashion</option>
        <option>Home</option>
        <option>Books</option>
      </select>
      <input id="searchInput" type="search" placeholder="Search BazaarX" autocomplete="off">
      <button type="submit" aria-label="Search">🔍</button>
    </form>
    <div class="suggestions" id="suggestions"></div>
  </div>

  <button class="header-action" id="accountBtn">
    <small>Hello, Sign in</small><strong>Account & Lists ▾</strong>
  </button>

  <button class="header-action">
    <small>Returns</small><strong>& Orders</strong>
  </button>

  <button class="header-action cart-action" id="cartBtn" aria-label="Open cart">
    <span class="cart-icon">🛒</span>
    <span class="cart-count" id="cartCount">0</span>
    <strong>Cart</strong>
  </button>
</header>

<!-- CATEGORY NAV -->
<nav class="category-nav">
  <a href="#categories">☰ All</a>
  <a href="#deals">Today's Deals</a>
  <a href="#products">Best Sellers</a>
  <a href="#electronics">Electronics</a>
  <a href="#fashion">Fashion</a>
  <a href="#home">Home & Kitchen</a>
  <a href="#books">Books</a>
  <a href="#beauty">Beauty</a>
  <a href="#sports">Sports</a>
  <a href="#new">New Releases</a>
  <a href="#customer">Customer Service</a>
</nav>

<!-- HERO -->
<section class="hero" id="hero">
  <div class="hero-slide">
    <div class="hero-copy">
      <div class="hero-kicker">BazaarX Big Savings Event</div>
      <h1>Everything you need.<br>Delivered to your door.</h1>
      <p>Discover electronics, fashion, home essentials, books and thousands of everyday products at competitive prices.</p>
      <button class="primary" onclick="document.getElementById('products').scrollIntoView()">Shop today's deals</button>
      <button class="secondary" onclick="document.getElementById('categories').scrollIntoView()">Explore categories</button>
    </div>
    <img class="hero-product" id="heroImage"
         src="https://images.unsplash.com/photo-1607082349566-187342175e2f?auto=format&fit=crop&w=900&q=80"
         alt="Online shopping">
  </div>
  <div class="hero-dots">
    <span class="hero-dot active" data-slide="0"></span>
    <span class="hero-dot" data-slide="1"></span>
    <span class="hero-dot" data-slide="2"></span>
  </div>
</section>

<main class="container">

<!-- PROMISE STRIP -->
<section class="section">
  <div class="promo">
    <div class="promo-item"><span class="promo-icon">🚚</span><div><strong>Fast Delivery</strong><span>Reliable delivery across India</span></div></div>
    <div class="promo-item"><span class="promo-icon">↩️</span><div><strong>Easy Returns</strong><span>Simple return experience</span></div></div>
    <div class="promo-item"><span class="promo-icon">🔒</span><div><strong>Secure Payments</strong><span>UPI, cards, net banking & COD</span></div></div>
    <div class="promo-item"><span class="promo-icon">✓</span><div><strong>Trusted Shopping</strong><span>Verified sellers & buyer support</span></div></div>
  </div>
</section>

<!-- CATEGORIES -->
<section class="section" id="categories">
  <div class="section-card">
    <div class="section-head"><h2>Shop by Category</h2><a href="#">See all</a></div>
    <div class="category-grid">
      <a class="category-card" href="#products" data-category="Electronics">
        <img src="https://images.unsplash.com/photo-1498049794561-7780e7231661?auto=format&fit=crop&w=400&q=80" alt="Electronics"><strong>Electronics</strong>
      </a>
      <a class="category-card" href="#products" data-category="Mobiles">
        <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=400&q=80" alt="Mobiles"><strong>Mobiles</strong>
      </a>
      <a class="category-card" href="#products" data-category="Fashion">
        <img src="https://images.unsplash.com/photo-1445205170230-053b83016050?auto=format&fit=crop&w=400&q=80" alt="Fashion"><strong>Fashion</strong>
      </a>
      <a class="category-card" href="#products" data-category="Home">
        <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=400&q=80" alt="Home"><strong>Home</strong>
      </a>
      <a class="category-card" href="#products" data-category="Kitchen">
        <img src="https://images.unsplash.com/photo-1556911220-bff31c812dba?auto=format&fit=crop&w=400&q=80" alt="Kitchen"><strong>Kitchen</strong>
      </a>
      <a class="category-card" href="#products" data-category="Books">
        <img src="https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&w=400&q=80" alt="Books"><strong>Books</strong>
      </a>
      <a class="category-card" href="#products" data-category="Sports">
        <img src="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?auto=format&fit=crop&w=400&q=80" alt="Sports"><strong>Sports</strong>
      </a>
      <a class="category-card" href="#products" data-category="Beauty">
        <img src="https://images.unsplash.com/photo-1596462502278-27bfdc403348?auto=format&fit=crop&w=400&q=80" alt="Beauty"><strong>Beauty</strong>
      </a>
    </div>
  </div>
</section>

<!-- DEALS -->
<section class="section" id="deals">
  <div class="section-card">
    <div class="section-head"><h2>Today's Deals <span id="dealTimer" style="font-size:13px;color:#cc0c39;margin-left:10px"></span></h2><a href="#">See all deals</a></div>
    <div class="deal-grid">
      <article class="deal-card">
        <h3 class="deal-title">Top Electronics Deals</h3>
        <img class="deal-img" src="https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?auto=format&fit=crop&w=700&q=80" alt="Smartphone">
        <div class="deal-price"><strong>₹19,999</strong><span class="discount">Up to 35% off</span></div>
        <a href="#products">Shop now</a>
      </article>
      <article class="deal-card">
        <h3 class="deal-title">Fashion Under ₹1,499</h3>
        <img class="deal-img" src="https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=700&q=80" alt="Fashion">
        <div class="deal-price"><strong>From ₹399</strong><span class="discount">Up to 60% off</span></div>
        <a href="#products">Explore fashion</a>
      </article>
      <article class="deal-card">
        <h3 class="deal-title">Home Essentials</h3>
        <img class="deal-img" src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=700&q=80" alt="Home essentials">
        <div class="deal-price"><strong>From ₹299</strong><span class="discount">Up to 50% off</span></div>
        <a href="#products">Shop home</a>
      </article>
      <article class="deal-card">
        <h3 class="deal-title">Books & Learning</h3>
        <img class="deal-img" src="https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=700&q=80" alt="Books">
        <div class="deal-price"><strong>From ₹199</strong><span class="discount">Up to 45% off</span></div>
        <a href="#products">Browse books</a>
      </article>
    </div>
  </div>
</section>

<!-- BEST SELLERS -->
<section class="section" id="products">
  <div class="section-card">
    <div class="section-head">
      <h2>Best Sellers in BazaarX</h2>
      <a href="#" id="clearFilter">Clear filter</a>
    </div>
    <div class="product-grid" id="productGrid">

      <article class="product" data-id="1" data-category="Mobiles Electronics" data-name="Samsung Galaxy S24 FE 5G" data-price="34999">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=700&q=80" alt="Samsung smartphone">
        <span class="badge">DEAL</span>
        <div class="product-brand">Samsung</div>
        <div class="product-name">Galaxy S24 FE 5G, 128 GB, premium smartphone</div>
        <div class="rating">★★★★☆ <span>4.5 (12,847)</span></div>
        <div class="price"><sup>₹</sup>34,999</div>
        <span class="mrp">M.R.P. ₹54,999</span><span class="off">36% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="2" data-category="Electronics Audio" data-name="boAt Airdopes ANC Earbuds" data-price="1299">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?auto=format&fit=crop&w=700&q=80" alt="Wireless earbuds">
        <span class="badge">BEST DEAL</span>
        <div class="product-brand">boAt</div>
        <div class="product-name">Airdopes ANC Wireless Earbuds with long battery life</div>
        <div class="rating">★★★★☆ <span>4.3 (28,301)</span></div>
        <div class="price"><sup>₹</sup>1,299</div>
        <span class="mrp">M.R.P. ₹4,999</span><span class="off">74% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="3" data-category="Fashion Footwear" data-name="Nike Air Max Running Shoes" data-price="5995">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=700&q=80" alt="Nike shoes">
        <span class="badge">LIMITED OFFER</span>
        <div class="product-brand">Nike</div>
        <div class="product-name">Air Max running shoes with cushioned everyday comfort</div>
        <div class="rating">★★★★★ <span>4.6 (9,202)</span></div>
        <div class="price"><sup>₹</sup>5,995</div>
        <span class="mrp">M.R.P. ₹8,995</span><span class="off">33% off</span>
        <div class="delivery"><b>FREE Delivery</b> 2 days</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="4" data-category="Electronics Wearables" data-name="Noise ColorFit Smartwatch" data-price="3499">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=700&q=80" alt="Smartwatch">
        <span class="badge">DEAL</span>
        <div class="product-brand">Noise</div>
        <div class="product-name">ColorFit Ultra 3 AMOLED Smartwatch with fitness tracking</div>
        <div class="rating">★★★★☆ <span>4.4 (18,556)</span></div>
        <div class="price"><sup>₹</sup>3,499</div>
        <span class="mrp">M.R.P. ₹8,999</span><span class="off">61% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="5" data-category="Electronics Laptops" data-name="Lenovo IdeaPad Slim Laptop" data-price="37990">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=700&q=80" alt="Lenovo laptop">
        <span class="badge">TOP PICK</span>
        <div class="product-brand">Lenovo</div>
        <div class="product-name">IdeaPad Slim 3 laptop with high-performance processor</div>
        <div class="rating">★★★★☆ <span>4.2 (5,821)</span></div>
        <div class="price"><sup>₹</sup>37,990</div>
        <span class="mrp">M.R.P. ₹54,990</span><span class="off">31% off</span>
        <div class="delivery"><b>FREE Delivery</b> 2 days</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="6" data-category="Electronics TVs" data-name="MI 43 inch 4K Smart TV" data-price="26999">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?auto=format&fit=crop&w=700&q=80" alt="Smart TV">
        <span class="badge">DEAL</span>
        <div class="product-brand">MI</div>
        <div class="product-name">43-inch 4K Ultra HD Smart Google TV</div>
        <div class="rating">★★★★☆ <span>4.5 (21,443)</span></div>
        <div class="price"><sup>₹</sup>26,999</div>
        <span class="mrp">M.R.P. ₹42,999</span><span class="off">37% off</span>
        <div class="delivery"><b>FREE Delivery</b> 2 days</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="7" data-category="Gaming Electronics" data-name="Sony DualSense Wireless Controller" data-price="5990">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1605901309584-818e25960a8f?auto=format&fit=crop&w=700&q=80" alt="Gaming controller">
        <span class="badge">BEST SELLER</span>
        <div class="product-brand">Sony</div>
        <div class="product-name">DualSense Wireless Controller for PlayStation</div>
        <div class="rating">★★★★★ <span>4.7 (7,663)</span></div>
        <div class="price"><sup>₹</sup>5,990</div>
        <span class="mrp">M.R.P. ₹6,990</span><span class="off">14% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="8" data-category="Home Kitchen" data-name="Prestige Induction Cooktop" data-price="2199">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1556911220-bff31c812dba?auto=format&fit=crop&w=700&q=80" alt="Kitchen appliance">
        <span class="badge">DEAL</span>
        <div class="product-brand">Prestige</div>
        <div class="product-name">Induction cooktop with preset cooking functions</div>
        <div class="rating">★★★★☆ <span>4.3 (14,200)</span></div>
        <div class="price"><sup>₹</sup>2,199</div>
        <span class="mrp">M.R.P. ₹3,999</span><span class="off">45% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="9" data-category="Books" data-name="Atomic Habits Book" data-price="299">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=700&q=80" alt="Book">
        <span class="badge">POPULAR</span>
        <div class="product-brand">Penguin</div>
        <div class="product-name">Atomic Habits - proven ways to build better habits</div>
        <div class="rating">★★★★★ <span>4.8 (110,453)</span></div>
        <div class="price"><sup>₹</sup>299</div>
        <span class="mrp">M.R.P. ₹499</span><span class="off">40% off</span>
        <div class="delivery"><b>FREE Delivery</b> Tomorrow</div>
        <button class="add-cart">Add to Cart</button>
      </article>

      <article class="product" data-id="10" data-category="Fashion Bags" data-name="American Tourister Backpack" data-price="2199">
        <button class="wishlist" aria-label="Wishlist">♡</button>
        <img class="product-img" src="https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=700&q=80" alt="Backpack">
        <span class="badge">NEW</span>
        <div class="product-brand">American Tourister</div>
        <div class="product-name">Cabin backpack with laptop compartment</div>
        <div class="rating">★★★★☆ <span>4.3 (8,901)</span></div>
        <div class="price"><sup>₹</sup>2,199</div>
        <span class="mrp">M.R.P. ₹3,999</span><span class="off">45% off</span>
        <div class="delivery"><b>FREE Delivery</b> 2 days</div>
        <button class="add-cart">Add to Cart</button>
      </article>

    </div>
  </div>
</section>

<!-- RECOMMENDATIONS -->
<section class="section">
  <div class="section-card">
    <div class="section-head"><h2>Inspired by your shopping</h2><a href="#">View more</a></div>
    <div class="product-grid">
      <article class="product">
        <img class="product-img" src="https://images.unsplash.com/photo-1572635196237-14b3f281503f?auto=format&fit=crop&w=700&q=80" alt="Sunglasses">
        <div class="product-brand">Ray-Ban</div><div class="product-name">Classic UV-protected sunglasses</div>
        <div class="rating">★★★★☆ <span>4.6 (3,201)</span></div><div class="price"><sup>₹</sup>4,999</div>
        <span class="mrp">M.R.P. ₹8,500</span><span class="off">41% off</span>
        <button class="add-cart">Add to Cart</button>
      </article>
      <article class="product">
        <img class="product-img" src="https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=700&q=80" alt="Women's fashion">
        <div class="product-brand">Lavie</div><div class="product-name">Everyday tote shoulder bag</div>
        <div class="rating">★★★★☆ <span>4.4 (6,102)</span></div><div class="price"><sup>₹</sup>1,499</div>
        <span class="mrp">M.R.P. ₹2,999</span><span class="off">50% off</span>
        <button class="add-cart">Add to Cart</button>
      </article>
      <article class="product">
        <img class="product-img" src="https://images.unsplash.com/photo-1556228578-8c89e6adf883?auto=format&fit=crop&w=700&q=80" alt="Skincare">
        <div class="product-brand">Beauty Care</div><div class="product-name">Daily skincare essentials kit</div>
        <div class="rating">★★★★☆ <span>4.5 (4,200)</span></div><div class="price"><sup>₹</sup>699</div>
        <span class="mrp">M.R.P. ₹999</span><span class="off">30% off</span>
        <button class="add-cart">Add to Cart</button>
      </article>
      <article class="product">
        <img class="product-img" src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=700&q=80" alt="Laptop">
        <div class="product-brand">Accessories</div><div class="product-name">Premium laptop workspace essentials</div>
        <div class="rating">★★★★★ <span>4.7 (2,450)</span></div><div class="price"><sup>₹</sup>2,499</div>
        <span class="mrp">M.R.P. ₹3,999</span><span class="off">38% off</span>
        <button class="add-cart">Add to Cart</button>
      </article>
      <article class="product">
        <img class="product-img" src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=700&q=80" alt="Shoes">
        <div class="product-brand">Sports</div><div class="product-name">Lightweight everyday sneakers</div>
        <div class="rating">★★★★☆ <span>4.4 (5,210)</span></div><div class="price"><sup>₹</sup>1,899</div>
        <span class="mrp">M.R.P. ₹2,999</span><span class="off">37% off</span>
        <button class="add-cart">Add to Cart</button>
      </article>
    </div>
  </div>
</section>

</main>

<!-- BACK TO TOP -->
<div class="back-top" onclick="window.scrollTo({top:0,behavior:'smooth'})">Back to top</div>

<!-- FOOTER -->
<footer id="customer">
  <div class="footer-main">
    <div>
      <div class="logo" style="border:0;margin-bottom:12px">Bazaar<span>X</span></div>
      <p class="footer-desc">BazaarX is a demonstration e-commerce storefront designed with an Amazon-style marketplace layout. Connect the JSP to your Java backend, database, authentication and payment services for production use.</p>
    </div>
    <div><h3>Get to Know Us</h3><a href="#">About BazaarX</a><a href="#">Careers</a><a href="#">Press Releases</a><a href="#">Investor Relations</a></div>
    <div><h3>Make Money</h3><a href="#">Sell on BazaarX</a><a href="#">Seller Central</a><a href="#">Advertise Products</a><a href="#">Become an Affiliate</a></div>
    <div><h3>Customer Service</h3><a href="#">Your Account</a><a href="#">Returns & Refunds</a><a href="#">Shipping Information</a><a href="#">Contact Us</a></div>
    <div><h3>Payment</h3><a href="#">Credit / Debit Cards</a><a href="#">UPI</a><a href="#">Net Banking</a><a href="#">Cash on Delivery</a></div>
  </div>
  <div class="footer-bottom">
    © 2026 BazaarX India Pvt. Ltd. &nbsp; | &nbsp; Privacy Notice &nbsp; | &nbsp; Terms &nbsp; | &nbsp; Help
  </div>
</footer>

<!-- OVERLAY -->
<div class="overlay" id="overlay"></div>

<!-- CART -->
<aside class="cart" id="cart">
  <div class="cart-head">
    <h2>Shopping Cart</h2>
    <button class="close" id="closeCart">✕</button>
  </div>
  <div class="cart-items" id="cartItems"></div>
  <div class="cart-foot">
    <div class="cart-total"><span>Subtotal</span><span id="cartTotal">₹0</span></div>
    <button class="checkout" id="checkout">Proceed to Buy</button>
  </div>
</aside>

<!-- QUICK VIEW MODAL -->
<div class="modal" id="productModal">
  <button class="close" style="position:absolute;right:12px;top:12px;z-index:3" id="closeModal">✕</button>
  <div class="modal-body">
    <div class="modal-image"><img id="modalImage" src="" alt=""></div>
    <div class="modal-info">
      <div class="product-brand" id="modalBrand"></div>
      <h2 id="modalName"></h2>
      <div class="rating">★★★★★ <span id="modalRating"></span></div>
      <div class="modal-price" id="modalPrice"></div>
      <p>Secure checkout, multiple payment options, delivery tracking and easy returns are supported by the storefront flow.</p>
      <button class="primary" id="modalAdd">Add to Cart</button>
    </div>
  </div>
</div>

<div class="toast" id="toast"></div>

<script>
(function(){
  "use strict";

  const products = Array.from(document.querySelectorAll(".product[data-id]"));
  const cart = JSON.parse(localStorage.getItem("bazaarx_cart") || "{}");
  const wishlist = JSON.parse(localStorage.getItem("bazaarx_wishlist") || "[]");

  const cartEl = document.getElementById("cart");
  const overlay = document.getElementById("overlay");
  const cartItems = document.getElementById("cartItems");
  const cartCount = document.getElementById("cartCount");
  const cartTotal = document.getElementById("cartTotal");
  const toastEl = document.getElementById("toast");

  function money(value){
    return "₹" + Number(value).toLocaleString("en-IN");
  }

  function productData(card){
    return {
      id: card.dataset.id,
      name: card.dataset.name,
      price: Number(card.dataset.price),
      image: card.querySelector(".product-img").src,
      brand: card.querySelector(".product-brand")?.textContent || "",
      rating: card.querySelector(".rating")?.textContent || ""
    };
  }

  const productMap = {};
  products.forEach(p => productMap[p.dataset.id] = productData(p));

  function showToast(message){
    toastEl.textContent = message;
    toastEl.classList.add("show");
    clearTimeout(showToast.timer);
    showToast.timer = setTimeout(() => toastEl.classList.remove("show"), 2200);
  }

  function saveCart(){
    localStorage.setItem("bazaarx_cart", JSON.stringify(cart));
  }

  function renderCart(){
    const ids = Object.keys(cart).filter(id => cart[id] > 0);
    const count = ids.reduce((sum,id) => sum + cart[id],0);
    cartCount.textContent = count;

    if(!ids.length){
      cartItems.innerHTML = '<div class="empty"><div style="font-size:50px">🛒</div><h3>Your cart is empty</h3><p>Add products to get started.</p></div>';
      cartTotal.textContent = "₹0";
      return;
    }

    let total = 0;
    cartItems.innerHTML = ids.map(id => {
      const p = productMap[id];
      if(!p) return "";
      const qty = cart[id];
      total += p.price * qty;
      return `
        <div class="cart-item" data-id="${id}">
          <img src="${p.image}" alt="${p.name}">
          <div class="cart-info">
            <strong>${p.name}</strong>
            <div style="font-weight:700;margin-top:5px">${money(p.price)}</div>
            <div class="qty">
              <button data-action="dec">−</button>
              <span>${qty}</span>
              <button data-action="inc">+</button>
              <button data-action="remove" style="margin-left:8px;width:auto;padding:0 7px">Remove</button>
            </div>
          </div>
        </div>`;
    }).join("");

    cartTotal.textContent = money(total);
    saveCart();
  }

  function addToCart(id, qty){
    cart[id] = (cart[id] || 0) + (qty || 1);
    renderCart();
    showToast(productMap[id].name + " added to cart");
  }

  function openCart(){
    cartEl.classList.add("open");
    overlay.classList.add("open");
  }

  function closePanels(){
    cartEl.classList.remove("open");
    document.getElementById("productModal").classList.remove("open");
    overlay.classList.remove("open");
  }

  document.getElementById("cartBtn").addEventListener("click", openCart);
  document.getElementById("closeCart").addEventListener("click", closePanels);
  overlay.addEventListener("click", closePanels);

  cartItems.addEventListener("click", function(e){
    const btn = e.target.closest("button");
    if(!btn) return;
    const row = e.target.closest(".cart-item");
    const id = row.dataset.id;
    const action = btn.dataset.action;
    if(action === "inc") cart[id]++;
    if(action === "dec"){ cart[id]--; if(cart[id] <= 0) delete cart[id]; }
    if(action === "remove") delete cart[id];
    renderCart();
  });

  document.getElementById("checkout").addEventListener("click", function(){
    if(!Object.keys(cart).length){
      showToast("Your cart is empty");
      return;
    }
    showToast("Demo checkout opened - connect your payment service here");
  });

  document.querySelectorAll(".add-cart").forEach(btn => {
    btn.addEventListener("click", function(e){
      e.stopPropagation();
      const card = btn.closest(".product");
      addToCart(card.dataset.id,1);
    });
  });

  /* WISHLIST */
  document.querySelectorAll(".wishlist").forEach(btn => {
    const id = btn.closest(".product").dataset.id;
    if(wishlist.includes(id)) btn.classList.add("active"), btn.textContent = "♥";

    btn.addEventListener("click", function(e){
      e.stopPropagation();
      const index = wishlist.indexOf(id);
      if(index >= 0){
        wishlist.splice(index,1);
        btn.classList.remove("active");
        btn.textContent = "♡";
        showToast("Removed from wishlist");
      }else{
        wishlist.push(id);
        btn.classList.add("active");
        btn.textContent = "♥";
        showToast("Added to wishlist");
      }
      localStorage.setItem("bazaarx_wishlist", JSON.stringify(wishlist));
    });
  });

  /* QUICK VIEW */
  const modal = document.getElementById("productModal");
  let modalProductId = null;

  products.forEach(card => {
    card.addEventListener("dblclick", function(){
      const p = productData(card);
      modalProductId = p.id;
      document.getElementById("modalImage").src = p.image;
      document.getElementById("modalImage").alt = p.name;
      document.getElementById("modalBrand").textContent = p.brand;
      document.getElementById("modalName").textContent = p.name;
      document.getElementById("modalRating").textContent = p.rating.replace("★★★★★","").trim();
      document.getElementById("modalPrice").textContent = money(p.price);
      modal.classList.add("open");
      overlay.classList.add("open");
    });
  });

  document.getElementById("closeModal").addEventListener("click", closePanels);
  document.getElementById("modalAdd").addEventListener("click", function(){
    if(modalProductId) addToCart(modalProductId,1);
    closePanels();
  });

  /* SEARCH */
  const input = document.getElementById("searchInput");
  const suggestions = document.getElementById("suggestions");

  function renderSuggestions(q){
    q = q.trim().toLowerCase();
    if(!q){ suggestions.style.display="none"; return; }

    const matches = Object.values(productMap)
      .filter(p => p.name.toLowerCase().includes(q) || p.brand.toLowerCase().includes(q))
      .slice(0,7);

    if(!matches.length){
      suggestions.innerHTML = '<div class="suggestion">No matching products found</div>';
    }else{
      suggestions.innerHTML = matches.map(p =>
        `<div class="suggestion" data-id="${p.id}"><span>${p.brand} - ${p.name}</span><b>${money(p.price)}</b></div>`
      ).join("");
    }
    suggestions.style.display = "block";
  }

  input.addEventListener("input", () => renderSuggestions(input.value));
  input.addEventListener("focus", () => renderSuggestions(input.value));

  suggestions.addEventListener("click", function(e){
    const row = e.target.closest(".suggestion[data-id]");
    if(!row) return;
    const card = products.find(p => p.dataset.id === row.dataset.id);
    if(card){
      card.scrollIntoView({behavior:"smooth",block:"center"});
      card.style.outline = "3px solid #ff9900";
      setTimeout(() => card.style.outline = "", 1300);
    }
    suggestions.style.display = "none";
  });

  document.addEventListener("click", e => {
    if(!e.target.closest(".search-box")) suggestions.style.display = "none";
  });

  document.getElementById("searchForm").addEventListener("submit", function(e){
    e.preventDefault();
    const q = input.value.trim().toLowerCase();
    if(!q){ showToast("Enter a product or brand to search"); return; }

    let found = products.filter(p =>
      p.dataset.name.toLowerCase().includes(q) ||
      p.dataset.category.toLowerCase().includes(q)
    );

    products.forEach(p => p.style.display = "none");
    found.forEach(p => p.style.display = "");
    document.getElementById("products").scrollIntoView({behavior:"smooth"});
    showToast(found.length ? found.length + " products found" : "No products found");
    suggestions.style.display = "none";
  });

  /* CATEGORY FILTER */
  document.querySelectorAll(".category-card").forEach(cat => {
    cat.addEventListener("click", function(){
      const category = cat.dataset.category.toLowerCase();
      products.forEach(p => {
        p.style.display = p.dataset.category.toLowerCase().includes(category) ? "" : "none";
      });
      document.getElementById("products").scrollIntoView({behavior:"smooth"});
      showToast("Showing " + cat.dataset.category);
    });
  });

  document.getElementById("clearFilter").addEventListener("click", function(e){
    e.preventDefault();
    products.forEach(p => p.style.display = "");
    input.value = "";
    showToast("All products restored");
  });

  /* HERO ROTATION */
  const heroImage = document.getElementById("heroImage");
  const heroImages = [
    "https://images.unsplash.com/photo-1607082349566-187342175e2f?auto=format&fit=crop&w=900&q=80",
    "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=900&q=80",
    "https://images.unsplash.com/photo-1601598851547-4302969d84c6?auto=format&fit=crop&w=900&q=80"
  ];
  let heroIndex = 0;

  document.querySelectorAll(".hero-dot").forEach(dot => {
    dot.addEventListener("click", () => {
      heroIndex = Number(dot.dataset.slide);
      heroImage.src = heroImages[heroIndex];
      document.querySelectorAll(".hero-dot").forEach(d => d.classList.remove("active"));
      dot.classList.add("active");
    });
  });

  setInterval(() => {
    heroIndex = (heroIndex + 1) % heroImages.length;
    heroImage.src = heroImages[heroIndex];
    document.querySelectorAll(".hero-dot").forEach((d,i) => d.classList.toggle("active", i === heroIndex));
  }, 5000);

  /* DEAL TIMER */
  let seconds = 3 * 60 * 60 + 24 * 60 + 10;
  const timer = document.getElementById("dealTimer");
  setInterval(() => {
    seconds--;
    if(seconds < 0) seconds = 3 * 60 * 60;
    const h = String(Math.floor(seconds / 3600)).padStart(2,"0");
    const m = String(Math.floor((seconds % 3600) / 60)).padStart(2,"0");
    const s = String(seconds % 60).padStart(2,"0");
    timer.textContent = "Ends in " + h + ":" + m + ":" + s;
  },1000);

  renderCart();
})();
</script>
</body>
</html>

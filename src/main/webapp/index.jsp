<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>BazaarX — India ka Apna Store</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=DM+Serif+Display&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --primary: #0F3460;
      --accent: #E94560;
      --orange: #FF6B35;
      --yellow: #FFD600;
      --green: #00C853;
      --bg: #F4F6FB;
      --white: #ffffff;
      --text: #1a1a2e;
      --muted: #6b7280;
      --border: #e5e7eb;
      --card: #ffffff;
      --nav-h: 56px;
      --sub-nav-h: 40px;
    }

    body { font-family: 'DM Sans', sans-serif; background: var(--bg); color: var(--text); min-height: 100vh; }

    a { text-decoration: none; color: inherit; }
    img { display: block; }
    button { cursor: pointer; font-family: inherit; }

    /* ── TOP BAR ── */
    .topbar {
      background: var(--primary);
      color: #cdd3e0;
      font-size: 0.78rem;
      padding: 0.3rem 1.5rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .topbar a { color: #cdd3e0; }
    .topbar a:hover { color: #fff; }
    .topbar-left, .topbar-right { display: flex; gap: 1.2rem; align-items: center; }

    /* ── NAVBAR ── */
    nav {
      position: sticky; top: 0; z-index: 200;
      background: var(--primary);
      height: var(--nav-h);
      display: flex;
      align-items: center;
      padding: 0 1.5rem;
      gap: 1.2rem;
      box-shadow: 0 2px 12px rgba(15,52,96,0.18);
    }

    .nav-logo {
      font-family: 'DM Serif Display', serif;
      font-size: 1.55rem;
      color: var(--yellow);
      white-space: nowrap;
      letter-spacing: -0.5px;
      flex-shrink: 0;
    }
    .nav-logo span { color: var(--accent); }

    .nav-location {
      display: flex; flex-direction: column;
      font-size: 0.72rem; color: #cdd3e0;
      flex-shrink: 0; cursor: pointer; line-height: 1.2;
    }
    .nav-location strong { color: #fff; font-size: 0.85rem; }

    /* Search bar */
    .search-wrap {
      flex: 1;
      display: flex;
      border-radius: 8px;
      overflow: hidden;
      border: 2px solid var(--yellow);
      height: 40px;
    }
    .search-cat {
      background: #e8ecf2;
      border: none;
      padding: 0 0.7rem;
      font-size: 0.8rem;
      color: var(--text);
      border-right: 1px solid var(--border);
      cursor: pointer;
    }
    .search-input {
      flex: 1;
      border: none;
      outline: none;
      padding: 0 1rem;
      font-size: 0.95rem;
      font-family: 'DM Sans', sans-serif;
    }
    .search-btn {
      background: var(--yellow);
      border: none;
      padding: 0 1rem;
      font-size: 1.1rem;
      display: flex; align-items: center; justify-content: center;
      transition: background 0.2s;
    }
    .search-btn:hover { background: #f0c500; }

    /* Nav icons */
    .nav-icons { display: flex; gap: 0.5rem; align-items: center; flex-shrink: 0; }

    .nav-icon-btn {
      display: flex; flex-direction: column; align-items: center;
      background: transparent; border: none;
      color: #fff; font-size: 0.7rem;
      padding: 0.3rem 0.6rem;
      border-radius: 6px;
      transition: background 0.15s;
      line-height: 1.3;
      white-space: nowrap;
    }
    .nav-icon-btn:hover { background: rgba(255,255,255,0.12); }
    .nav-icon-btn .icon { font-size: 1.3rem; }
    .nav-icon-btn .badge-wrap { position: relative; display: inline-block; }
    .nav-badge {
      position: absolute; top: -6px; right: -8px;
      background: var(--accent); color: #fff;
      font-size: 0.65rem; font-weight: 700;
      width: 16px; height: 16px; border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
    }

    /* ── SUB NAV ── */
    .sub-nav {
      background: #16213e;
      height: var(--sub-nav-h);
      display: flex; align-items: center;
      padding: 0 1.5rem; gap: 0.2rem;
      overflow-x: auto;
      scrollbar-width: none;
    }
    .sub-nav::-webkit-scrollbar { display: none; }
    .sub-nav a {
      color: #d1d9e6; font-size: 0.82rem; font-weight: 500;
      padding: 0.3rem 0.9rem; border-radius: 6px;
      white-space: nowrap; transition: background 0.15s, color 0.15s;
    }
    .sub-nav a:hover { background: rgba(255,255,255,0.1); color: #fff; }
    .sub-nav a.hot { color: var(--accent); font-weight: 700; }

    /* ── HERO BANNER ── */
    .hero-banner {
      position: relative;
      width: 100%; overflow: hidden;
      background: linear-gradient(135deg, #0F3460 0%, #16213e 60%, #1a1a2e 100%);
      display: flex; align-items: center; justify-content: space-between;
      padding: 2.5rem 5%;
      min-height: 320px;
    }

    .hero-text-block { z-index: 2; max-width: 480px; }

    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 0.5rem;
      background: var(--accent); color: #fff;
      font-size: 0.75rem; font-weight: 700; text-transform: uppercase;
      letter-spacing: 1.5px; padding: 0.3rem 0.9rem;
      border-radius: 99px; margin-bottom: 1.2rem;
      animation: fadeSlideIn 0.6s ease both;
    }

    .hero-heading {
      font-family: 'DM Serif Display', serif;
      font-size: clamp(2.2rem, 4vw, 3.4rem);
      color: #fff; line-height: 1.1;
      margin-bottom: 1rem;
      animation: fadeSlideIn 0.7s ease 0.1s both;
    }
    .hero-heading em { color: var(--yellow); font-style: normal; }

    .hero-sub {
      color: #a8bbd0; font-size: 1rem; line-height: 1.6;
      margin-bottom: 1.8rem;
      animation: fadeSlideIn 0.7s ease 0.2s both;
    }

    .hero-ctas { display: flex; gap: 1rem; flex-wrap: wrap; animation: fadeSlideIn 0.7s ease 0.3s both; }

    .btn-hero-primary {
      background: var(--yellow); color: var(--primary);
      font-weight: 700; font-size: 0.95rem;
      padding: 0.75rem 1.8rem; border-radius: 8px; border: none;
      transition: transform 0.15s, box-shadow 0.15s;
      box-shadow: 0 4px 14px rgba(255,214,0,0.4);
    }
    .btn-hero-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 22px rgba(255,214,0,0.45); }

    .btn-hero-sec {
      background: transparent; color: #fff;
      font-weight: 600; font-size: 0.95rem;
      padding: 0.75rem 1.8rem; border-radius: 8px;
      border: 2px solid rgba(255,255,255,0.35);
      transition: border-color 0.15s, background 0.15s;
    }
    .btn-hero-sec:hover { border-color: #fff; background: rgba(255,255,255,0.08); }

    /* Hero stats */
    .hero-stats {
      display: flex; gap: 2rem;
      margin-top: 2.2rem;
      animation: fadeSlideIn 0.7s ease 0.4s both;
    }
    .stat { text-align: center; }
    .stat-num { font-family: 'DM Serif Display', serif; font-size: 1.8rem; color: var(--yellow); }
    .stat-label { font-size: 0.72rem; color: #8fa3b8; text-transform: uppercase; letter-spacing: 1px; }

    /* Hero visual */
    .hero-visual {
      position: relative; flex-shrink: 0;
      animation: fadeSlideIn 0.8s ease 0.15s both;
      display: flex; align-items: center; justify-content: center;
    }

    .hero-phone {
      width: 200px;
      background: #fff;
      border-radius: 28px;
      padding: 1.2rem;
      box-shadow: 0 30px 80px rgba(0,0,0,0.4);
      text-align: center;
      transform: rotate(-4deg);
    }
    .hero-phone-img { font-size: 5rem; margin: 0 auto 0.6rem; }
    .hero-phone-name { font-weight: 700; font-size: 0.9rem; color: var(--text); }
    .hero-phone-price { font-weight: 800; font-size: 1.3rem; color: var(--accent); margin-top: 0.2rem; }
    .hero-phone-off { font-size: 0.75rem; color: var(--green); font-weight: 700; }

    .hero-badge {
      position: absolute;
      background: var(--accent); color: #fff;
      font-weight: 700; font-size: 0.78rem;
      padding: 0.4rem 0.9rem; border-radius: 99px;
      white-space: nowrap;
      box-shadow: 0 4px 14px rgba(233,69,96,0.4);
    }
    .hero-badge-1 { top: 10px; left: -40px; transform: rotate(-8deg); animation: float 3.5s ease-in-out infinite; }
    .hero-badge-2 { bottom: 20px; right: -50px; background: var(--green); transform: rotate(5deg); animation: float 4s ease-in-out 1s infinite; }
    .hero-badge-3 { top: 60%; left: -60px; background: var(--yellow); color: var(--primary); transform: rotate(3deg); animation: float 4.5s ease-in-out 0.5s infinite; }

    @keyframes float { 0%,100%{transform:translateY(0) rotate(var(--r,0deg))} 50%{transform:translateY(-10px) rotate(var(--r,0deg))} }
    @keyframes fadeSlideIn { from{opacity:0;transform:translateY(20px)} to{opacity:1;transform:translateY(0)} }

    /* Banner dots */
    .hero-dots { position: absolute; bottom: 14px; left: 50%; transform: translateX(-50%); display: flex; gap: 6px; }
    .dot { width: 8px; height: 8px; border-radius: 50%; background: rgba(255,255,255,0.35); transition: background 0.3s; }
    .dot.active { background: var(--yellow); width: 22px; border-radius: 4px; }

    /* ── LAYOUT ── */
    .page { max-width: 1280px; margin: 0 auto; padding: 0 1.5rem; }

    /* ── DEAL STRIP ── */
    .deal-strip {
      background: linear-gradient(90deg, var(--accent) 0%, #c0392b 100%);
      padding: 0.5rem 1.5rem;
      display: flex; align-items: center; gap: 1rem;
      overflow-x: auto; scrollbar-width: none;
    }
    .deal-strip::-webkit-scrollbar { display: none; }
    .deal-label {
      color: #fff; font-weight: 700; font-size: 0.85rem;
      white-space: nowrap; display: flex; align-items: center; gap: 0.4rem;
      flex-shrink: 0;
    }
    .deal-timer {
      background: rgba(0,0,0,0.25); color: #fff;
      font-size: 0.75rem; font-weight: 700;
      padding: 0.2rem 0.6rem; border-radius: 4px;
      font-variant-numeric: tabular-nums;
      flex-shrink: 0;
    }
    .deal-divider { width: 1px; height: 20px; background: rgba(255,255,255,0.3); flex-shrink: 0; }
    .deal-tag {
      background: rgba(255,255,255,0.18); color: #fff;
      font-size: 0.78rem; font-weight: 600;
      padding: 0.2rem 0.75rem; border-radius: 99px;
      white-space: nowrap; flex-shrink: 0;
      border: 1px solid rgba(255,255,255,0.3);
      transition: background 0.15s;
    }
    .deal-tag:hover { background: rgba(255,255,255,0.28); }

    /* ── SECTION TITLE ── */
    .section { padding: 2rem 0; }

    .section-header {
      display: flex; align-items: center; justify-content: space-between;
      margin-bottom: 1.2rem;
    }

    .section-title {
      font-family: 'DM Serif Display', serif;
      font-size: 1.5rem; color: var(--primary);
      display: flex; align-items: center; gap: 0.5rem;
    }
    .section-title .pill {
      font-family: 'DM Sans', sans-serif;
      font-size: 0.72rem; font-weight: 700;
      background: var(--accent); color: #fff;
      padding: 0.15rem 0.6rem; border-radius: 99px;
    }

    .see-all {
      color: var(--accent); font-weight: 600; font-size: 0.85rem;
      border: 1.5px solid var(--accent); border-radius: 6px;
      padding: 0.3rem 0.9rem; transition: all 0.15s;
    }
    .see-all:hover { background: var(--accent); color: #fff; }

    /* ── CATEGORY GRID ── */
    .cat-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
      gap: 1rem;
    }

    .cat-item {
      background: var(--card);
      border-radius: 14px;
      padding: 1.2rem 0.5rem;
      text-align: center;
      border: 1.5px solid var(--border);
      cursor: pointer;
      transition: transform 0.18s, box-shadow 0.18s, border-color 0.18s;
    }
    .cat-item:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(15,52,96,0.12); border-color: var(--primary); }
    .cat-icon { font-size: 2.2rem; margin-bottom: 0.5rem; }
    .cat-name { font-size: 0.78rem; font-weight: 600; color: var(--text); line-height: 1.3; }

    /* ── PRODUCT CARDS ── */
    .product-scroll {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(190px, 1fr));
      gap: 1rem;
    }

    .product-card {
      background: var(--card);
      border-radius: 14px;
      border: 1.5px solid var(--border);
      overflow: hidden;
      position: relative;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .product-card:hover { transform: translateY(-5px); box-shadow: 0 16px 40px rgba(15,52,96,0.14); }

    .product-img {
      background: linear-gradient(135deg, #f0f4ff, #e8f0fe);
      height: 180px;
      display: flex; align-items: center; justify-content: center;
      font-size: 4.5rem;
      position: relative;
    }

    .product-badge {
      position: absolute; top: 10px; left: 10px;
      font-size: 0.68rem; font-weight: 700;
      padding: 0.2rem 0.5rem; border-radius: 4px;
      color: #fff;
    }
    .badge-sale { background: var(--accent); }
    .badge-new { background: var(--green); }
    .badge-hot { background: var(--orange); }
    .badge-top { background: var(--primary); }

    .wishlist-btn {
      position: absolute; top: 10px; right: 10px;
      background: #fff; border: none;
      width: 32px; height: 32px; border-radius: 50%;
      font-size: 1rem;
      display: flex; align-items: center; justify-content: center;
      box-shadow: 0 2px 8px rgba(0,0,0,0.12);
      transition: transform 0.2s;
    }
    .wishlist-btn:hover { transform: scale(1.15); }

    .product-info { padding: 1rem; }
    .product-brand { font-size: 0.72rem; font-weight: 700; color: var(--muted); text-transform: uppercase; letter-spacing: 0.5px; }
    .product-name { font-size: 0.9rem; font-weight: 600; color: var(--text); margin: 0.2rem 0; line-height: 1.35; }

    .rating { display: flex; align-items: center; gap: 0.3rem; margin: 0.4rem 0; }
    .stars { font-size: 0.72rem; color: var(--orange); letter-spacing: -1px; }
    .rating-num { font-size: 0.72rem; color: var(--muted); }

    .price-row { display: flex; align-items: baseline; gap: 0.5rem; flex-wrap: wrap; }
    .price-new { font-size: 1.15rem; font-weight: 800; color: var(--text); }
    .price-old { font-size: 0.82rem; color: var(--muted); text-decoration: line-through; }
    .price-off { font-size: 0.78rem; font-weight: 700; color: var(--green); }

    .product-footer {
      border-top: 1px solid var(--border);
      padding: 0.65rem 1rem;
      display: flex; align-items: center; justify-content: space-between;
    }
    .delivery-tag { font-size: 0.72rem; color: var(--muted); }
    .delivery-tag strong { color: var(--green); }

    .add-btn {
      background: var(--primary); color: #fff;
      border: none; border-radius: 6px;
      font-size: 0.75rem; font-weight: 700;
      padding: 0.35rem 0.8rem;
      transition: background 0.15s, transform 0.1s;
    }
    .add-btn:hover { background: var(--accent); transform: scale(1.04); }

    /* ── BANNER CARDS ROW ── */
    .banner-row { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1rem; }

    .banner-card {
      border-radius: 16px; overflow: hidden;
      position: relative; min-height: 160px;
      display: flex; flex-direction: column; justify-content: flex-end;
      padding: 1.4rem;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .banner-card:hover { transform: translateY(-3px); box-shadow: 0 16px 40px rgba(0,0,0,0.18); }

    .banner-card::before { content: ''; position: absolute; inset: 0; }
    .bc-1::before { background: linear-gradient(135deg, #0F3460, #533483); }
    .bc-2::before { background: linear-gradient(135deg, #c0392b, #e74c3c); }
    .bc-3::before { background: linear-gradient(135deg, #16a085, #1abc9c); }

    .banner-emoji { position: absolute; right: 1.2rem; top: 50%; transform: translateY(-50%); font-size: 4.5rem; opacity: 0.85; }
    .banner-eyebrow { color: rgba(255,255,255,0.7); font-size: 0.72rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1.5px; position: relative; z-index: 1; }
    .banner-title { font-family: 'DM Serif Display', serif; font-size: 1.4rem; color: #fff; position: relative; z-index: 1; line-height: 1.2; margin: 0.2rem 0 0.5rem; }
    .banner-cta { display: inline-flex; align-items: center; gap: 0.4rem; color: #fff; font-size: 0.8rem; font-weight: 700; position: relative; z-index: 1; border-bottom: 1.5px solid rgba(255,255,255,0.5); padding-bottom: 1px; }

    /* ── FLASH DEALS ── */
    .flash-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
      gap: 0.8rem;
    }

    .flash-card {
      background: var(--card);
      border-radius: 12px;
      border: 1.5px solid var(--border);
      padding: 1rem 0.8rem;
      text-align: center;
      cursor: pointer;
      transition: transform 0.18s, box-shadow 0.18s;
      position: relative;
      overflow: hidden;
    }
    .flash-card::after {
      content: '';
      position: absolute; bottom: 0; left: 0; right: 0;
      height: 3px;
      background: linear-gradient(90deg, var(--accent), var(--orange));
    }
    .flash-card:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(233,69,96,0.13); }
    .flash-emoji { font-size: 3rem; margin-bottom: 0.5rem; }
    .flash-name { font-size: 0.8rem; font-weight: 600; color: var(--text); margin-bottom: 0.4rem; }
    .flash-off { font-size: 1.2rem; font-weight: 800; color: var(--accent); }
    .flash-label { font-size: 0.68rem; color: var(--muted); }

    /* ── PROMO STRIP ── */
    .promo-strip {
      background: linear-gradient(90deg, var(--primary) 0%, #16213e 100%);
      border-radius: 16px;
      display: flex; align-items: center; justify-content: space-around;
      padding: 1.5rem 2rem;
      gap: 1rem;
      flex-wrap: wrap;
    }
    .promo-item { display: flex; align-items: center; gap: 0.8rem; color: #fff; }
    .promo-icon { font-size: 2rem; }
    .promo-text strong { display: block; font-size: 0.9rem; font-weight: 700; }
    .promo-text span { font-size: 0.75rem; color: #8fa3b8; }

    /* ── FOOTER ── */
    footer {
      background: #16213e;
      color: #8fa3b8;
      margin-top: 3rem;
      padding: 3rem 1.5rem 1rem;
    }
    .footer-grid {
      max-width: 1280px; margin: 0 auto;
      display: grid; grid-template-columns: 2fr repeat(3, 1fr);
      gap: 2rem; margin-bottom: 2rem;
    }
    .footer-logo { font-family: 'DM Serif Display', serif; font-size: 1.6rem; color: var(--yellow); margin-bottom: 0.8rem; }
    .footer-logo span { color: var(--accent); }
    .footer-desc { font-size: 0.82rem; line-height: 1.7; max-width: 260px; }
    .footer-socials { display: flex; gap: 0.8rem; margin-top: 1.2rem; }
    .social-btn { width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.08); display: flex; align-items: center; justify-content: center; font-size: 1rem; cursor: pointer; transition: background 0.15s; }
    .social-btn:hover { background: var(--accent); }
    .footer-col h4 { color: #fff; font-size: 0.9rem; font-weight: 700; margin-bottom: 1rem; }
    .footer-col ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
    .footer-col li a { font-size: 0.8rem; transition: color 0.15s; }
    .footer-col li a:hover { color: #fff; }
    .footer-bottom { max-width: 1280px; margin: 0 auto; padding-top: 1.5rem; border-top: 1px solid rgba(255,255,255,0.08); display: flex; justify-content: space-between; align-items: center; flex-wrap: gap: 1rem; font-size: 0.78rem; }
    .payments { display: flex; gap: 0.5rem; flex-wrap: wrap; }
    .pay-badge { background: rgba(255,255,255,0.1); border-radius: 4px; padding: 0.2rem 0.6rem; font-size: 0.72rem; font-weight: 700; color: #fff; }

    /* ── RESPONSIVE ── */
    @media (max-width: 900px) {
      .hero-visual { display: none; }
      .hero-stats { gap: 1.2rem; }
      .footer-grid { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 640px) {
      .nav-location { display: none; }
      .hero-banner { padding: 2rem 1.2rem; }
      .footer-grid { grid-template-columns: 1fr; }
      .footer-desc { max-width: 100%; }
      .promo-strip { justify-content: flex-start; }
    }
  </style>
</head>
<body>

<!-- TOP BAR -->
<div class="topbar">
  <div class="topbar-left">
    <a href="#">Download App</a>
    <span>|</span>
    <a href="#">Sell on BazaarX</a>
    <span>|</span>
    <a href="#">Help</a>
  </div>
  <div class="topbar-right">
    <a href="#">Track Order</a>
    <span>|</span>
    <a href="#">Sign In</a>
    <span>|</span>
    <span>🇮🇳 India</span>
  </div>
</div>

<!-- NAVBAR -->
<nav>
  <div class="nav-logo">Bazaar<span>X</span></div>

  <div class="nav-location">
    <span>📍 Deliver to</span>
    <strong>Hyderabad 500001</strong>
  </div>

  <div class="search-wrap">
    <select class="search-cat">
      <option>All</option>
      <option>Electronics</option>
      <option>Fashion</option>
      <option>Home</option>
      <option>Books</option>
      <option>Grocery</option>
    </select>
    <input class="search-input" type="text" placeholder="Search products, brands and more..."/>
    <button class="search-btn">🔍</button>
  </div>

  <div class="nav-icons">
    <button class="nav-icon-btn">
      <span class="icon">👤</span>
      <span>Account</span>
    </button>
    <button class="nav-icon-btn">
      <span class="icon">❤️</span>
      <span>Wishlist</span>
    </button>
    <button class="nav-icon-btn">
      <div class="badge-wrap">
        <span class="icon">🛒</span>
        <span class="nav-badge">3</span>
      </div>
      <span>Cart</span>
    </button>
  </div>
</nav>

<!-- SUB NAV -->
<div class="sub-nav">
  <a href="#" class="hot">🔥 Today's Deals</a>
  <a href="#">Electronics</a>
  <a href="#">Mobiles</a>
  <a href="#">Fashion</a>
  <a href="#">Home & Kitchen</a>
  <a href="#">Beauty</a>
  <a href="#">Books</a>
  <a href="#">Sports</a>
  <a href="#">Toys</a>
  <a href="#">Grocery</a>
  <a href="#">Automotive</a>
  <a href="#">Pet Supplies</a>
  <a href="#">Health</a>
  <a href="#">Travel</a>
</div>

<!-- DEAL STRIP -->
<div class="deal-strip">
  <span class="deal-label">⚡ Flash Deals</span>
  <span class="deal-timer" id="timer">02:45:18</span>
  <div class="deal-divider"></div>
  <a href="#" class="deal-tag">📱 Mobiles up to 40% off</a>
  <a href="#" class="deal-tag">👗 Fashion min. 60% off</a>
  <a href="#" class="deal-tag">🏠 Home Essentials</a>
  <a href="#" class="deal-tag">💻 Laptops & PCs</a>
  <a href="#" class="deal-tag">🎧 Audio Deals</a>
  <a href="#" class="deal-tag">✈️ Travel Essentials</a>
</div>

<!-- HERO BANNER -->
<div class="hero-banner">
  <div class="hero-text-block">
    <div class="hero-eyebrow">🎉 Grand Summer Sale 2026</div>
    <h1 class="hero-heading">Deals so big,<br/><em>your wallet will thank you</em></h1>
    <p class="hero-sub">Up to 80% off on lakhs of products. Free delivery, easy returns, and Cash on Delivery available across India.</p>
    <div class="hero-ctas">
      <button class="btn-hero-primary">🛍️ Shop Now</button>
      <button class="btn-hero-sec">View All Deals →</button>
    </div>
    <div class="hero-stats">
      <div class="stat"><div class="stat-num">1.2Cr+</div><div class="stat-label">Products</div></div>
      <div class="stat"><div class="stat-num">4.8★</div><div class="stat-label">Rated</div></div>
      <div class="stat"><div class="stat-num">2hr</div><div class="stat-label">Express Delivery</div></div>
    </div>
  </div>

  <div class="hero-visual">
    <div class="hero-badge hero-badge-1">🔥 48% OFF</div>
    <div class="hero-badge hero-badge-2">✅ Free Delivery</div>
    <div class="hero-badge hero-badge-3">⚡ In Stock</div>
    <div class="hero-phone">
      <div class="hero-phone-img">📱</div>
      <div class="hero-phone-name">Galaxy S25 Ultra</div>
      <div class="hero-phone-price">₹89,999</div>
      <div class="hero-phone-off">↓ ₹41,000 off today</div>
    </div>
  </div>

  <div class="hero-dots">
    <div class="dot active"></div>
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
  </div>
</div>

<!-- MAIN CONTENT -->
<div class="page">

  <!-- CATEGORIES -->
  <div class="section">
    <div class="section-header">
      <h2 class="section-title">Shop by Category</h2>
      <a href="#" class="see-all">See all →</a>
    </div>
    <div class="cat-grid">
      <% String[][] cats = {
        {"📱","Mobiles"},{"💻","Laptops"},{"📺","TVs"},{"🎧","Audio"},
        {"👟","Footwear"},{"👗","Women's"},{"👔","Men's"},{"👶","Kids"},
        {"🏠","Home"},{"🍳","Kitchen"},{"💄","Beauty"},{"📚","Books"},
        {"🏋️","Sports"},{"🎮","Gaming"},{"🌿","Organic"},{"🚗","Auto"}
      }; %>
      <% for(String[] c : cats) { %>
      <div class="cat-item">
        <div class="cat-icon"><%=c[0]%></div>
        <div class="cat-name"><%=c[1]%></div>
      </div>
      <% } %>
    </div>
  </div>

  <!-- PROMO STRIP -->
  <div class="promo-strip" style="margin-bottom:0.5rem;">
    <div class="promo-item"><span class="promo-icon">🚀</span><div class="promo-text"><strong>2-Hour Express</strong><span>Select pin codes</span></div></div>
    <div class="promo-item"><span class="promo-icon">🔄</span><div class="promo-text"><strong>Easy Returns</strong><span>7-day no-questions policy</span></div></div>
    <div class="promo-item"><span class="promo-icon">💳</span><div class="promo-text"><strong>10% Cashback</strong><span>On HDFC, SBI cards</span></div></div>
    <div class="promo-item"><span class="promo-icon">📦</span><div class="promo-text"><strong>Free Shipping</strong><span>Orders above ₹499</span></div></div>
    <div class="promo-item"><span class="promo-icon">🛡️</span><div class="promo-text"><strong>Secure Pay</strong><span>100% buyer protection</span></div></div>
  </div>

  <!-- FLASH DEALS -->
  <div class="section">
    <div class="section-header">
      <h2 class="section-title">⚡ Flash Deals <span class="pill">Ends Soon</span></h2>
      <a href="#" class="see-all">See all →</a>
    </div>
    <div class="flash-grid">
      <% String[][] flash = {
        {"📱","Mobiles","Up to 40%"},{"💻","Laptops","Up to 35%"},{"🎧","Earphones","Up to 60%"},
        {"👟","Sneakers","Up to 55%"},{"📺","Smart TVs","Up to 45%"},{"⌚","Smartwatch","Up to 50%"},
        {"🎮","Gaming","Up to 30%"},{"🍳","Cookware","Up to 65%"},{"💄","Skincare","Up to 70%"},{"📷","Cameras","Up to 25%"}
      }; %>
      <% for(String[] f : flash) { %>
      <div class="flash-card">
        <div class="flash-emoji"><%=f[0]%></div>
        <div class="flash-name"><%=f[1]%></div>
        <div class="flash-off"><%=f[2]%></div>
        <div class="flash-label">off today only</div>
      </div>
      <% } %>
    </div>
  </div>

  <!-- BANNER CARDS -->
  <div class="section">
    <div class="banner-row">
      <div class="banner-card bc-1">
        <span class="banner-emoji">💻</span>
        <span class="banner-eyebrow">Limited Time</span>
        <h3 class="banner-title">Work From Home<br/>Deals</h3>
        <a href="#" class="banner-cta">Shop Now →</a>
      </div>
      <div class="banner-card bc-2">
        <span class="banner-emoji">👗</span>
        <span class="banner-eyebrow">New Season</span>
        <h3 class="banner-title">Summer Fashion<br/>Arrivals</h3>
        <a href="#" class="banner-cta">Explore →</a>
      </div>
      <div class="banner-card bc-3">
        <span class="banner-emoji">🏋️</span>
        <span class="banner-eyebrow">Stay Fit</span>
        <h3 class="banner-title">Sports & Fitness<br/>Essentials</h3>
        <a href="#" class="banner-cta">Get Active →</a>
      </div>
    </div>
  </div>

  <!-- BEST SELLERS -->
  <div class="section">
    <div class="section-header">
      <h2 class="section-title">🏆 Best Sellers</h2>
      <a href="#" class="see-all">See all →</a>
    </div>
    <div class="product-scroll">
      <%
        String[][] products = {
          {"📱","Samsung","Galaxy S24 FE 5G","4.5","12,847","₹34,999","₹54,999","36%","Free","sale"},
          {"🎧","boAt","Airdopes 141 ANC","4.3","28,301","₹1,299","₹4,999","74%","Free","hot"},
          {"👟","Nike","Air Max 270","4.6","9,202","₹5,995","₹8,995","33%","₹49","new"},
          {"⌚","Noise","ColorFit Ultra 3","4.4","18,556","₹3,499","₹8,999","61%","Free","sale"},
          {"💻","Lenovo","IdeaPad Slim 3","4.2","5,821","₹37,990","₹54,990","31%","Free","top"},
          {"📺","MI","Smart TV 43\" 4K","4.5","21,443","₹26,999","₹42,999","37%","Free","sale"},
          {"🎮","Sony","DualSense Controller","4.7","7,663","₹5,990","₹6,990","14%","Free","new"},
          {"🏠","Prestige","Induction Cooktop","4.3","14,200","₹2,199","₹3,999","45%","Free","hot"}
        };
      %>
      <% for(String[] p : products) { %>
      <div class="product-card">
        <div class="product-img">
          <span><%=p[0]%></span>
          <span class="product-badge badge-<%=p[9]%>">
            <%=p[9].equals("sale")?"SALE":p[9].equals("hot")?"HOT":p[9].equals("new")?"NEW":"TOP PICK"%>
          </span>
          <button class="wishlist-btn">🤍</button>
        </div>
        <div class="product-info">
          <div class="product-brand"><%=p[1]%></div>
          <div class="product-name"><%=p[2]%></div>
          <div class="rating">
            <span class="stars">★★★★★</span>
            <span class="rating-num"><%=p[3]%> (<%=p[4]%>)</span>
          </div>
          <div class="price-row">
            <span class="price-new"><%=p[5]%></span>
            <span class="price-old"><%=p[6]%></span>
            <span class="price-off"><%=p[7]%>% off</span>
          </div>
        </div>
        <div class="product-footer">
          <span class="delivery-tag"><strong><%=p[8].equals("Free")?"FREE":"₹"+p[8]%></strong> delivery</span>
          <button class="add-btn" onclick="this.textContent='✓ Added';this.style.background='var(--green)'">Add to Cart</button>
        </div>
      </div>
      <% } %>
    </div>
  </div>

  <!-- NEW ARRIVALS -->
  <div class="section">
    <div class="section-header">
      <h2 class="section-title">✨ New Arrivals <span class="pill">Just In</span></h2>
      <a href="#" class="see-all">See all →</a>
    </div>
    <div class="product-scroll">
      <%
        String[][] arrivals = {
          {"🕶️","Ray-Ban","Classic Aviators","4.6","3,201","₹4,999","₹8,500","41%","Free","new"},
          {"👜","Lavie","Tote Shoulder Bag","4.4","6,102","₹1,499","₹2,999","50%","Free","new"},
          {"🌿","Mamaearth","SPF 50 Sunscreen","4.5","42,000","₹349","₹599","42%","Free","new"},
          {"📚","Penguin","Atomic Habits","4.8","1,10,453","₹299","₹499","40%","Free","top"},
          {"🎒","American Tourister","Cabin Backpack","4.3","8,901","₹2,199","₹3,999","45%","Free","new"},
          {"🧴","Biotique","Face Wash Kit","4.2","17,200","₹499","₹799","38%","Free","new"},
        };
      %>
      <% for(String[] a : arrivals) { %>
      <div class="product-card">
        <div class="product-img">
          <span><%=a[0]%></span>
          <span class="product-badge badge-<%=a[9]%>"><%=a[9].equals("top")?"TOP PICK":"NEW"%></span>
          <button class="wishlist-btn">🤍</button>
        </div>
        <div class="product-info">
          <div class="product-brand"><%=a[1]%></div>
          <div class="product-name"><%=a[2]%></div>
          <div class="rating">
            <span class="stars">★★★★★</span>
            <span class="rating-num"><%=a[3]%> (<%=a[4]%>)</span>
          </div>
          <div class="price-row">
            <span class="price-new"><%=a[5]%></span>
            <span class="price-old"><%=a[6]%></span>
            <span class="price-off"><%=a[7]%>% off</span>
          </div>
        </div>
        <div class="product-footer">
          <span class="delivery-tag"><strong>FREE</strong> delivery</span>
          <button class="add-btn" onclick="this.textContent='✓ Added';this.style.background='var(--green)'">Add to Cart</button>
        </div>
      </div>
      <% } %>
    </div>
  </div>

</div><!-- /page -->

<!-- FOOTER -->
<footer>
  <div class="footer-grid">
    <div>
      <div class="footer-logo">Bazaar<span>X</span></div>
      <p class="footer-desc">India's favourite online shopping destination. Lakhs of products. Best prices. Delivered fast, wherever you are.</p>
      <div class="footer-socials">
        <div class="social-btn">📘</div>
        <div class="social-btn">📸</div>
        <div class="social-btn">🐦</div>
        <div class="social-btn">▶️</div>
      </div>
    </div>
    <div class="footer-col">
      <h4>About</h4>
      <ul>
        <li><a href="#">About BazaarX</a></li>
        <li><a href="#">Careers</a></li>
        <li><a href="#">Press</a></li>
        <li><a href="#">Investor Relations</a></li>
        <li><a href="#">Sustainability</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Help</h4>
      <ul>
        <li><a href="#">Track Your Order</a></li>
        <li><a href="#">Returns & Refunds</a></li>
        <li><a href="#">Payment Methods</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">FAQs</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Sell</h4>
      <ul>
        <li><a href="#">Sell on BazaarX</a></li>
        <li><a href="#">Seller University</a></li>
        <li><a href="#">Advertise</a></li>
        <li><a href="#">BazaarX Business</a></li>
        <li><a href="#">Affiliate Program</a></li>
      </ul>
    </div>
  </div>

  <div class="footer-bottom">
    <span>© 2025 BazaarX India Pvt. Ltd. | Privacy | Terms | Sitemap</span>
    <div class="payments">
      <span class="pay-badge">Visa</span>
      <span class="pay-badge">Mastercard</span>
      <span class="pay-badge">UPI</span>
      <span class="pay-badge">Net Banking</span>
      <span class="pay-badge">COD</span>
      <span class="pay-badge">EMI</span>
    </div>
  </div>
</footer>

<script>
  // Countdown timer
  let secs = 2*3600 + 45*60 + 18;
  const timer = document.getElementById('timer');
  setInterval(() => {
    if(secs <= 0) secs = 3*3600;
    secs--;
    const h = String(Math.floor(secs/3600)).padStart(2,'0');
    const m = String(Math.floor((secs%3600)/60)).padStart(2,'0');
    const s = String(secs%60).padStart(2,'0');
    timer.textContent = `${h}:${m}:${s}`;
  }, 1000);

  // Wishlist toggle
  document.querySelectorAll('.wishlist-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      btn.textContent = btn.textContent === '🤍' ? '❤️' : '🤍';
    });
  });

  // Animated hero dot switcher
  const dots = document.querySelectorAll('.dot');
  let dotIdx = 0;
  setInterval(() => {
    dots[dotIdx].classList.remove('active');
    dotIdx = (dotIdx + 1) % dots.length;
    dots[dotIdx].classList.add('active');
  }, 3000);
</script>
</body>
</html>

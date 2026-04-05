<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ShopSpark — Find Your Happy</title>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Nunito:wght@400;600;700;900&display=swap" rel="stylesheet" />
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --sun: #FFD93D;
      --coral: #FF6B6B;
      --mint: #6BCFB8;
      --sky: #A8D8EA;
      --plum: #2D2340;
      --cream: #FFF8EE;
      --pop: #FF3CAC;
    }

    html, body {
      height: 100%;
      font-family: 'Nunito', sans-serif;
      background: var(--cream);
      overflow-x: hidden;
    }

    /* ── Noise texture overlay ── */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
      pointer-events: none;
      z-index: 0;
    }

    /* ── NAV ── */
    nav {
      position: fixed;
      top: 0; left: 0; right: 0;
      z-index: 100;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.2rem 3rem;
    }

    .logo {
      font-family: 'Pacifico', cursive;
      font-size: 1.8rem;
      color: var(--plum);
      letter-spacing: -0.5px;
    }

    .logo span { color: var(--coral); }

    nav ul {
      list-style: none;
      display: flex;
      gap: 2rem;
    }

    nav ul a {
      text-decoration: none;
      font-weight: 700;
      font-size: 0.95rem;
      color: var(--plum);
      position: relative;
      transition: color 0.2s;
    }

    nav ul a::after {
      content: '';
      position: absolute;
      left: 0; bottom: -3px;
      width: 0; height: 3px;
      background: var(--coral);
      border-radius: 99px;
      transition: width 0.3s ease;
    }

    nav ul a:hover { color: var(--coral); }
    nav ul a:hover::after { width: 100%; }

    .nav-cart {
      background: var(--plum);
      color: var(--sun) !important;
      padding: 0.5rem 1.2rem;
      border-radius: 99px;
      font-weight: 900 !important;
      transition: transform 0.2s, background 0.2s !important;
    }

    .nav-cart:hover { background: var(--coral); transform: scale(1.05); }
    .nav-cart::after { display: none !important; }

    /* ── HERO ── */
    .hero {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
      padding: 6rem 3rem 4rem;
    }

    /* Blob backgrounds */
    .blob {
      position: absolute;
      border-radius: 50%;
      filter: blur(70px);
      opacity: 0.45;
      animation: drift 8s ease-in-out infinite alternate;
    }

    .blob-1 { width: 500px; height: 500px; background: var(--sun); top: -100px; left: -150px; animation-delay: 0s; }
    .blob-2 { width: 400px; height: 400px; background: var(--coral); bottom: -80px; right: -100px; animation-delay: 2s; }
    .blob-3 { width: 300px; height: 300px; background: var(--mint); top: 50%; left: 55%; animation-delay: 4s; }
    .blob-4 { width: 250px; height: 250px; background: var(--sky); top: 20%; right: 5%; animation-delay: 1s; }

    @keyframes drift {
      0%   { transform: translate(0, 0) scale(1); }
      100% { transform: translate(30px, 40px) scale(1.08); }
    }

    /* Floating shapes */
    .shape {
      position: absolute;
      opacity: 0.7;
      animation: float 5s ease-in-out infinite;
    }

    .shape-star { font-size: 2rem; top: 15%; left: 8%; animation-delay: 0.5s; }
    .shape-circle { width: 40px; height: 40px; border-radius: 50%; background: var(--pop); top: 70%; left: 12%; animation-delay: 1.5s; }
    .shape-donut { width: 50px; height: 50px; border-radius: 50%; border: 8px solid var(--sun); top: 30%; right: 10%; animation-delay: 2.5s; }
    .shape-zigzag { font-size: 2.5rem; bottom: 18%; right: 14%; animation-delay: 0.8s; color: var(--mint); }
    .shape-heart { font-size: 2rem; top: 60%; right: 6%; animation-delay: 3s; }
    .shape-spark { font-size: 1.6rem; bottom: 25%; left: 25%; animation-delay: 2s; }

    @keyframes float {
      0%, 100% { transform: translateY(0) rotate(0deg); }
      50%       { transform: translateY(-18px) rotate(8deg); }
    }

    /* Hero content */
    .hero-inner {
      position: relative;
      z-index: 10;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 4rem;
      align-items: center;
      max-width: 1200px;
      width: 100%;
    }

    .hero-text { animation: slideUp 0.9s cubic-bezier(0.22,1,0.36,1) both; }

    @keyframes slideUp {
      from { opacity: 0; transform: translateY(50px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .badge {
      display: inline-block;
      background: var(--sun);
      color: var(--plum);
      font-weight: 900;
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 2px;
      padding: 0.4rem 1rem;
      border-radius: 99px;
      margin-bottom: 1.4rem;
      border: 2.5px solid var(--plum);
      box-shadow: 3px 3px 0 var(--plum);
      animation: pop 0.6s cubic-bezier(0.34,1.56,0.64,1) 0.3s both;
    }

    @keyframes pop {
      from { opacity: 0; transform: scale(0.5); }
      to   { opacity: 1; transform: scale(1); }
    }

    h1 {
      font-family: 'Pacifico', cursive;
      font-size: clamp(3rem, 5.5vw, 5rem);
      color: var(--plum);
      line-height: 1.12;
      margin-bottom: 1.5rem;
    }

    h1 .highlight {
      color: var(--coral);
      display: inline-block;
      position: relative;
    }

    h1 .highlight::after {
      content: '';
      position: absolute;
      left: 0; bottom: 2px;
      width: 100%; height: 8px;
      background: var(--sun);
      z-index: -1;
      border-radius: 4px;
    }

    .hero-desc {
      font-size: 1.15rem;
      color: #5a4f72;
      line-height: 1.7;
      max-width: 460px;
      margin-bottom: 2.4rem;
      animation: slideUp 0.9s cubic-bezier(0.22,1,0.36,1) 0.2s both;
    }

    .cta-row {
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
      animation: slideUp 0.9s cubic-bezier(0.22,1,0.36,1) 0.35s both;
    }

    .btn-primary {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      background: var(--coral);
      color: #fff;
      font-family: 'Nunito', sans-serif;
      font-weight: 900;
      font-size: 1.05rem;
      padding: 0.9rem 2rem;
      border-radius: 99px;
      border: 3px solid var(--plum);
      box-shadow: 5px 5px 0 var(--plum);
      cursor: pointer;
      text-decoration: none;
      transition: transform 0.15s, box-shadow 0.15s;
    }

    .btn-primary:hover {
      transform: translate(-2px, -2px);
      box-shadow: 7px 7px 0 var(--plum);
    }

    .btn-primary:active {
      transform: translate(3px, 3px);
      box-shadow: 2px 2px 0 var(--plum);
    }

    .btn-secondary {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      background: transparent;
      color: var(--plum);
      font-family: 'Nunito', sans-serif;
      font-weight: 900;
      font-size: 1.05rem;
      padding: 0.9rem 2rem;
      border-radius: 99px;
      border: 3px solid var(--plum);
      box-shadow: 5px 5px 0 var(--plum);
      cursor: pointer;
      text-decoration: none;
      transition: transform 0.15s, box-shadow 0.15s, background 0.2s;
    }

    .btn-secondary:hover {
      background: var(--sun);
      transform: translate(-2px, -2px);
      box-shadow: 7px 7px 0 var(--plum);
    }

    /* Social proof */
    .social-proof {
      margin-top: 2.8rem;
      display: flex;
      align-items: center;
      gap: 1rem;
      animation: slideUp 0.9s cubic-bezier(0.22,1,0.36,1) 0.5s both;
    }

    .avatars {
      display: flex;
    }

    .avatar {
      width: 38px; height: 38px;
      border-radius: 50%;
      border: 3px solid #fff;
      margin-left: -10px;
      font-size: 1.3rem;
      display: flex; align-items: center; justify-content: center;
      background: var(--cream);
    }

    .avatar:first-child { margin-left: 0; }

    .proof-text { font-size: 0.88rem; color: #5a4f72; font-weight: 700; line-height: 1.4; }
    .proof-text strong { color: var(--plum); font-size: 1rem; }
    .stars { color: var(--sun); font-size: 1rem; }

    /* ── HERO VISUAL ── */
    .hero-visual {
      position: relative;
      display: flex;
      justify-content: center;
      align-items: center;
      animation: slideUp 0.9s cubic-bezier(0.22,1,0.36,1) 0.15s both;
    }

    .product-card {
      background: #fff;
      border: 3px solid var(--plum);
      border-radius: 28px;
      box-shadow: 10px 10px 0 var(--plum);
      padding: 2rem;
      width: 320px;
      text-align: center;
      position: relative;
      z-index: 5;
      transform: rotate(2deg);
      transition: transform 0.3s ease;
    }

    .product-card:hover { transform: rotate(0deg) scale(1.02); }

    .product-emoji { font-size: 6rem; margin-bottom: 1rem; display: block; animation: bounce 2s ease-in-out infinite; }

    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50%       { transform: translateY(-12px); }
    }

    .product-name {
      font-family: 'Pacifico', cursive;
      font-size: 1.4rem;
      color: var(--plum);
      margin-bottom: 0.5rem;
    }

    .product-price {
      font-size: 2rem;
      font-weight: 900;
      color: var(--coral);
    }

    .product-price span {
      font-size: 1rem;
      color: #aaa;
      text-decoration: line-through;
      margin-left: 0.5rem;
      font-weight: 600;
    }

    .product-tag {
      display: inline-block;
      background: var(--mint);
      color: var(--plum);
      font-weight: 900;
      font-size: 0.75rem;
      padding: 0.25rem 0.8rem;
      border-radius: 99px;
      border: 2px solid var(--plum);
      margin-top: 0.8rem;
    }

    /* Floating mini cards */
    .mini-card {
      position: absolute;
      background: #fff;
      border: 2.5px solid var(--plum);
      border-radius: 16px;
      box-shadow: 5px 5px 0 var(--plum);
      padding: 0.7rem 1rem;
      font-weight: 800;
      font-size: 0.85rem;
      color: var(--plum);
      display: flex;
      align-items: center;
      gap: 0.4rem;
      white-space: nowrap;
      z-index: 6;
    }

    .mini-card-1 { top: -20px; left: -60px; transform: rotate(-5deg); background: var(--sun); animation: float 4s ease-in-out 1s infinite; }
    .mini-card-2 { bottom: 30px; left: -70px; transform: rotate(4deg); background: var(--sky); animation: float 5s ease-in-out 0.5s infinite; }
    .mini-card-3 { top: 10px; right: -65px; transform: rotate(6deg); background: var(--pop); color: #fff; animation: float 4.5s ease-in-out 2s infinite; }
    .mini-card-4 { bottom: -20px; right: -55px; transform: rotate(-4deg); background: var(--mint); animation: float 5.5s ease-in-out 1.5s infinite; }

    /* ── TICKER ── */
    .ticker-wrap {
      position: fixed;
      bottom: 0; left: 0; right: 0;
      background: var(--plum);
      color: var(--sun);
      font-family: 'Pacifico', cursive;
      font-size: 1rem;
      padding: 0.6rem 0;
      overflow: hidden;
      z-index: 90;
      border-top: 3px solid var(--sun);
    }

    .ticker-track {
      display: flex;
      width: max-content;
      animation: ticker 20s linear infinite;
    }

    .ticker-item { padding: 0 3rem; white-space: nowrap; }
    .ticker-sep { color: var(--coral); }

    @keyframes ticker {
      from { transform: translateX(0); }
      to   { transform: translateX(-50%); }
    }

    /* ── RESPONSIVE ── */
    @media (max-width: 800px) {
      .hero-inner { grid-template-columns: 1fr; text-align: center; gap: 3rem; }
      .hero-desc { margin: 0 auto 2rem; }
      .cta-row { justify-content: center; }
      .social-proof { justify-content: center; }
      nav ul { display: none; }
      .product-card { width: 260px; }
      .mini-card-2, .mini-card-4 { display: none; }
    }
  </style>
</head>
<body>

  <!-- NAV -->
  <nav>
    <div class="logo">Shop<span>Spark</span> ✦</div>
    <ul>
      <li><a href="#">New In</a></li>
      <li><a href="#">Deals</a></li>
      <li><a href="#">Collections</a></li>
      <li><a href="#" class="nav-cart">🛒 Cart (0)</a></li>
    </ul>
  </nav>

  <!-- HERO -->
  <section class="hero">

    <!-- Blobs -->
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>
    <div class="blob blob-4"></div>

    <!-- Floating shapes -->
    <div class="shape shape-star">⭐</div>
    <div class="shape shape-circle"></div>
    <div class="shape shape-donut"></div>
    <div class="shape shape-zigzag">〰️</div>
    <div class="shape shape-heart">💛</div>
    <div class="shape shape-spark">✨</div>

    <div class="hero-inner">

      <!-- Text -->
      <div class="hero-text">
        <div class="badge">🎉 New arrivals are here!</div>

        <h1>
          Shopping<br/>
          that makes<br/>
          you <span class="highlight">grin</span>
        </h1>

        <p class="hero-desc">
          Discover thousands of joyful finds — from quirky home goods to must-have fashion. Free shipping, zero boring stuff, and deals that'll make your wallet do a happy dance.
        </p>

        <div class="cta-row">
          <a href="#" class="btn-primary">🛍️ Shop Now</a>
          <a href="#" class="btn-secondary">✨ See Deals</a>
        </div>

        <div class="social-proof">
          <div class="avatars">
            <div class="avatar">😊</div>
            <div class="avatar">🤩</div>
            <div class="avatar">😍</div>
            <div class="avatar">🥳</div>
          </div>
          <div class="proof-text">
            <div class="stars">★★★★★</div>
            <strong>48,000+ happy shoppers</strong><br/>
            love what they found here
          </div>
        </div>
      </div>

      <!-- Visual -->
      <div class="hero-visual">
        <div class="product-card">
          <span class="product-emoji">🎒</span>
          <div class="product-name">Cloud Backpack</div>
          <div class="product-price">₹1,299 <span>₹2,499</span></div>
          <div class="product-tag">🔥 48% OFF — Today only!</div>
        </div>

        <div class="mini-card mini-card-1">⚡ Flash Sale Live!</div>
        <div class="mini-card mini-card-2">🚚 Free Delivery</div>
        <div class="mini-card mini-card-3">❤️ 2.1k Wishlisted</div>
        <div class="mini-card mini-card-4">✅ Easy Returns</div>
      </div>

    </div>
  </section>

  <!-- TICKER -->
  <div class="ticker-wrap" aria-hidden="true">
    <div class="ticker-track">
      <%-- Duplicate for seamless loop --%>
      <span class="ticker-item">Free shipping on orders over ₹499 <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">New arrivals every Monday <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">Up to 70% off in the Mega Sale <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">Easy 30-day returns <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">48,000+ happy customers <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">Free shipping on orders over ₹499 <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">New arrivals every Monday <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">Up to 70% off in the Mega Sale <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">Easy 30-day returns <span class="ticker-sep">✦</span></span>
      <span class="ticker-item">48,000+ happy customers <span class="ticker-sep">✦</span></span>
    </div>
  </div>

  <script>
    // Smooth parallax on blobs with mouse movement
    document.addEventListener('mousemove', (e) => {
      const cx = window.innerWidth / 2, cy = window.innerHeight / 2;
      const dx = (e.clientX - cx) / cx, dy = (e.clientY - cy) / cy;
      document.querySelectorAll('.blob').forEach((b, i) => {
        const speed = (i + 1) * 12;
        b.style.transform = `translate(${dx * speed}px, ${dy * speed}px)`;
      });
    });

    // Swap product card on click for fun
    const products = [
      { emoji: '🎒', name: 'Cloud Backpack',    price: '₹1,299', old: '₹2,499', off: '48% OFF — Today only!' },
      { emoji: '👟', name: 'Bounce Sneakers',   price: '₹2,199', old: '₹3,999', off: '45% OFF — Limited stock!' },
      { emoji: '🕶️', name: 'Chill Sunglasses', price: '₹599',   old: '₹1,299', off: '54% OFF — Hurry!' },
      { emoji: '🎧', name: 'BeatBuds Pro',      price: '₹3,499', old: '₹5,999', off: '42% OFF — Best seller!' },
    ];
    let idx = 0;

    document.querySelector('.product-card').addEventListener('click', () => {
      idx = (idx + 1) % products.length;
      const p = products[idx];
      document.querySelector('.product-emoji').textContent = p.emoji;
      document.querySelector('.product-name').textContent  = p.name;
      document.querySelector('.product-price').innerHTML   =
        `${p.price} <span>${p.old}</span>`;
      document.querySelector('.product-tag').textContent   = `🔥 ${p.off}`;
    });
  </script>

</body>
</html>

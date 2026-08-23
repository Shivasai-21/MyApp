<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="dark">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>BazaarX — The Night Bazaar of India</title>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,600;0,9..144,700;1,9..144,500&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
<style>
  *,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}

  :root{
    /* ── SIGNATURE PALETTE — Night Bazaar ── */
    --marigold:#FF9F1C;
    --henna:#C1272D;
    --turmeric:#FFC93C;
    --peacock:#0B6E4F;
    --peacock-2:#0E8C63;

    --font-display:'Fraunces',serif;
    --font-body:'Inter',sans-serif;

    --nav-h:60px;
    --sub-nav-h:42px;
    --radius:14px;
    --ease:cubic-bezier(.22,.9,.32,1);
  }

  html[data-theme="dark"]{
    --bg:#150C29;
    --bg-2:#1B1030;
    --surface:#221540;
    --surface-2:#2A1B4E;
    --text:#F4EFFF;
    --text-dim:#B9AEDA;
    --muted:#8E82B3;
    --border:#3A2A63;
    --card:#1F1440;
    --nav-bg:#120a24;
    --shadow:0 18px 44px rgba(0,0,0,.45);
  }
  html[data-theme="light"]{
    --bg:#FFFBF3;
    --bg-2:#FFF3DC;
    --surface:#FFFFFF;
    --surface-2:#FFF6E6;
    --text:#241536;
    --text-dim:#5B4A76;
    --muted:#8577A0;
    --border:#EFE1C6;
    --card:#FFFFFF;
    --nav-bg:#241536;
    --shadow:0 18px 44px rgba(90,60,20,.14);
  }

  body{font-family:var(--font-body);background:var(--bg);color:var(--text);min-height:100vh;transition:background .35s var(--ease),color .35s var(--ease);}
  a{text-decoration:none;color:inherit;}
  img{display:block;}
  button{cursor:pointer;font-family:inherit;}
  ::selection{background:var(--marigold);color:#1B1030;}

  :focus-visible{outline:2.5px solid var(--turmeric);outline-offset:2px;border-radius:4px;}

  @media (prefers-reduced-motion: reduce){
    *,*::before,*::after{animation-duration:.001ms !important;animation-iteration-count:1 !important;transition-duration:.001ms !important;scroll-behavior:auto !important;}
  }

  /* ══ GARLAND DIVIDER — signature element ══ */
  .garland{width:100%;height:34px;overflow:hidden;line-height:0;}
  .garland svg{width:100%;height:100%;display:block;}

  /* ══ TOP BAR ══ */
  .topbar{background:var(--nav-bg);color:#C9BEE8;font-size:.76rem;padding:.35rem 1.5rem;display:flex;justify-content:space-between;align-items:center;font-weight:500;}
  .topbar a{opacity:.85;transition:opacity .15s;}
  .topbar a:hover{opacity:1;color:var(--turmeric);}
  .topbar-left,.topbar-right{display:flex;gap:1.1rem;align-items:center;}

  /* ══ NAVBAR ══ */
  nav{position:sticky;top:0;z-index:300;background:var(--nav-bg);height:var(--nav-h);display:flex;align-items:center;padding:0 1.5rem;gap:1.1rem;box-shadow:var(--shadow);}

  .nav-logo{font-family:var(--font-display);font-weight:700;font-size:1.6rem;color:var(--turmeric);white-space:nowrap;flex-shrink:0;letter-spacing:-.5px;}
  .nav-logo span{color:var(--henna);}

  .nav-location{display:flex;flex-direction:column;font-size:.72rem;color:#B9AEDA;flex-shrink:0;cursor:pointer;line-height:1.25;}
  .nav-location strong{color:#fff;font-size:.85rem;}

  .search-wrap{flex:1;display:flex;position:relative;border-radius:10px;overflow:visible;border:2px solid var(--marigold);height:42px;background:var(--surface);}
  .search-cat{background:transparent;border:none;padding:0 .7rem;font-size:.78rem;color:var(--text);border-right:1px solid var(--border);cursor:pointer;}
  .search-input{flex:1;border:none;outline:none;padding:0 1rem;font-size:.95rem;font-family:var(--font-body);background:transparent;color:var(--text);}
  .search-btn{background:var(--marigold);border:none;padding:0 1.1rem;font-size:1.05rem;display:flex;align-items:center;justify-content:center;transition:background .2s;border-radius:0 8px 8px 0;}
  .search-btn:hover{background:var(--turmeric);}
  .search-suggest{position:absolute;top:calc(100% + 8px);left:0;right:0;background:var(--surface);border:1px solid var(--border);border-radius:10px;box-shadow:var(--shadow);z-index:50;overflow:hidden;display:none;}
  .search-suggest.open{display:block;}
  .search-suggest-item{display:flex;align-items:center;gap:.7rem;padding:.6rem .9rem;font-size:.85rem;transition:background .12s;}
  .search-suggest-item:hover,.search-suggest-item.active{background:var(--surface-2);}
  .search-suggest-item .ss-emoji{font-size:1.2rem;}
  .search-suggest-item .ss-price{margin-left:auto;font-weight:700;color:var(--henna);}
  .search-empty{padding:.9rem;font-size:.82rem;color:var(--muted);text-align:center;}

  .nav-icons{display:flex;gap:.3rem;align-items:center;flex-shrink:0;}
  .theme-toggle{background:var(--surface);border:1px solid var(--border);width:38px;height:38px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:1.05rem;transition:transform .3s var(--ease),background .2s;}
  .theme-toggle:hover{transform:rotate(20deg) scale(1.08);}

  .nav-icon-btn{display:flex;flex-direction:column;align-items:center;background:transparent;border:none;color:#fff;font-size:.68rem;padding:.3rem .6rem;border-radius:8px;transition:background .15s;line-height:1.3;white-space:nowrap;position:relative;}
  .nav-icon-btn:hover{background:rgba(255,255,255,.1);}
  .nav-icon-btn .icon{font-size:1.3rem;}
  .badge-wrap{position:relative;display:inline-block;}
  .nav-badge{position:absolute;top:-6px;right:-9px;background:var(--henna);color:#fff;font-size:.63rem;font-weight:700;min-width:16px;height:16px;padding:0 3px;border-radius:99px;display:flex;align-items:center;justify-content:center;transition:transform .2s var(--ease);}
  .nav-badge.bump{transform:scale(1.4);}

  /* ══ SUB NAV ══ */
  .sub-nav{background:var(--surface);height:var(--sub-nav-h);display:flex;align-items:center;padding:0 1.5rem;gap:.2rem;overflow-x:auto;scrollbar-width:none;border-bottom:1px solid var(--border);}
  .sub-nav::-webkit-scrollbar{display:none;}
  .sub-nav a{color:var(--text-dim);font-size:.82rem;font-weight:600;padding:.3rem .9rem;border-radius:99px;white-space:nowrap;transition:background .15s,color .15s;}
  .sub-nav a:hover{background:var(--surface-2);color:var(--text);}
  .sub-nav a.hot{color:var(--henna);}

  /* ══ HERO ══ */
  .hero-banner{position:relative;width:100%;overflow:hidden;background:radial-gradient(ellipse at 75% 20%,#3A2263 0%,var(--bg-2) 55%,var(--bg) 100%);display:flex;align-items:center;justify-content:space-between;padding:3rem 5% 3.5rem;min-height:400px;}
  .rangoli-bg{position:absolute;inset:0;opacity:.16;pointer-events:none;}
  html[data-theme="light"] .rangoli-bg{opacity:.10;}

  .hero-text-block{z-index:2;max-width:520px;}
  .hero-eyebrow{display:inline-flex;align-items:center;gap:.5rem;background:var(--henna);color:#fff;font-size:.75rem;font-weight:700;text-transform:uppercase;letter-spacing:1.5px;padding:.35rem 1rem;border-radius:99px;margin-bottom:1.3rem;animation:fadeSlideIn .6s var(--ease) both;}
  .hero-heading{font-family:var(--font-display);font-weight:700;font-size:clamp(2.3rem,4.2vw,3.6rem);color:#fff;line-height:1.08;margin-bottom:1.1rem;animation:fadeSlideIn .7s var(--ease) .1s both;}
  .hero-heading em{color:var(--turmeric);font-style:italic;font-weight:500;}
  .hero-sub{color:#C9BEE8;font-size:1.02rem;line-height:1.65;margin-bottom:1.9rem;animation:fadeSlideIn .7s var(--ease) .2s both;}
  .hero-ctas{display:flex;gap:1rem;flex-wrap:wrap;animation:fadeSlideIn .7s var(--ease) .3s both;}

  .btn-hero-primary{background:var(--marigold);color:#1B1030;font-weight:700;font-size:.95rem;padding:.8rem 1.9rem;border-radius:10px;border:none;transition:transform .15s,box-shadow .15s;box-shadow:0 8px 22px rgba(255,159,28,.35);}
  .btn-hero-primary:hover{transform:translateY(-2px);box-shadow:0 12px 28px rgba(255,159,28,.45);}
  .btn-hero-sec{background:transparent;color:#fff;font-weight:600;font-size:.95rem;padding:.8rem 1.9rem;border-radius:10px;border:2px solid rgba(255,255,255,.3);transition:border-color .15s,background .15s;}
  .btn-hero-sec:hover{border-color:#fff;background:rgba(255,255,255,.08);}

  .hero-stats{display:flex;gap:2.2rem;margin-top:2.3rem;animation:fadeSlideIn .7s var(--ease) .4s both;}
  .stat{text-align:center;}
  .stat-num{font-family:var(--font-display);font-weight:700;font-size:1.85rem;color:var(--turmeric);}
  .stat-label{font-size:.7rem;color:#8E82B3;text-transform:uppercase;letter-spacing:1px;}

  .hero-visual{position:relative;flex-shrink:0;animation:fadeSlideIn .8s var(--ease) .15s both;display:flex;align-items:center;justify-content:center;}
  .hero-phone{width:210px;background:var(--surface);border-radius:26px;padding:1.3rem;box-shadow:0 30px 80px rgba(0,0,0,.5);text-align:center;transform:rotate(-4deg);border:1px solid var(--border);}
  .hero-phone-img{font-size:5rem;margin:0 auto .6rem;}
  .hero-phone-name{font-weight:700;font-size:.9rem;color:var(--text);}
  .hero-phone-price{font-weight:800;font-size:1.35rem;color:var(--henna);margin-top:.2rem;}
  .hero-phone-off{font-size:.75rem;color:var(--peacock-2);font-weight:700;}

  .hero-badge{position:absolute;color:#fff;font-weight:700;font-size:.78rem;padding:.4rem .9rem;border-radius:99px;white-space:nowrap;box-shadow:0 4px 14px rgba(0,0,0,.3);}
  .hero-badge-1{top:0;left:-40px;background:var(--henna);transform:rotate(-8deg);animation:float 3.5s ease-in-out infinite;}
  .hero-badge-2{bottom:14px;right:-56px;background:var(--peacock);transform:rotate(5deg);animation:float 4s ease-in-out 1s infinite;}
  .hero-badge-3{top:58%;left:-64px;background:var(--turmeric);color:#1B1030;transform:rotate(3deg);animation:float 4.5s ease-in-out .5s infinite;}

  @keyframes float{0%,100%{translate:0 0} 50%{translate:0 -10px}}
  @keyframes fadeSlideIn{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
  @keyframes shimmer{0%{background-position:-400px 0}100%{background-position:400px 0}}
  @keyframes toastIn{from{opacity:0;transform:translateY(12px) scale(.96)}to{opacity:1;transform:translateY(0) scale(1)}}
  @keyframes pulseGlow{0%,100%{box-shadow:0 0 0 0 rgba(255,159,28,.5)}50%{box-shadow:0 0 0 8px rgba(255,159,28,0)}}

  .hero-dots{position:absolute;bottom:16px;left:50%;transform:translateX(-50%);display:flex;gap:6px;z-index:2;}
  .dot{width:8px;height:8px;border-radius:50%;background:rgba(255,255,255,.3);transition:background .3s,width .3s;}
  .dot.active{background:var(--turmeric);width:22px;border-radius:4px;}

  /* ══ LAYOUT ══ */
  .page{max-width:1280px;margin:0 auto;padding:0 1.5rem;}

  /* ══ DEAL STRIP ══ */
  .deal-strip{background:linear-gradient(90deg,var(--henna) 0%,#8E1A20 100%);padding:.55rem 1.5rem;display:flex;align-items:center;gap:1rem;overflow-x:auto;scrollbar-width:none;}
  .deal-strip::-webkit-scrollbar{display:none;}
  .deal-label{color:#fff;font-weight:700;font-size:.85rem;white-space:nowrap;display:flex;align-items:center;gap:.4rem;flex-shrink:0;}
  .deal-timer{background:rgba(0,0,0,.28);color:#fff;font-size:.75rem;font-weight:700;padding:.22rem .6rem;border-radius:5px;font-variant-numeric:tabular-nums;flex-shrink:0;}
  .deal-divider{width:1px;height:20px;background:rgba(255,255,255,.3);flex-shrink:0;}
  .deal-tag{background:rgba(255,255,255,.16);color:#fff;font-size:.78rem;font-weight:600;padding:.22rem .8rem;border-radius:99px;white-space:nowrap;flex-shrink:0;border:1px solid rgba(255,255,255,.3);transition:background .15s;}
  .deal-tag:hover{background:rgba(255,255,255,.28);}

  /* ══ SECTIONS ══ */
  .section{padding:2.4rem 0;}
  .section-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:1.3rem;flex-wrap:wrap;gap:.8rem;}
  .section-title{font-family:var(--font-display);font-weight:700;font-size:1.55rem;color:var(--text);display:flex;align-items:center;gap:.6rem;}
  .section-title .pill{font-family:var(--font-body);font-size:.7rem;font-weight:700;background:var(--henna);color:#fff;padding:.18rem .65rem;border-radius:99px;}
  .see-all{color:var(--henna);font-weight:700;font-size:.85rem;border:1.5px solid var(--henna);border-radius:8px;padding:.35rem 1rem;transition:all .15s;}
  .see-all:hover{background:var(--henna);color:#fff;}

  /* Sort / filter bar */
  .filter-bar{display:flex;gap:.6rem;flex-wrap:wrap;align-items:center;}
  .filter-chip{background:var(--surface);border:1.5px solid var(--border);color:var(--text-dim);font-size:.8rem;font-weight:600;padding:.4rem .95rem;border-radius:99px;transition:all .15s;}
  .filter-chip:hover{border-color:var(--marigold);color:var(--text);}
  .filter-chip.active{background:var(--marigold);border-color:var(--marigold);color:#1B1030;}

  /* ══ CATEGORY GRID ══ */
  .cat-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(102px,1fr));gap:1rem;}
  .cat-item{background:var(--card);border-radius:var(--radius);padding:1.3rem .5rem;text-align:center;border:1.5px solid var(--border);cursor:pointer;transition:transform .18s,box-shadow .18s,border-color .18s;}
  .cat-item:hover{transform:translateY(-4px);box-shadow:var(--shadow);border-color:var(--marigold);}
  .cat-icon{font-size:2.2rem;margin-bottom:.5rem;}
  .cat-name{font-size:.78rem;font-weight:600;color:var(--text);line-height:1.3;}

  /* ══ PRODUCT CARDS ══ */
  .product-scroll{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:1.1rem;}
  .product-card{background:var(--card);border-radius:var(--radius);border:1.5px solid var(--border);overflow:hidden;position:relative;cursor:pointer;transition:transform .2s,box-shadow .2s,border-color .2s;}
  .product-card:hover{transform:translateY(-5px);box-shadow:var(--shadow);border-color:var(--marigold);}
  .product-img{background:linear-gradient(135deg,var(--surface-2),var(--surface));height:180px;display:flex;align-items:center;justify-content:center;font-size:4.5rem;position:relative;}
  .product-badge{position:absolute;top:10px;left:10px;font-size:.66rem;font-weight:700;padding:.22rem .55rem;border-radius:5px;color:#fff;letter-spacing:.3px;}
  .badge-sale{background:var(--henna);} .badge-new{background:var(--peacock);} .badge-hot{background:var(--marigold);color:#1B1030;} .badge-top{background:#4A3B7A;}
  .quickview-btn{position:absolute;bottom:10px;left:50%;translate:-50% 14px;opacity:0;background:rgba(20,10,40,.85);color:#fff;font-size:.72rem;font-weight:700;padding:.4rem .9rem;border-radius:99px;border:none;transition:all .2s var(--ease);white-space:nowrap;}
  .product-card:hover .quickview-btn{opacity:1;translate:-50% 0;}
  .wishlist-btn{position:absolute;top:10px;right:10px;background:var(--surface);border:none;width:32px;height:32px;border-radius:50%;font-size:1rem;display:flex;align-items:center;justify-content:center;box-shadow:0 2px 8px rgba(0,0,0,.18);transition:transform .2s;}
  .wishlist-btn:hover{transform:scale(1.15);}
  .product-info{padding:1rem;}
  .product-brand{font-size:.7rem;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;}
  .product-name{font-size:.9rem;font-weight:600;color:var(--text);margin:.25rem 0;line-height:1.35;min-height:2.5em;}
  .rating{display:flex;align-items:center;gap:.3rem;margin:.4rem 0;}
  .stars{font-size:.72rem;color:var(--marigold);letter-spacing:-1px;}
  .rating-num{font-size:.72rem;color:var(--muted);}
  .price-row{display:flex;align-items:baseline;gap:.5rem;flex-wrap:wrap;}
  .price-new{font-size:1.15rem;font-weight:800;color:var(--text);}
  .price-old{font-size:.8rem;color:var(--muted);text-decoration:line-through;}
  .price-off{font-size:.76rem;font-weight:700;color:var(--peacock-2);}
  .product-footer{border-top:1px solid var(--border);padding:.65rem 1rem;display:flex;align-items:center;justify-content:space-between;}
  .delivery-tag{font-size:.7rem;color:var(--muted);}
  .delivery-tag strong{color:var(--peacock-2);}
  .add-btn{background:var(--marigold);color:#1B1030;border:none;border-radius:7px;font-size:.75rem;font-weight:800;padding:.4rem .85rem;transition:background .15s,transform .1s;}
  .add-btn:hover{background:var(--turmeric);transform:scale(1.04);}

  /* ══ BANNER CARDS ══ */
  .banner-row{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:1.1rem;}
  .banner-card{border-radius:18px;overflow:hidden;position:relative;min-height:170px;display:flex;flex-direction:column;justify-content:flex-end;padding:1.5rem;cursor:pointer;transition:transform .2s,box-shadow .2s;}
  .banner-card:hover{transform:translateY(-3px);box-shadow:var(--shadow);}
  .banner-card::before{content:'';position:absolute;inset:0;}
  .bc-1::before{background:linear-gradient(135deg,#3A2263,#5B3A9E);}
  .bc-2::before{background:linear-gradient(135deg,#8E1A20,var(--henna));}
  .bc-3::before{background:linear-gradient(135deg,#0B6E4F,#12A97A);}
  .banner-emoji{position:absolute;right:1.2rem;top:50%;transform:translateY(-50%);font-size:4.6rem;opacity:.85;}
  .banner-eyebrow{color:rgba(255,255,255,.72);font-size:.72rem;font-weight:700;text-transform:uppercase;letter-spacing:1.5px;position:relative;z-index:1;}
  .banner-title{font-family:var(--font-display);font-weight:700;font-size:1.4rem;color:#fff;position:relative;z-index:1;line-height:1.2;margin:.25rem 0 .55rem;}
  .banner-cta{display:inline-flex;align-items:center;gap:.4rem;color:#fff;font-size:.8rem;font-weight:700;position:relative;z-index:1;border-bottom:1.5px solid rgba(255,255,255,.5);padding-bottom:1px;width:fit-content;}

  /* ══ FLASH DEALS ══ */
  .flash-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(152px,1fr));gap:.85rem;}
  .flash-card{background:var(--card);border-radius:12px;border:1.5px solid var(--border);padding:1.1rem .8rem;text-align:center;cursor:pointer;transition:transform .18s,box-shadow .18s;position:relative;overflow:hidden;}
  .flash-card::after{content:'';position:absolute;bottom:0;left:0;right:0;height:3px;background:linear-gradient(90deg,var(--henna),var(--marigold));}
  .flash-card:hover{transform:translateY(-3px);box-shadow:var(--shadow);}
  .flash-emoji{font-size:3rem;margin-bottom:.5rem;}
  .flash-name{font-size:.8rem;font-weight:600;color:var(--text);margin-bottom:.4rem;}
  .flash-off{font-size:1.2rem;font-weight:800;color:var(--henna);}
  .flash-label{font-size:.68rem;color:var(--muted);}

  /* ══ PROMO STRIP ══ */
  .promo-strip{background:var(--surface);border:1px solid var(--border);border-radius:18px;display:flex;align-items:center;justify-content:space-around;padding:1.5rem 2rem;gap:1rem;flex-wrap:wrap;}
  .promo-item{display:flex;align-items:center;gap:.8rem;color:var(--text);}
  .promo-icon{font-size:2rem;}
  .promo-text strong{display:block;font-size:.9rem;font-weight:700;}
  .promo-text span{font-size:.75rem;color:var(--muted);}

  /* ══ TESTIMONIALS ══ */
  .testi-wrap{position:relative;max-width:720px;margin:0 auto;text-align:center;overflow:hidden;}
  .testi-track{display:flex;transition:transform .5s var(--ease);}
  .testi-slide{flex:0 0 100%;padding:1rem 2rem;}
  .testi-stars{color:var(--marigold);font-size:1.1rem;margin-bottom:.8rem;}
  .testi-quote{font-family:var(--font-display);font-size:1.25rem;font-style:italic;line-height:1.5;color:var(--text);margin-bottom:1rem;}
  .testi-name{font-weight:700;font-size:.88rem;}
  .testi-loc{font-size:.75rem;color:var(--muted);}
  .testi-dots{display:flex;justify-content:center;gap:6px;margin-top:1.2rem;}
  .testi-dot{width:7px;height:7px;border-radius:50%;background:var(--border);transition:all .25s;cursor:pointer;}
  .testi-dot.active{background:var(--henna);width:20px;border-radius:4px;}

  /* ══ NEWSLETTER ══ */
  .newsletter{background:linear-gradient(120deg,#3A2263,#1B1030);border-radius:20px;padding:2.5rem 2rem;text-align:center;position:relative;overflow:hidden;}
  .newsletter h3{font-family:var(--font-display);font-weight:700;font-size:1.7rem;color:#fff;margin-bottom:.5rem;}
  .newsletter p{color:#C9BEE8;font-size:.9rem;margin-bottom:1.4rem;}
  .newsletter-form{display:flex;gap:.6rem;max-width:420px;margin:0 auto;flex-wrap:wrap;justify-content:center;}
  .newsletter-form input{flex:1;min-width:200px;padding:.75rem 1rem;border-radius:9px;border:none;font-size:.9rem;font-family:inherit;}
  .newsletter-form button{background:var(--marigold);color:#1B1030;font-weight:800;border:none;padding:.75rem 1.5rem;border-radius:9px;transition:background .15s;}
  .newsletter-form button:hover{background:var(--turmeric);}
  .newsletter-note{font-size:.72rem;color:#8E82B3;margin-top:.7rem;}

  /* ══ FOOTER ══ */
  footer{background:var(--nav-bg);color:#9C90BF;margin-top:3rem;padding:3rem 1.5rem 1rem;}
  .footer-grid{max-width:1280px;margin:0 auto;display:grid;grid-template-columns:2fr repeat(3,1fr);gap:2rem;margin-bottom:2rem;}
  .footer-logo{font-family:var(--font-display);font-weight:700;font-size:1.6rem;color:var(--turmeric);margin-bottom:.8rem;}
  .footer-logo span{color:var(--henna);}
  .footer-desc{font-size:.82rem;line-height:1.7;max-width:260px;}
  .footer-socials{display:flex;gap:.8rem;margin-top:1.2rem;}
  .social-btn{width:36px;height:36px;border-radius:50%;background:rgba(255,255,255,.07);display:flex;align-items:center;justify-content:center;font-size:1rem;cursor:pointer;transition:background .15s;}
  .social-btn:hover{background:var(--henna);}
  .footer-col h4{color:#fff;font-size:.9rem;font-weight:700;margin-bottom:1rem;}
  .footer-col ul{list-style:none;display:flex;flex-direction:column;gap:.6rem;}
  .footer-col li a{font-size:.8rem;transition:color .15s;}
  .footer-col li a:hover{color:#fff;}
  .footer-bottom{max-width:1280px;margin:0 auto;padding-top:1.5rem;border-top:1px solid rgba(255,255,255,.08);display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:1rem;font-size:.78rem;}
  .payments{display:flex;gap:.5rem;flex-wrap:wrap;}
  .pay-badge{background:rgba(255,255,255,.08);border-radius:5px;padding:.2rem .6rem;font-size:.72rem;font-weight:700;color:#fff;}

  /* ══ CART DRAWER ══ */
  .overlay{position:fixed;inset:0;background:rgba(10,5,20,.55);z-index:400;opacity:0;pointer-events:none;transition:opacity .25s;}
  .overlay.open{opacity:1;pointer-events:auto;}
  .cart-drawer{position:fixed;top:0;right:0;bottom:0;width:min(420px,92vw);background:var(--bg);z-index:401;box-shadow:-16px 0 40px rgba(0,0,0,.35);transform:translateX(100%);transition:transform .32s var(--ease);display:flex;flex-direction:column;}
  .cart-drawer.open{transform:translateX(0);}
  .cart-head{display:flex;align-items:center;justify-content:space-between;padding:1.1rem 1.3rem;border-bottom:1px solid var(--border);}
  .cart-head h3{font-family:var(--font-display);font-size:1.2rem;}
  .cart-close{background:var(--surface);border:1px solid var(--border);border-radius:50%;width:32px;height:32px;font-size:1rem;}
  .cart-items{flex:1;overflow-y:auto;padding:1rem 1.3rem;display:flex;flex-direction:column;gap:.9rem;}
  .cart-empty{text-align:center;color:var(--muted);padding:3rem 1rem;font-size:.88rem;}
  .cart-empty .ce-emoji{font-size:2.6rem;margin-bottom:.6rem;}
  .cart-item{display:flex;gap:.8rem;background:var(--card);border:1px solid var(--border);border-radius:12px;padding:.7rem;align-items:center;}
  .ci-emoji{font-size:1.8rem;width:44px;height:44px;background:var(--surface-2);border-radius:9px;display:flex;align-items:center;justify-content:center;flex-shrink:0;}
  .ci-info{flex:1;min-width:0;}
  .ci-name{font-size:.83rem;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
  .ci-price{font-size:.8rem;color:var(--henna);font-weight:700;}
  .ci-qty{display:flex;align-items:center;gap:.5rem;margin-top:.4rem;}
  .qty-btn{width:22px;height:22px;border-radius:6px;border:1px solid var(--border);background:var(--surface);font-size:.8rem;display:flex;align-items:center;justify-content:center;}
  .ci-remove{background:none;border:none;color:var(--muted);font-size:.95rem;padding:.3rem;flex-shrink:0;}
  .ci-remove:hover{color:var(--henna);}
  .cart-footer{border-top:1px solid var(--border);padding:1.1rem 1.3rem;}
  .cart-subtotal{display:flex;justify-content:space-between;font-size:.95rem;font-weight:700;margin-bottom:.9rem;}
  .checkout-btn{width:100%;background:var(--marigold);color:#1B1030;font-weight:800;border:none;padding:.9rem;border-radius:10px;font-size:.95rem;transition:background .15s;}
  .checkout-btn:hover{background:var(--turmeric);}
  .checkout-btn:disabled{opacity:.5;cursor:not-allowed;}

  /* ══ QUICK VIEW MODAL ══ */
  .qv-modal{position:fixed;top:50%;left:50%;translate:-50% -50%;width:min(640px,92vw);max-height:88vh;overflow-y:auto;background:var(--bg);border-radius:20px;z-index:402;box-shadow:0 30px 80px rgba(0,0,0,.5);opacity:0;pointer-events:none;transform:translate(-50%,-46%);transition:opacity .25s,transform .25s;}
  .qv-modal.open{opacity:1;pointer-events:auto;transform:translate(-50%,-50%);}
  .qv-close{position:absolute;top:1rem;right:1rem;background:var(--surface);border:1px solid var(--border);width:34px;height:34px;border-radius:50%;font-size:1.1rem;z-index:2;}
  .qv-body{display:grid;grid-template-columns:1fr 1fr;}
  .qv-img{background:var(--surface-2);display:flex;align-items:center;justify-content:center;font-size:7rem;min-height:260px;}
  .qv-info{padding:1.6rem;}
  .qv-brand{font-size:.75rem;font-weight:700;color:var(--muted);text-transform:uppercase;}
  .qv-name{font-family:var(--font-display);font-size:1.35rem;font-weight:700;margin:.3rem 0 .6rem;}
  .qv-price-row{display:flex;align-items:baseline;gap:.6rem;margin-bottom:.9rem;}
  .qv-price-new{font-size:1.5rem;font-weight:800;}
  .qv-price-old{font-size:.9rem;color:var(--muted);text-decoration:line-through;}
  .qv-desc{font-size:.85rem;color:var(--text-dim);line-height:1.6;margin-bottom:1.2rem;}
  .qv-qty-row{display:flex;align-items:center;gap:1rem;margin-bottom:1.2rem;}
  .qv-qty-controls{display:flex;align-items:center;gap:.7rem;border:1px solid var(--border);border-radius:9px;padding:.3rem .7rem;}
  .qv-add{flex:1;background:var(--marigold);color:#1B1030;font-weight:800;border:none;padding:.8rem;border-radius:10px;font-size:.9rem;}
  .qv-add:hover{background:var(--turmeric);}
  @media (max-width:560px){.qv-body{grid-template-columns:1fr;} .qv-img{min-height:180px;font-size:5rem;}}

  /* ══ TOASTS ══ */
  .toast-stack{position:fixed;bottom:22px;left:50%;translate:-50% 0;z-index:500;display:flex;flex-direction:column;gap:.5rem;align-items:center;}
  .toast{background:var(--surface);border:1px solid var(--border);color:var(--text);font-size:.85rem;font-weight:600;padding:.7rem 1.2rem;border-radius:99px;box-shadow:var(--shadow);display:flex;align-items:center;gap:.5rem;animation:toastIn .25s var(--ease) both;}

  /* ══ BACK TO TOP ══ */
  .back-top{position:fixed;bottom:22px;right:22px;width:46px;height:46px;border-radius:50%;background:var(--marigold);color:#1B1030;border:none;font-size:1.2rem;box-shadow:var(--shadow);opacity:0;pointer-events:none;transform:translateY(10px);transition:all .25s;z-index:150;}
  .back-top.show{opacity:1;pointer-events:auto;transform:translateY(0);}

  /* ══ SKELETON LOADING ══ */
  .skeleton{background:linear-gradient(90deg,var(--surface-2) 25%,var(--surface) 37%,var(--surface-2) 63%);background-size:400px 100%;animation:shimmer 1.4s infinite linear;border-radius:8px;}

  /* ══ RESPONSIVE ══ */
  @media (max-width:900px){
    .hero-visual{display:none;}
    .hero-stats{gap:1.2rem;}
    .footer-grid{grid-template-columns:1fr 1fr;}
    .qv-body{grid-template-columns:1fr;}
  }
  @media (max-width:640px){
    .nav-location{display:none;}
    .hero-banner{padding:2rem 1.2rem 2.6rem;}
    .footer-grid{grid-template-columns:1fr;}
    .footer-desc{max-width:100%;}
    .promo-strip{justify-content:flex-start;}
    body{padding-bottom:56px;}
  }

  /* ══ MOBILE BOTTOM NAV ══ */
  .mobile-tabbar{display:none;}
  @media (max-width:640px){
    .mobile-tabbar{display:flex;position:fixed;bottom:0;left:0;right:0;height:56px;background:var(--nav-bg);z-index:250;border-top:1px solid var(--border);align-items:center;justify-content:space-around;}
    .mt-item{display:flex;flex-direction:column;align-items:center;gap:2px;color:#fff;font-size:.62rem;background:none;border:none;position:relative;}
    .mt-item .icon{font-size:1.25rem;}
  }
</style>
</head>
<body>

<!-- TOP BAR -->
<div class="topbar">
  <div class="topbar-left">
    <a href="#">Download App</a><span>|</span>
    <a href="#">Sell on BazaarX</a><span>|</span>
    <a href="#">Help</a>
  </div>
  <div class="topbar-right">
    <a href="#">Track Order</a><span>|</span>
    <a href="#">Sign In</a><span>|</span>
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
    <select class="search-cat" id="searchCat">
      <option>All</option>
      <option>Electronics</option>
      <option>Fashion</option>
      <option>Home</option>
      <option>Books</option>
      <option>Grocery</option>
    </select>
    <input class="search-input" id="searchInput" type="text" placeholder="Search products, brands and more..." autocomplete="off"/>
    <button class="search-btn" id="searchBtn">🔍</button>
    <div class="search-suggest" id="searchSuggest"></div>
  </div>

  <div class="nav-icons">
    <button class="theme-toggle" id="themeToggle" title="Toggle theme" aria-label="Toggle dark and light theme">🌙</button>
    <button class="nav-icon-btn" id="wishlistNavBtn">
      <div class="badge-wrap"><span class="icon">🤍</span><span class="nav-badge" id="wishBadge">0</span></div>
      <span>Wishlist</span>
    </button>
    <button class="nav-icon-btn" id="cartOpenBtn">
      <div class="badge-wrap"><span class="icon">🛒</span><span class="nav-badge" id="cartBadge">0</span></div>
      <span>Cart</span>
    </button>
  </div>
</nav>

<!-- SUB NAV -->
<div class="sub-nav">
  <a href="#" class="hot">🔥 Today's Deals</a>
  <a href="#">Electronics</a><a href="#">Mobiles</a><a href="#">Fashion</a>
  <a href="#">Home & Kitchen</a><a href="#">Beauty</a><a href="#">Books</a>
  <a href="#">Sports</a><a href="#">Toys</a><a href="#">Grocery</a>
  <a href="#">Automotive</a><a href="#">Pet Supplies</a><a href="#">Health</a><a href="#">Travel</a>
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

<!-- HERO -->
<div class="hero-banner">
  <svg class="rangoli-bg" viewBox="0 0 600 400" preserveAspectRatio="xMidYMid slice">
    <g transform="translate(470,90)" stroke="#FFC93C" stroke-width="1.4" fill="none">
      <circle r="70"/><circle r="52"/><circle r="30"/>
      <g id="petals"></g>
    </g>
  </svg>

  <div class="hero-text-block">
    <div class="hero-eyebrow">🎉 Grand Summer Sale 2026</div>
    <h1 class="hero-heading">Deals so big,<br/><em>your wallet will thank you</em></h1>
    <p class="hero-sub">Up to 80% off on lakhs of products. Free delivery, easy returns, and Cash on Delivery available across India.</p>
    <div class="hero-ctas">
      <button class="btn-hero-primary" onclick="document.getElementById('bestsellers').scrollIntoView({behavior:'smooth'})">🛍️ Shop Now</button>
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
    <div class="dot active"></div><div class="dot"></div><div class="dot"></div><div class="dot"></div>
  </div>
</div>

<!-- GARLAND DIVIDER -->
<div class="garland">
  <svg viewBox="0 0 1200 34" preserveAspectRatio="none">
    <path d="M0,2 Q60,32 120,2 T240,2 T360,2 T480,2 T600,2 T720,2 T840,2 T960,2 T1080,2 T1200,2" fill="none" stroke="#5B3A9E" stroke-width="1.5" opacity=".5"/>
    <g id="garlandDots"></g>
  </svg>
</div>

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
  <div class="promo-strip" style="margin-bottom:.5rem;">
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
  <div class="section" id="bestsellers">
    <div class="section-header">
      <h2 class="section-title">🏆 Best Sellers</h2>
      <div class="filter-bar" id="filterBar">
        <button class="filter-chip active" data-sort="default">Featured</button>
        <button class="filter-chip" data-sort="priceLow">Price ↑</button>
        <button class="filter-chip" data-sort="priceHigh">Price ↓</button>
        <button class="filter-chip" data-sort="rating">Top Rated</button>
        <button class="filter-chip" data-sort="discount">Biggest Discount</button>
      </div>
    </div>
    <div class="product-scroll" id="bestsellerGrid">
      <%
        String[][] products = {
          {"1","📱","Samsung","Galaxy S24 FE 5G","4.5","12847","34999","54999","36","Free","sale"},
          {"2","🎧","boAt","Airdopes 141 ANC","4.3","28301","1299","4999","74","Free","hot"},
          {"3","👟","Nike","Air Max 270","4.6","9202","5995","8995","33","49","new"},
          {"4","⌚","Noise","ColorFit Ultra 3","4.4","18556","3499","8999","61","Free","sale"},
          {"5","💻","Lenovo","IdeaPad Slim 3","4.2","5821","37990","54990","31","Free","top"},
          {"6","📺","MI","Smart TV 43\" 4K","4.5","21443","26999","42999","37","Free","sale"},
          {"7","🎮","Sony","DualSense Controller","4.7","7663","5990","6990","14","Free","new"},
          {"8","🏠","Prestige","Induction Cooktop","4.3","14200","2199","3999","45","Free","hot"}
        };
      %>
      <% for(String[] p : products) { %>
      <div class="product-card" data-id="<%=p[0]%>" data-name="<%=p[3]%>" data-emoji="<%=p[1]%>" data-price="<%=p[6]%>" data-old="<%=p[7]%>" data-brand="<%=p[2]%>">
        <div class="product-img">
          <span><%=p[1]%></span>
          <span class="product-badge badge-<%=p[10]%>"><%=p[10].equals("sale")?"SALE":p[10].equals("hot")?"HOT":p[10].equals("new")?"NEW":"TOP PICK"%></span>
          <button class="wishlist-btn">🤍</button>
          <button class="quickview-btn">👁️ Quick View</button>
        </div>
        <div class="product-info">
          <div class="product-brand"><%=p[2]%></div>
          <div class="product-name"><%=p[3]%></div>
          <div class="rating"><span class="stars">★★★★★</span><span class="rating-num"><%=p[4]%> (<%=p[5]%>)</span></div>
          <div class="price-row">
            <span class="price-new">₹<%=p[6]%></span>
            <span class="price-old">₹<%=p[7]%></span>
            <span class="price-off"><%=p[8]%>% off</span>
          </div>
        </div>
        <div class="product-footer">
          <span class="delivery-tag"><strong><%=p[9].equals("Free")?"FREE":"₹"+p[9]%></strong> delivery</span>
          <button class="add-btn">Add to Cart</button>
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
    <div class="product-scroll" id="arrivalsGrid">
      <%
        String[][] arrivals = {
          {"9","🕶️","Ray-Ban","Classic Aviators","4.6","3201","4999","8500","41","Free","new"},
          {"10","👜","Lavie","Tote Shoulder Bag","4.4","6102","1499","2999","50","Free","new"},
          {"11","🌿","Mamaearth","SPF 50 Sunscreen","4.5","42000","349","599","42","Free","new"},
          {"12","📚","Penguin","Atomic Habits","4.8","110453","299","499","40","Free","top"},
          {"13","🎒","American Tourister","Cabin Backpack","4.3","8901","2199","3999","45","Free","new"},
          {"14","🧴","Biotique","Face Wash Kit","4.2","17200","499","799","38","Free","new"}
        };
      %>
      <% for(String[] a : arrivals) { %>
      <div class="product-card" data-id="<%=a[0]%>" data-name="<%=a[3]%>" data-emoji="<%=a[1]%>" data-price="<%=a[6]%>" data-old="<%=a[7]%>" data-brand="<%=a[2]%>">
        <div class="product-img">
          <span><%=a[1]%></span>
          <span class="product-badge badge-<%=a[10]%>"><%=a[10].equals("top")?"TOP PICK":"NEW"%></span>
          <button class="wishlist-btn">🤍</button>
          <button class="quickview-btn">👁️ Quick View</button>
        </div>
        <div class="product-info">
          <div class="product-brand"><%=a[2]%></div>
          <div class="product-name"><%=a[3]%></div>
          <div class="rating"><span class="stars">★★★★★</span><span class="rating-num"><%=a[4]%> (<%=a[5]%>)</span></div>
          <div class="price-row">
            <span class="price-new">₹<%=a[6]%></span>
            <span class="price-old">₹<%=a[7]%></span>
            <span class="price-off"><%=a[8]%>% off</span>
          </div>
        </div>
        <div class="product-footer">
          <span class="delivery-tag"><strong>FREE</strong> delivery</span>
          <button class="add-btn">Add to Cart</button>
        </div>
      </div>
      <% } %>
    </div>
  </div>

  <!-- TESTIMONIALS -->
  <div class="section">
    <div class="section-header" style="justify-content:center;">
      <h2 class="section-title">💬 What India is Saying</h2>
    </div>
    <div class="testi-wrap">
      <div class="testi-track" id="testiTrack">
        <div class="testi-slide">
          <div class="testi-stars">★★★★★</div>
          <p class="testi-quote">Ordered a phone at 11pm, it was at my door by evening the next day. The Diwali sale prices genuinely felt unbeatable.</p>
          <div class="testi-name">Ananya Rao</div><div class="testi-loc">Hyderabad</div>
        </div>
        <div class="testi-slide">
          <div class="testi-stars">★★★★★</div>
          <p class="testi-quote">Return process for my shoes took two clicks. No calls, no arguing — refund landed in three days flat.</p>
          <div class="testi-name">Rohit Malhotra</div><div class="testi-loc">Pune</div>
        </div>
        <div class="testi-slide">
          <div class="testi-stars">★★★★★</div>
          <p class="testi-quote">The COD option is a lifesaver for my parents' orders in our village. Wide selection, honest pricing.</p>
          <div class="testi-name">Fatima Sheikh</div><div class="testi-loc">Lucknow</div>
        </div>
      </div>
      <div class="testi-dots" id="testiDots"></div>
    </div>
  </div>

  <!-- NEWSLETTER -->
  <div class="section">
    <div class="newsletter">
      <h3>Never miss a bazaar drop 🪔</h3>
      <p>Flash sale alerts, festival offers, and early access — straight to your inbox.</p>
      <form class="newsletter-form" id="newsForm">
        <input type="email" id="newsEmail" placeholder="you@email.com" required/>
        <button type="submit">Notify Me</button>
      </form>
      <div class="newsletter-note">No spam. Unsubscribe anytime.</div>
    </div>
  </div>

</div><!-- /page -->

<div class="garland">
  <svg viewBox="0 0 1200 34" preserveAspectRatio="none">
    <path d="M0,2 Q60,32 120,2 T240,2 T360,2 T480,2 T600,2 T720,2 T840,2 T960,2 T1080,2 T1200,2" fill="none" stroke="#5B3A9E" stroke-width="1.5" opacity=".5"/>
    <g id="garlandDots2"></g>
  </svg>
</div>

<!-- FOOTER -->
<footer>
  <div class="footer-grid">
    <div>
      <div class="footer-logo">Bazaar<span>X</span></div>
      <p class="footer-desc">India's favourite online shopping destination. Lakhs of products. Best prices. Delivered fast, wherever you are.</p>
      <div class="footer-socials">
        <div class="social-btn">📘</div><div class="social-btn">📸</div><div class="social-btn">🐦</div><div class="social-btn">▶️</div>
      </div>
    </div>
    <div class="footer-col"><h4>About</h4><ul>
      <li><a href="#">About BazaarX</a></li><li><a href="#">Careers</a></li><li><a href="#">Press</a></li>
      <li><a href="#">Investor Relations</a></li><li><a href="#">Sustainability</a></li></ul></div>
    <div class="footer-col"><h4>Help</h4><ul>
      <li><a href="#">Track Your Order</a></li><li><a href="#">Returns & Refunds</a></li><li><a href="#">Payment Methods</a></li>
      <li><a href="#">Contact Us</a></li><li><a href="#">FAQs</a></li></ul></div>
    <div class="footer-col"><h4>Sell</h4><ul>
      <li><a href="#">Sell on BazaarX</a></li><li><a href="#">Seller University</a></li><li><a href="#">Advertise</a></li>
      <li><a href="#">BazaarX Business</a></li><li><a href="#">Affiliate Program</a></li></ul></div>
  </div>
  <div class="footer-bottom">
    <span>© 2026 BazaarX India Pvt. Ltd. | Privacy | Terms | Sitemap</span>
    <div class="payments">
      <span class="pay-badge">Visa</span><span class="pay-badge">Mastercard</span><span class="pay-badge">UPI</span>
      <span class="pay-badge">Net Banking</span><span class="pay-badge">COD</span><span class="pay-badge">EMI</span>
    </div>
  </div>
</footer>

<!-- MOBILE TAB BAR -->
<div class="mobile-tabbar">
  <button class="mt-item"><span class="icon">🏠</span>Home</button>
  <button class="mt-item"><span class="icon">🤍</span>Wishlist</button>
  <button class="mt-item" id="mtCart"><span class="icon">🛒</span>Cart</button>
  <button class="mt-item"><span class="icon">👤</span>Account</button>
</div>

<!-- CART DRAWER -->
<div class="overlay" id="overlay"></div>
<aside class="cart-drawer" id="cartDrawer" aria-label="Shopping cart">
  <div class="cart-head">
    <h3>Your Cart</h3>
    <button class="cart-close" id="cartCloseBtn" aria-label="Close cart">✕</button>
  </div>
  <div class="cart-items" id="cartItems"></div>
  <div class="cart-footer">
    <div class="cart-subtotal"><span>Subtotal</span><span id="cartSubtotal">₹0</span></div>
    <button class="checkout-btn" id="checkoutBtn" disabled>Proceed to Checkout</button>
  </div>
</aside>

<!-- QUICK VIEW MODAL -->
<div class="qv-modal" id="qvModal">
  <button class="qv-close" id="qvClose" aria-label="Close">✕</button>
  <div class="qv-body">
    <div class="qv-img" id="qvImg"></div>
    <div class="qv-info">
      <div class="qv-brand" id="qvBrand"></div>
      <div class="qv-name" id="qvName"></div>
      <div class="rating"><span class="stars">★★★★★</span><span class="rating-num" id="qvRating"></span></div>
      <div class="qv-price-row"><span class="qv-price-new" id="qvPriceNew"></span><span class="qv-price-old" id="qvPriceOld"></span></div>
      <p class="qv-desc">Handpicked for BazaarX's Grand Summer Sale. Ships in eco-friendly packaging with free returns within 7 days of delivery.</p>
      <div class="qv-qty-row">
        <span style="font-size:.85rem;font-weight:600;">Quantity</span>
        <div class="qv-qty-controls">
          <button class="qty-btn" id="qvMinus">−</button>
          <span id="qvQty">1</span>
          <button class="qty-btn" id="qvPlus">+</button>
        </div>
      </div>
      <button class="qv-add" id="qvAddBtn">Add to Cart</button>
    </div>
  </div>
</div>

<!-- TOASTS -->
<div class="toast-stack" id="toastStack"></div>

<!-- BACK TO TOP -->
<button class="back-top" id="backTop" aria-label="Back to top">↑</button>

<script>
(function(){
  /* ══ THEME TOGGLE ══ */
  const root = document.documentElement;
  const themeBtn = document.getElementById('themeToggle');
  const savedTheme = localStorage.getItem('bx_theme') || 'dark';
  root.setAttribute('data-theme', savedTheme);
  themeBtn.textContent = savedTheme === 'dark' ? '🌙' : '☀️';
  themeBtn.addEventListener('click', () => {
    const next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
    root.setAttribute('data-theme', next);
    localStorage.setItem('bx_theme', next);
    themeBtn.textContent = next === 'dark' ? '🌙' : '☀️';
  });

  /* ══ RANGOLI PETALS (generated) ══ */
  const petalGroup = document.getElementById('petals');
  if(petalGroup){
    let html = '';
    for(let i=0;i<12;i++){
      const ang = (i*30);
      html += `<ellipse cx="0" cy="-40" rx="8" ry="20" transform="rotate(${ang})" opacity="0.7"/>`;
    }
    petalGroup.innerHTML = html;
  }
  /* garland dots */
  ['garlandDots','garlandDots2'].forEach(id=>{
    const g = document.getElementById(id);
    if(!g) return;
    let dots = '';
    const colors = ['#FF9F1C','#C1272D','#FFC93C','#0B6E4F'];
    for(let x=20; x<1200; x+=40){
      const c = colors[(x/40)|0 % colors.length];
      dots += `<circle cx="${x}" cy="${2 + 15*Math.sin((x/120))}" r="4" fill="${colors[(Math.floor(x/40))%colors.length]}"/>`;
    }
    g.innerHTML = dots;
  });

  /* ══ COUNTDOWN TIMER ══ */
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

  /* ══ HERO DOTS ══ */
  const dots = document.querySelectorAll('.hero-dots .dot');
  let dotIdx = 0;
  setInterval(() => {
    dots[dotIdx].classList.remove('active');
    dotIdx = (dotIdx + 1) % dots.length;
    dots[dotIdx].classList.add('active');
  }, 3000);

  /* ══ PRODUCT DATA (mirrors JSP-rendered cards for cart/search/quickview) ══ */
  const cards = document.querySelectorAll('.product-card');
  const PRODUCTS = Array.from(cards).map(c => ({
    id: c.dataset.id,
    name: c.dataset.name,
    emoji: c.dataset.emoji,
    price: parseInt(c.dataset.price,10),
    old: parseInt(c.dataset.old,10),
    brand: c.dataset.brand,
    ratingText: c.querySelector('.rating-num') ? c.querySelector('.rating-num').textContent : '',
    el: c
  }));

  /* ══ TOASTS ══ */
  const toastStack = document.getElementById('toastStack');
  function toast(msg, icon){
    icon = icon || '✅';
    const t = document.createElement('div');
    t.className = 'toast';
    t.innerHTML = `<span>${icon}</span><span>${msg}</span>`;
    toastStack.appendChild(t);
    setTimeout(() => { t.style.opacity = '0'; t.style.transition='opacity .3s'; setTimeout(()=>t.remove(),300); }, 2200);
  }

  /* ══ CART STATE ══ */
  let cart = JSON.parse(localStorage.getItem('bx_cart') || '{}'); // {id: qty}
  const cartDrawer = document.getElementById('cartDrawer');
  const overlay = document.getElementById('overlay');
  const cartItemsEl = document.getElementById('cartItems');
  const cartSubtotalEl = document.getElementById('cartSubtotal');
  const cartBadge = document.getElementById('cartBadge');
  const checkoutBtn = document.getElementById('checkoutBtn');

  function saveCart(){ localStorage.setItem('bx_cart', JSON.stringify(cart)); }

  function cartCount(){ return Object.values(cart).reduce((a,b)=>a+b,0); }

  function renderCart(){
    const ids = Object.keys(cart).filter(id => cart[id] > 0);
    cartBadge.textContent = cartCount();
    cartBadge.classList.add('bump');
    setTimeout(()=>cartBadge.classList.remove('bump'), 220);

    if(ids.length === 0){
      cartItemsEl.innerHTML = `<div class="cart-empty"><div class="ce-emoji">🛒</div>Your cart is empty.<br/>Time to go treasure hunting!</div>`;
      cartSubtotalEl.textContent = '₹0';
      checkoutBtn.disabled = true;
      saveCart();
      return;
    }
    checkoutBtn.disabled = false;
    let subtotal = 0;
    cartItemsEl.innerHTML = ids.map(id => {
      const p = PRODUCTS.find(x => x.id === id);
      if(!p) return '';
      const qty = cart[id];
      subtotal += p.price * qty;
      return `
        <div class="cart-item" data-id="${id}">
          <div class="ci-emoji">${p.emoji}</div>
          <div class="ci-info">
            <div class="ci-name">${p.name}</div>
            <div class="ci-price">₹${p.price.toLocaleString('en-IN')}</div>
            <div class="ci-qty">
              <button class="qty-btn" data-act="dec">−</button>
              <span>${qty}</span>
              <button class="qty-btn" data-act="inc">+</button>
            </div>
          </div>
          <button class="ci-remove" data-act="remove" title="Remove">🗑️</button>
        </div>`;
    }).join('');
    cartSubtotalEl.textContent = '₹' + subtotal.toLocaleString('en-IN');
    saveCart();
  }

  function addToCart(id, qty){
    qty = qty || 1;
    cart[id] = (cart[id] || 0) + qty;
    renderCart();
    const p = PRODUCTS.find(x=>x.id===id);
    toast((p ? p.name : 'Item') + ' added to cart', '🛒');
  }

  cartItemsEl.addEventListener('click', (e) => {
    const btn = e.target.closest('button');
    if(!btn) return;
    const row = e.target.closest('.cart-item');
    const id = row.dataset.id;
    const act = btn.dataset.act;
    if(act === 'inc') cart[id]++;
    if(act === 'dec') { cart[id]--; if(cart[id] <= 0) delete cart[id]; }
    if(act === 'remove') delete cart[id];
    renderCart();
  });

  function openCart(){ cartDrawer.classList.add('open'); overlay.classList.add('open'); }
  function closeCart(){ cartDrawer.classList.remove('open'); overlay.classList.remove('open'); closeQV(); }

  document.getElementById('cartOpenBtn').addEventListener('click', openCart);
  const mtCart = document.getElementById('mtCart');
  if(mtCart) mtCart.addEventListener('click', openCart);
  document.getElementById('cartCloseBtn').addEventListener('click', closeCart);
  overlay.addEventListener('click', () => { closeCart(); });
  checkoutBtn.addEventListener('click', () => {
    toast('Order placed! Thank you for shopping with BazaarX 🎉', '🎊');
    cart = {}; renderCart(); closeCart();
  });

  /* ══ WISHLIST ══ */
  let wishlist = JSON.parse(localStorage.getItem('bx_wishlist') || '[]');
  const wishBadge = document.getElementById('wishBadge');
  function renderWishBadge(){ wishBadge.textContent = wishlist.length; }
  function syncWishHearts(){
    cards.forEach(c => {
      const btn = c.querySelector('.wishlist-btn');
      btn.textContent = wishlist.includes(c.dataset.id) ? '❤️' : '🤍';
    });
  }
  renderWishBadge(); syncWishHearts();

  document.querySelectorAll('.wishlist-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const card = btn.closest('.product-card');
      const id = card.dataset.id;
      const idx = wishlist.indexOf(id);
      if(idx > -1){ wishlist.splice(idx,1); btn.textContent = '🤍'; toast(card.dataset.name + ' removed from wishlist', '💔'); }
      else { wishlist.push(id); btn.textContent = '❤️'; toast(card.dataset.name + ' added to wishlist', '❤️'); }
      localStorage.setItem('bx_wishlist', JSON.stringify(wishlist));
      renderWishBadge();
    });
  });

  /* ══ ADD TO CART BUTTONS ══ */
  document.querySelectorAll('.add-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const card = btn.closest('.product-card');
      addToCart(card.dataset.id, 1);
      const original = btn.textContent;
      btn.textContent = '✓ Added';
      btn.style.background = 'var(--peacock-2)'; btn.style.color = '#fff';
      setTimeout(() => { btn.textContent = original; btn.style.background=''; btn.style.color=''; }, 1200);
    });
  });

  /* ══ QUICK VIEW ══ */
  const qvModal = document.getElementById('qvModal');
  let qvCurrentId = null, qvQty = 1;
  function openQV(id){
    const p = PRODUCTS.find(x => x.id === id);
    if(!p) return;
    qvCurrentId = id; qvQty = 1;
    document.getElementById('qvImg').textContent = p.emoji;
    document.getElementById('qvBrand').textContent = p.brand;
    document.getElementById('qvName').textContent = p.name;
    document.getElementById('qvRating').textContent = p.ratingText;
    document.getElementById('qvPriceNew').textContent = '₹' + p.price.toLocaleString('en-IN');
    document.getElementById('qvPriceOld').textContent = '₹' + p.old.toLocaleString('en-IN');
    document.getElementById('qvQty').textContent = qvQty;
    qvModal.classList.add('open'); overlay.classList.add('open');
  }
  function closeQV(){ qvModal.classList.remove('open'); if(!cartDrawer.classList.contains('open')) overlay.classList.remove('open'); }

  document.querySelectorAll('.quickview-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      openQV(btn.closest('.product-card').dataset.id);
    });
  });
  document.getElementById('qvClose').addEventListener('click', closeQV);
  document.getElementById('qvMinus').addEventListener('click', () => { qvQty = Math.max(1, qvQty-1); document.getElementById('qvQty').textContent = qvQty; });
  document.getElementById('qvPlus').addEventListener('click', () => { qvQty++; document.getElementById('qvQty').textContent = qvQty; });
  document.getElementById('qvAddBtn').addEventListener('click', () => { if(qvCurrentId){ addToCart(qvCurrentId, qvQty); closeQV(); } });
  overlay.addEventListener('click', closeQV);

  /* ══ SEARCH AUTOCOMPLETE ══ */
  const searchInput = document.getElementById('searchInput');
  const searchSuggest = document.getElementById('searchSuggest');
  function renderSuggest(query){
    if(!query){ searchSuggest.classList.remove('open'); return; }
    const q = query.toLowerCase();
    const matches = PRODUCTS.filter(p => p.name.toLowerCase().includes(q) || p.brand.toLowerCase().includes(q)).slice(0,6);
    if(matches.length === 0){
      searchSuggest.innerHTML = `<div class="search-empty">No products found for "${query}"</div>`;
    } else {
      searchSuggest.innerHTML = matches.map(p => `
        <div class="search-suggest-item" data-id="${p.id}">
          <span class="ss-emoji">${p.emoji}</span>
          <span>${p.name}</span>
          <span class="ss-price">₹${p.price.toLocaleString('en-IN')}</span>
        </div>`).join('');
    }
    searchSuggest.classList.add('open');
  }
  searchInput.addEventListener('input', (e) => renderSuggest(e.target.value.trim()));
  searchInput.addEventListener('focus', (e) => { if(e.target.value.trim()) renderSuggest(e.target.value.trim()); });
  document.addEventListener('click', (e) => { if(!e.target.closest('.search-wrap')) searchSuggest.classList.remove('open'); });
  searchSuggest.addEventListener('click', (e) => {
    const item = e.target.closest('.search-suggest-item');
    if(!item) return;
    searchSuggest.classList.remove('open');
    const id = item.dataset.id;
    const p = PRODUCTS.find(x => x.id === id);
    if(p && p.el) p.el.scrollIntoView({behavior:'smooth', block:'center'});
    openQV(id);
  });
  document.getElementById('searchBtn').addEventListener('click', () => renderSuggest(searchInput.value.trim()));

  /* ══ SORT / FILTER ══ */
  const filterBar = document.getElementById('filterBar');
  const bestsellerGrid = document.getElementById('bestsellerGrid');
  filterBar.addEventListener('click', (e) => {
    const chip = e.target.closest('.filter-chip');
    if(!chip) return;
    filterBar.querySelectorAll('.filter-chip').forEach(c => c.classList.remove('active'));
    chip.classList.add('active');
    const sort = chip.dataset.sort;
    const items = Array.from(bestsellerGrid.children);
    const withData = items.map(el => ({
      el,
      price: parseInt(el.dataset.price,10),
      old: parseInt(el.dataset.old,10),
      rating: parseFloat(el.querySelector('.rating-num').textContent)
    }));
    if(sort === 'priceLow') withData.sort((a,b)=>a.price-b.price);
    else if(sort === 'priceHigh') withData.sort((a,b)=>b.price-a.price);
    else if(sort === 'rating') withData.sort((a,b)=>b.rating-a.rating);
    else if(sort === 'discount') withData.sort((a,b)=> ((b.old-b.price)/b.old) - ((a.old-a.price)/a.old));
    withData.forEach(d => bestsellerGrid.appendChild(d.el));
    toast('Sorted by ' + chip.textContent, '↕️');
  });

  /* ══ TESTIMONIALS CAROUSEL ══ */
  const testiTrack = document.getElementById('testiTrack');
  const testiSlides = testiTrack.children;
  const testiDotsWrap = document.getElementById('testiDots');
  let testiIdx = 0;
  for(let i=0;i<testiSlides.length;i++){
    const d = document.createElement('div');
    d.className = 'testi-dot' + (i===0?' active':'');
    d.addEventListener('click', () => showTesti(i));
    testiDotsWrap.appendChild(d);
  }
  function showTesti(i){
    testiIdx = i;
    testiTrack.style.transform = `translateX(-${i*100}%)`;
    Array.from(testiDotsWrap.children).forEach((d,j)=>d.classList.toggle('active', j===i));
  }
  setInterval(() => showTesti((testiIdx+1) % testiSlides.length), 4500);

  /* ══ NEWSLETTER ══ */
  document.getElementById('newsForm').addEventListener('submit', (e) => {
    e.preventDefault();
    const email = document.getElementById('newsEmail').value;
    toast('Subscribed! Watch your inbox, ' + email.split('@')[0], '🪔');
    e.target.reset();
  });

  /* ══ BACK TO TOP ══ */
  const backTop = document.getElementById('backTop');
  window.addEventListener('scroll', () => {
    backTop.classList.toggle('show', window.scrollY > 500);
  });
  backTop.addEventListener('click', () => window.scrollTo({top:0, behavior:'smooth'}));

  /* ══ INIT ══ */
  renderCart();
})();
</script>
</body>
</html>

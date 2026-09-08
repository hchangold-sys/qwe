<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>단벌 — 한 벌만 만듭니다</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:ital,opsz,wght@0,6..96,400;0,6..96,500;0,6..96,600;1,6..96,400&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<style>
  :root{
    --white:#FFFFFF;
    --off:#F6F6F4;
    --black:#0D0D0D;
    --grey:#6E6E6B;
    --line: rgba(13,13,13,0.14);
  }
  *{box-sizing:border-box;}
  html{scroll-behavior:smooth;}
  body{
    margin:0; background:var(--white); color:var(--black);
    font-family:'Inter', sans-serif; font-size:16px; line-height:1.65;
  }
  ::selection{background:var(--black); color:var(--white);}
  @media (prefers-reduced-motion: reduce){
    *{animation-duration:.001ms !important; transition-duration:.001ms !important;}
  }
  h1,h2,h3{font-family:'Bodoni Moda', serif; margin:0; font-weight:500;}
  .wrap{max-width:1180px; margin:0 auto; padding:0 40px;}

  /* -------- Header -------- */
  header{
    position:fixed; top:0; left:0; right:0; z-index:20;
    display:flex; align-items:center; justify-content:space-between;
    padding:26px 40px; mix-blend-mode:difference;
  }
  .mark{ color:#fff; font-family:'Bodoni Moda', serif; font-size:19px; letter-spacing:0.04em; }
  .nav-links{ display:flex; gap:26px; font-size:13px; color:#fff; }
  .nav-links a{ text-decoration:none; color:#fff; opacity:.85; }
  .nav-links a:hover{ opacity:1; }

  /* -------- Hero -------- */
  .hero{
    position:relative;
    min-height:100vh; background:var(--black); color:var(--white);
    display:flex; flex-direction:column; justify-content:space-between;
    padding:120px 40px 48px;
    overflow:hidden;
  }
  .hero-top{
    display:flex; justify-content:space-between; font-size:13px; color:#b9b9b6;
  }
  .hero-center{
    flex:1; display:flex; align-items:center; justify-content:center;
    padding:24px 0;
  }
  .coat{
    width:min(38vw, 380px);
    opacity:0; transform:translateY(18px) scale(.98);
    animation: rise 1000ms cubic-bezier(.2,.8,.25,1) 260ms forwards;
  }
  @keyframes rise{
    to{ opacity:1; transform:translateY(0) scale(1); }
  }
  @media (prefers-reduced-motion: reduce){
    .coat{ animation:none; opacity:1; transform:none; }
  }
  .hero-bottom{
    display:grid; grid-template-columns: 1.3fr 1fr; gap:32px; align-items:end;
    border-top:1px solid rgba(255,255,255,0.16); padding-top:28px;
  }
  .hero-bottom h1{
    font-size:clamp(38px, 5.4vw, 68px); line-height:1.02; letter-spacing:-0.01em;
  }
  .hero-bottom .sub{ margin-top:14px; color:#c7c7c4; font-size:15px; max-width:40ch; }
  .hero-price{ text-align:right; }
  .hero-price .amount{ font-family:'Bodoni Moda', serif; font-size:28px; }
  .hero-price .note{ font-size:12px; color:#9a9a97; margin-top:6px; }

  /* -------- Statement section -------- */
  .statement{
    padding:150px 40px; text-align:center;
  }
  .statement p{
    font-family:'Bodoni Moda', serif; font-style:italic; font-weight:400;
    font-size:clamp(24px, 3.4vw, 38px); line-height:1.45;
    max-width:20ch; margin:0 auto; color:var(--black);
  }

  /* -------- Detail / spec sheet -------- */
  .details{ background:var(--off); padding:100px 40px; }
  .details-head{
    display:flex; justify-content:space-between; align-items:baseline;
    border-bottom:1px solid var(--line); padding-bottom:22px; margin-bottom:0;
  }
  .details-head h2{ font-size:clamp(26px,3vw,34px); }
  .details-head span{ font-size:13px; color:var(--grey); }

  .spec-row{
    display:grid; grid-template-columns: 220px 1fr;
    border-bottom:1px solid var(--line);
    padding:26px 0;
    gap:24px;
  }
  .spec-row .k{ font-size:13px; color:var(--grey); }
  .spec-row .v{ font-size:16px; max-width:56ch; }

  /* -------- Fit table -------- */
  .fit{ padding:100px 40px; }
  .fit-head{ margin-bottom:44px; }
  .fit-head h2{ font-size:clamp(26px,3vw,34px); }
  .fit-head p{ margin-top:14px; color:var(--grey); font-size:15px; max-width:52ch; }

  table.sizing{ width:100%; border-collapse:collapse; font-size:14px; }
  table.sizing th, table.sizing td{
    text-align:left; padding:14px 12px; border-bottom:1px solid var(--line);
  }
  table.sizing th{ color:var(--grey); font-weight:500; }
  table.sizing tr:first-child th{ border-bottom:1px solid var(--black); }

  /* -------- CTA -------- */
  .cta{
    background:var(--black); color:var(--white);
    padding:140px 40px; text-align:center;
  }
  .cta h2{
    font-size:clamp(32px,5vw,56px); max-width:16ch; margin:0 auto; line-height:1.06;
  }
  .cta p{ color:#b9b9b6; margin-top:20px; font-size:15px; }
  .cta-form{
    margin-top:44px; display:flex; justify-content:center; gap:0;
    max-width:420px; margin-left:auto; margin-right:auto;
  }
  .cta-form input{
    flex:1; background:transparent; border:1px solid rgba(255,255,255,0.4);
    border-right:none; padding:14px 16px; color:#fff; font-size:14px;
    font-family:'Inter', sans-serif;
  }
  .cta-form input::placeholder{ color:#8a8a87; }
  .cta-form input:focus{ outline:none; border-color:#fff; }
  .cta-form button{
    background:#fff; color:var(--black); border:1px solid #fff;
    padding:0 24px; font-size:14px; font-weight:500; cursor:pointer;
    font-family:'Inter', sans-serif;
    transition: background .2s ease, color .2s ease;
  }
  .cta-form button:hover{ background:transparent; color:#fff; }

  /* -------- Footer -------- */
  footer{ padding:32px 40px 44px; }
  .footer-inner{
    display:flex; justify-content:space-between; font-size:12px; color:var(--grey);
    border-top:1px solid var(--line); padding-top:20px;
  }

  :focus-visible{ outline:2px solid var(--black); outline-offset:3px; }

  @media (max-width: 780px){
    header{ padding:20px; }
    .hero{ padding:96px 20px 32px; }
    .hero-bottom{ grid-template-columns:1fr; gap:20px; }
    .hero-price{ text-align:left; }
    .coat{ width:60vw; }
    .statement{ padding:96px 20px; }
    .details, .fit{ padding:64px 20px; }
    .spec-row{ grid-template-columns:1fr; gap:8px; }
    .cta{ padding:96px 20px; }
    .nav-links{ display:none; }
    .wrap{ padding:0 20px; }
    .footer-inner{ flex-direction:column; gap:8px; }
  }
</style>
</head>
<body>

<header>
  <div class="mark">단벌</div>
  <nav class="nav-links">
    <a href="#details">디테일</a>
    <a href="#fit">사이즈</a>
    <a href="#cta">예약하기</a>
  </nav>
</header>

<section class="hero">
  <div class="hero-top">
    <span>2025 — SINGLE PIECE</span>
    <span>SEOUL</span>
  </div>

  <div class="hero-center">
    <svg class="coat" viewBox="0 0 400 560" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="울 오버코트 라인 일러스트">
      <g fill="none" stroke="#FFFFFF" stroke-width="1.4" stroke-linejoin="round" stroke-linecap="round">
        <!-- collar / lapels -->
        <path d="M150,36 L118,64 L98,120"/>
        <path d="M250,36 L282,64 L302,120"/>
        <path d="M150,36 L200,132 L250,36"/>
        <!-- shoulders to sleeves -->
        <path d="M118,64 L70,150 L64,330 L92,338 L112,180"/>
        <path d="M282,64 L330,150 L336,330 L308,338 L288,180"/>
        <!-- body sides -->
        <path d="M98,120 L120,180 L118,500 L282,500 L282,180 L302,120"/>
        <!-- hem line -->
        <path d="M118,500 L282,500"/>
        <!-- center front closure -->
        <path d="M200,132 L200,500"/>
        <!-- belt -->
        <path d="M118,300 L282,300" stroke-width="1"/>
        <!-- buttons -->
        <circle cx="200" cy="200" r="2.4" fill="#FFFFFF" stroke="none"/>
        <circle cx="200" cy="250" r="2.4" fill="#FFFFFF" stroke="none"/>
        <circle cx="200" cy="360" r="2.4" fill="#FFFFFF" stroke="none"/>
        <circle cx="200" cy="410" r="2.4" fill="#FFFFFF" stroke="none"/>
        <!-- pockets -->
        <path d="M132,340 L172,340" stroke-width="1"/>
        <path d="M228,340 L268,340" stroke-width="1"/>
      </g>
    </svg>
  </div>

  <div class="hero-bottom">
    <div>
      <h1>단벌 오버코트</h1>
      <p class="sub">단벌은 한 벌만 만듭니다. 계절마다 고치고 다듬어, 결국 하나의 완성된 형태로 남기기 위해서입니다.</p>
    </div>
    <div class="hero-price">
      <div class="amount">₩ 480,000</div>
      <div class="note">사전 예약 · 10월 출고</div>
    </div>
  </div>
</section>

<section class="statement">
  <p>“두 벌을 만들 시간에,<br>한 벌을 제대로 만듭니다.”</p>
</section>

<section class="details" id="details">
  <div class="wrap">
    <div class="details-head">
      <h2>디테일</h2>
      <span>ONE COAT, NO VARIANTS</span>
    </div>

    <div class="spec-row">
      <div class="k">원단</div>
      <div class="v">울 100%, 이탈리아 Reda 방적 원단. 320g/m² 밀도로 겨울 한 계절을 버티는 무게감.</div>
    </div>
    <div class="spec-row">
      <div class="k">색상</div>
      <div class="v">차콜 블랙 단일 색상. 컬러 옵션을 두지 않고, 이 색 하나에만 원단과 염색을 맞췄습니다.</div>
    </div>
    <div class="spec-row">
      <div class="k">안감</div>
      <div class="v">쿠프로 안감, 어깨선은 하프 카나바스 방식으로 손바느질 처리.</div>
    </div>
    <div class="spec-row">
      <div class="k">단추</div>
      <div class="v">물소뿔 단추 4개, 이중 스티치 고정.</div>
    </div>
    <div class="spec-row">
      <div class="k">제작</div>
      <div class="v">서울 소재 작업실에서 소량 제작. 계절당 120벌 한정, 재입고 없음.</div>
    </div>
  </div>
</section>

<section class="fit" id="fit">
  <div class="wrap">
    <div class="fit-head">
      <h2>사이즈</h2>
      <p>단벌은 하나의 실루엣만 만들지만, 사이즈는 다섯 단계로 나눕니다. 아래 수치를 어깨너비 기준으로 확인해주세요.</p>
    </div>
    <table class="sizing">
      <tr><th>사이즈</th><th>어깨너비</th><th>가슴둘레</th><th>총장</th></tr>
      <tr><td>S</td><td>44cm</td><td>106cm</td><td>102cm</td></tr>
      <tr><td>M</td><td>46cm</td><td>112cm</td><td>105cm</td></tr>
      <tr><td>L</td><td>48cm</td><td>118cm</td><td>108cm</td></tr>
      <tr><td>XL</td><td>50cm</td><td>124cm</td><td>111cm</td></tr>
      <tr><td>XXL</td><td>52cm</td><td>130cm</td><td>114cm</td></tr>
    </table>
  </div>
</section>

<section class="cta" id="cta">
  <div class="wrap">
    <h2>다음 제작에 이름을 올려두세요.</h2>
    <p>120벌이 마감되면 다음 계절까지 기다려야 합니다. 이메일을 남기면 예약 오픈 24시간 전에 먼저 알려드려요.</p>
    <form class="cta-form" onsubmit="event.preventDefault(); this.querySelector('button').textContent='등록됨';">
      <input type="email" placeholder="이메일 주소" required>
      <button type="submit">알림 받기</button>
    </form>
  </div>
</section>

<footer>
  <div class="wrap footer-inner">
    <div>단벌 · 서울</div>
    <div>문의 · hello@danbeol.example</div>
  </div>
</footer>

</body>
</html>

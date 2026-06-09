<!DOCTYPE html>
<html lang="sq">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="CPictures">
<meta name="theme-color" content="#0A0A0A">
<title>CPictures</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&family=DM+Mono:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root{
  --g:#00C48C;--gd:#009966;--gl:rgba(0,196,140,0.12);
  --a:#F5A623;--al:rgba(245,166,35,0.12);--ad:#C47D00;
  --r:#FF4D4D;--rl:rgba(255,77,77,0.12);--rd:#CC2200;
  --b:#4D9EFF;--bl:rgba(77,158,255,0.12);--bd:#1A6FCC;
  --pu:#A855F7;--pul:rgba(168,85,247,0.12);
  --bg:#0A0A0A;--s1:#141414;--s2:#1E1E1E;--s3:#282828;
  --br:rgba(255,255,255,0.07);--br2:rgba(255,255,255,0.12);
  --t1:#F0F0F0;--t2:#888;--t3:#555;
  --r1:16px;--r2:12px;--r3:8px;
  --ff:'Syne',sans-serif;--fb:'DM Sans',sans-serif;--fm:'DM Mono',monospace;
}
*{box-sizing:border-box;margin:0;padding:0;-webkit-tap-highlight-color:transparent;}
html,body{height:100%;overflow:hidden;background:var(--bg);}
body{font-family:var(--fb);color:var(--t1);display:flex;flex-direction:column;max-width:430px;margin:0 auto;}

.topbar{background:var(--s1);padding:14px 16px 10px;display:flex;align-items:center;gap:10px;border-bottom:1px solid var(--br);flex-shrink:0;padding-top:max(14px,env(safe-area-inset-top));}
.logo-icon{width:34px;height:34px;border-radius:10px;background:linear-gradient(135deg,var(--g),var(--gd));display:flex;align-items:center;justify-content:center;font-size:16px;color:#000;font-family:var(--ff);font-weight:800;flex-shrink:0;}
.logo-text{font-family:var(--ff);font-weight:800;font-size:17px;color:var(--t1);}
.logo-text span{color:var(--g);}
.topbar-sub{font-size:11px;color:var(--t3);}
.bell-btn{width:36px;height:36px;border-radius:50%;background:var(--s2);border:none;cursor:pointer;display:flex;align-items:center;justify-content:center;color:var(--t2);font-size:15px;position:relative;flex-shrink:0;}
.nbadge{position:absolute;top:3px;right:3px;width:14px;height:14px;border-radius:50%;background:var(--r);color:#fff;font-size:9px;font-weight:700;display:flex;align-items:center;justify-content:center;border:2px solid var(--s1);}

.top-nav{background:var(--s1);border-bottom:1px solid var(--br);display:flex;overflow-x:auto;flex-shrink:0;scrollbar-width:none;}
.top-nav::-webkit-scrollbar{display:none;}
.tnav-item{flex-shrink:0;display:flex;flex-direction:column;align-items:center;gap:2px;cursor:pointer;padding:8px 14px 6px;border:none;background:none;color:var(--t3);font-size:10px;font-family:var(--fb);position:relative;white-space:nowrap;transition:color 0.15s;}
.tnav-item i{font-size:18px;}
.tnav-item.active{color:var(--g);}
.tnav-item.active::after{content:'';position:absolute;bottom:0;left:20%;right:20%;height:2px;background:var(--g);border-radius:2px 2px 0 0;}
.tnav-dot{position:absolute;top:6px;right:10px;width:6px;height:6px;border-radius:50%;background:var(--r);border:1.5px solid var(--s1);}

.scroll-area{flex:1;overflow-y:auto;-webkit-overflow-scrolling:touch;}
.screen{display:none;padding:14px;padding-bottom:24px;}
.screen.active{display:block;animation:fadeIn 0.2s ease;}
@keyframes fadeIn{from{opacity:0;transform:translateY(5px)}to{opacity:1;transform:translateY(0)}}

.stat-grid{display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-bottom:14px;}
.stat-card{background:var(--s1);border-radius:var(--r1);padding:14px;border:1px solid var(--br);position:relative;overflow:hidden;}
.stat-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;background:var(--accent,var(--g));}
.stat-label{font-size:10px;color:var(--t3);margin-bottom:8px;font-weight:500;text-transform:uppercase;letter-spacing:0.5px;}
.stat-val{font-size:22px;font-weight:700;font-family:var(--fm);color:var(--accent,var(--g));}
.stat-sub{font-size:10px;color:var(--t3);margin-top:4px;}

.sec-header{display:flex;align-items:center;justify-content:space-between;margin:16px 0 10px;}
.sec-title{font-size:11px;font-weight:700;color:var(--t3);text-transform:uppercase;letter-spacing:0.8px;font-family:var(--ff);}
.add-btn{width:32px;height:32px;border-radius:50%;background:var(--g);border:none;color:#000;font-size:18px;cursor:pointer;display:flex;align-items:center;justify-content:center;font-weight:700;}

.card{background:var(--s1);border-radius:var(--r1);border:1px solid var(--br);margin-bottom:8px;padding:12px 14px;display:flex;align-items:center;gap:12px;cursor:pointer;}
.card:active{opacity:0.8;}
.card-icon{width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:16px;flex-shrink:0;}
.card-body{flex:1;min-width:0;}
.card-title{font-size:14px;font-weight:500;color:var(--t1);white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.card-sub{font-size:11px;color:var(--t2);margin-top:2px;}
.card-right{text-align:right;flex-shrink:0;}
.card-price{font-size:13px;font-weight:600;color:var(--t1);margin-top:4px;font-family:var(--fm);}

.badge{display:inline-block;font-size:10px;font-weight:600;padding:3px 8px;border-radius:20px;font-family:var(--ff);}
.badge.green{background:var(--gl);color:var(--g);}
.badge.amber{background:var(--al);color:var(--a);}
.badge.red{background:var(--rl);color:var(--r);}
.badge.blue{background:var(--bl);color:var(--b);}
.badge.pur{background:var(--pul);color:var(--pu);}
.badge.gray{background:var(--s3);color:var(--t2);}

.inv-row{background:var(--s1);border-radius:var(--r1);border:1px solid var(--br);padding:12px 14px;margin-bottom:8px;display:flex;align-items:center;gap:12px;}
.prog-wrap{flex:1;}
.prog-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;}
.prog-name{font-size:13px;font-weight:500;color:var(--t1);}
.prog-qty{font-size:12px;font-weight:600;font-family:var(--fm);}
.prog-bar{height:4px;border-radius:2px;background:var(--s3);overflow:hidden;}
.prog-fill{height:100%;border-radius:2px;}
.prog-warn{font-size:10px;margin-top:4px;font-weight:500;}

.avatar{width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:700;flex-shrink:0;font-family:var(--ff);}
.chart-wrap{background:var(--s1);border-radius:var(--r1);border:1px solid var(--br);padding:14px;margin-bottom:10px;}
.chart-row{display:flex;align-items:center;gap:10px;margin-bottom:9px;}
.chart-row:last-child{margin-bottom:0;}
.chart-lbl{font-size:11px;color:var(--t2);width:58px;flex-shrink:0;}
.chart-bg{flex:1;height:14px;background:var(--s3);border-radius:3px;overflow:hidden;}
.chart-fill{height:100%;border-radius:3px;}
.chart-num{font-size:11px;font-weight:600;color:var(--t1);width:60px;text-align:right;font-family:var(--fm);}

.notif-item{background:var(--s1);border-radius:var(--r1);border:1px solid var(--br);padding:12px 14px;margin-bottom:8px;display:flex;gap:12px;}
.notif-pip{width:7px;height:7px;border-radius:50%;flex-shrink:0;margin-top:5px;}

.filter-row{display:flex;gap:8px;margin-bottom:12px;overflow-x:auto;scrollbar-width:none;padding-bottom:2px;}
.filter-row::-webkit-scrollbar{display:none;}
.filter-chip{flex-shrink:0;padding:6px 14px;border-radius:20px;border:1px solid var(--br);background:var(--s1);color:var(--t2);font-size:12px;font-family:var(--fb);cursor:pointer;white-space:nowrap;}
.filter-chip.active{background:var(--g);color:#000;border-color:var(--g);font-weight:600;}

.date-row{display:flex;gap:8px;margin-bottom:12px;}
.date-field{flex:1;background:var(--s1);border:1px solid var(--br);border-radius:var(--r3);padding:8px 10px;font-size:12px;color:var(--t1);font-family:var(--fb);}
.date-field:focus{outline:none;border-color:var(--g);}
.date-field::-webkit-calendar-picker-indicator{filter:invert(1);opacity:0.5;}

.client-card{background:var(--s1);border-radius:var(--r1);border:1px solid var(--br);margin-bottom:8px;padding:12px 14px;}
.client-header{display:flex;align-items:center;gap:10px;margin-bottom:8px;}
.client-name{font-size:14px;font-weight:600;color:var(--t1);font-family:var(--ff);flex:1;}
.client-debt{font-size:15px;font-weight:700;font-family:var(--fm);}
.pay-btn{padding:6px 12px;border-radius:20px;border:none;font-size:11px;font-weight:600;cursor:pointer;font-family:var(--fb);}
.pay-btn.mark-paid{background:var(--gl);color:var(--g);}
.pay-btn.mark-unpaid{background:var(--rl);color:var(--r);}

.sum-box{background:var(--s2);border-radius:var(--r2);padding:12px 14px;margin-bottom:12px;display:flex;justify-content:space-between;align-items:center;}
.sum-label{font-size:12px;color:var(--t2);}
.sum-val{font-size:16px;font-weight:700;font-family:var(--fm);}

.modal-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.7);z-index:100;align-items:flex-end;justify-content:center;}
.modal-overlay.open{display:flex;}
.modal{background:var(--s1);border-radius:22px 22px 0 0;padding:20px 18px;width:100%;max-width:430px;max-height:88vh;overflow-y:auto;border-top:1px solid var(--br2);}
.modal-handle{width:36px;height:3px;border-radius:2px;background:var(--s3);margin:0 auto 16px;}
.modal-title{font-size:17px;font-weight:700;color:var(--t1);margin-bottom:16px;font-family:var(--ff);}
.field{margin-bottom:12px;}
.field label{font-size:10px;font-weight:600;color:var(--t3);display:block;margin-bottom:5px;text-transform:uppercase;letter-spacing:0.5px;}
.field input,.field select,.field textarea{width:100%;padding:10px 12px;border-radius:var(--r3);border:1px solid var(--br2);font-size:14px;font-family:var(--fb);background:var(--s2);color:var(--t1);outline:none;}
.field input:focus,.field select:focus{border-color:var(--g);}
.field select option{background:var(--s2);}
.btn-row{display:flex;gap:8px;margin-top:16px;}
.btn{flex:1;padding:12px;border-radius:var(--r3);border:1px solid var(--br);font-size:14px;font-weight:600;font-family:var(--ff);cursor:pointer;}
.btn.cancel{background:var(--s2);color:var(--t2);}
.btn.primary{background:var(--g);color:#000;border-color:var(--g);}
.btn.danger{background:var(--rl);color:var(--r);border-color:var(--r);}
.status-options{display:flex;flex-direction:column;gap:8px;}
.status-opt{padding:12px 14px;border-radius:var(--r3);border:1px solid;font-size:14px;font-weight:600;cursor:pointer;display:flex;align-items:center;gap:10px;font-family:var(--ff);background:transparent;}

.toast{position:fixed;top:max(80px,env(safe-area-inset-top,0px) + 70px);left:50%;transform:translateX(-50%) translateY(-8px);background:var(--s3);color:var(--t1);padding:10px 18px;border-radius:30px;font-size:13px;font-weight:500;z-index:200;opacity:0;transition:all 0.25s;pointer-events:none;white-space:nowrap;border:1px solid var(--br2);}
.toast.show{opacity:1;transform:translateX(-50%) translateY(0);}
.empty{text-align:center;padding:36px 20px;color:var(--t3);}
.empty i{font-size:36px;margin-bottom:10px;display:block;}

/* LOADING */
.loading-screen{position:fixed;inset:0;background:var(--bg);display:flex;flex-direction:column;align-items:center;justify-content:center;z-index:999;}
.loading-logo{font-family:var(--ff);font-size:32px;font-weight:800;color:var(--t1);margin-bottom:16px;}
.loading-logo span{color:var(--g);}
.loading-spinner{width:32px;height:32px;border:3px solid var(--s3);border-top-color:var(--g);border-radius:50%;animation:spin 0.8s linear infinite;}
@keyframes spin{to{transform:rotate(360deg)}}
.loading-text{font-size:12px;color:var(--t3);margin-top:12px;}

/* LOGIN */
.login-screen{position:fixed;inset:0;background:var(--bg);display:none;flex-direction:column;align-items:center;justify-content:center;padding:30px;z-index:998;}
.login-screen.show{display:flex;}
.login-logo{font-family:var(--ff);font-size:40px;font-weight:800;color:var(--t1);margin-bottom:8px;}
.login-logo span{color:var(--g);}
.login-sub{font-size:14px;color:var(--t2);margin-bottom:40px;}
.login-field{width:100%;margin-bottom:12px;}
.login-field input{width:100%;padding:14px 16px;border-radius:var(--r2);border:1px solid var(--br2);font-size:15px;font-family:var(--fb);background:var(--s2);color:var(--t1);outline:none;}
.login-field input:focus{border-color:var(--g);}
.login-btn{width:100%;padding:14px;border-radius:var(--r2);border:none;font-size:16px;font-weight:700;font-family:var(--ff);cursor:pointer;background:var(--g);color:#000;margin-top:8px;}
.login-err{color:var(--r);font-size:12px;text-align:center;margin-top:10px;}
.role-chip{display:inline-flex;align-items:center;gap:4px;padding:3px 10px;border-radius:20px;font-size:10px;font-weight:600;font-family:var(--ff);}
.role-chip.admin{background:var(--pul);color:var(--pu);}
.role-chip.worker{background:var(--s3);color:var(--t2);}
</style>
</head>
<body>

<!-- LOADING -->
<div class="loading-screen" id="loading-screen">
  <div class="loading-logo">C<span>Pictures</span></div>
  <div class="loading-spinner"></div>
  <div class="loading-text">Duke ngarkuar...</div>
</div>

<!-- LOGIN -->
<div class="login-screen" id="login-screen">
  <div class="login-logo">C<span>Pictures</span></div>
  <div class="login-sub">Hyr në llogarinë tënde</div>
  <div class="login-field"><input type="text" id="l-pin" placeholder="Emri ose PIN-i juaj" maxlength="20"></div>
  <button class="login-btn" onclick="doLogin()">Hyr →</button>
  <div class="login-err" id="login-err"></div>
</div>

<!-- APP -->
<div id="app-wrap" style="display:none;flex-direction:column;height:100%;">

<div class="topbar">
  <div class="logo-icon">C</div>
  <div style="flex:1;margin-left:8px;">
    <div class="logo-text">C<span>Pictures</span></div>
    <div class="topbar-sub" id="user-label">Duke ngarkuar...</div>
  </div>
  <button class="bell-btn" onclick="switchTo('s-notif','tn-notif');markRead()">
    <i class="fa-solid fa-bell"></i>
    <div class="nbadge" id="nbadge" style="display:none;"></div>
  </button>
  <button onclick="doLogout()" style="width:32px;height:32px;border-radius:50%;background:var(--s2);border:none;cursor:pointer;color:var(--t2);font-size:13px;margin-left:6px;"><i class="fa-solid fa-right-from-bracket"></i></button>
</div>

<nav class="top-nav">
  <button class="tnav-item active" id="tn-home" onclick="switchTo('s-home','tn-home')"><i class="fa-solid fa-house"></i>Ballina</button>
  <button class="tnav-item" id="tn-orders" onclick="switchTo('s-orders','tn-orders')"><i class="fa-solid fa-clipboard-list"></i>Porositë</button>
  <button class="tnav-item" id="tn-inv" onclick="switchTo('s-inv','tn-inv')"><i class="fa-solid fa-box"></i>Stoku</button>
  <button class="tnav-item" id="tn-workers" onclick="switchTo('s-workers','tn-workers')"><i class="fa-solid fa-users"></i>Punëtorët</button>
  <button class="tnav-item" id="tn-clients" onclick="switchTo('s-clients','tn-clients')"><i class="fa-solid fa-address-book"></i>Klientët</button>
  <button class="tnav-item" id="tn-history" onclick="switchTo('s-history','tn-history')"><i class="fa-solid fa-clock-rotate-left"></i>Historiku</button>
  <button class="tnav-item" id="tn-notif" onclick="switchTo('s-notif','tn-notif');markRead()">
    <i class="fa-solid fa-bell"></i>Njoftime
    <div class="tnav-dot" id="nav-dot" style="display:none;"></div>
  </button>
</nav>

<div class="scroll-area">

<div id="s-home" class="screen active">
  <div class="stat-grid">
    <div class="stat-card" id="card-fit" style="--accent:var(--g);display:none;">
      <div class="stat-label">Fitim sot</div>
      <div class="stat-val" id="st-fit">€ 0</div>
      <div class="stat-sub">Vetëm admin</div>
    </div>
    <div class="stat-card" id="card-mua" style="--accent:var(--pu);display:none;">
      <div class="stat-label">Fitim muaji</div>
      <div class="stat-val" id="st-mua">€ 0</div>
      <div class="stat-sub">Vetëm admin</div>
    </div>
    <div class="stat-card" style="--accent:var(--a);">
      <div class="stat-label">Porosi aktive</div>
      <div class="stat-val" id="st-por">0</div>
    </div>
    <div class="stat-card" style="--accent:var(--r);">
      <div class="stat-label">Borxhe aktive</div>
      <div class="stat-val" id="st-bor">0</div>
      <div class="stat-sub" style="cursor:pointer;color:var(--b);" onclick="switchTo('s-clients','tn-clients')">Shiko →</div>
    </div>
  </div>
  <div class="sec-header"><span class="sec-title">Porositë e fundit</span></div>
  <div id="home-list"></div>
</div>

<div id="s-orders" class="screen">
  <div class="sec-header">
    <span class="sec-title">Porositë</span>
    <button class="add-btn" onclick="openModal('m-order')"><i class="fa-solid fa-plus"></i></button>
  </div>
  <div class="filter-row">
    <button class="filter-chip active" onclick="filterOrders('all',this)">Të gjitha</button>
    <button class="filter-chip" onclick="filterOrders('Në punë',this)">Në punë</button>
    <button class="filter-chip" onclick="filterOrders('Gati',this)">Gati</button>
    <button class="filter-chip" onclick="filterOrders('Vonuar',this)">Vonuar</button>
  </div>
  <div id="orders-list"></div>
</div>

<div id="s-inv" class="screen">
  <div class="sec-header">
    <span class="sec-title">Stoku</span>
    <button class="add-btn" onclick="openModal('m-produkt')"><i class="fa-solid fa-plus"></i></button>
  </div>
  <div class="filter-row">
    <button class="filter-chip active" onclick="filterInv('all',this)">Të gjitha</button>
    <button class="filter-chip" onclick="filterInv('Letër',this)">Letër</button>
    <button class="filter-chip" onclick="filterInv('Bojë',this)">Bojë</button>
    <button class="filter-chip" onclick="filterInv('Vinyl',this)">Vinyl</button>
    <button class="filter-chip" onclick="filterInv('3D',this)">3D</button>
    <button class="filter-chip" onclick="filterInv('Aluminium',this)">Aluminium</button>
    <button class="filter-chip" onclick="filterInv('Tjetër',this)">Tjetër</button>
  </div>
  <div id="inv-list"></div>
</div>

<div id="s-workers" class="screen">
  <div class="sec-header">
    <span class="sec-title">Punëtorët</span>
    <button class="add-btn" id="add-worker-btn" onclick="openModal('m-worker')"><i class="fa-solid fa-plus"></i></button>
  </div>
  <div id="workers-list"></div>
  <div class="sec-header"><span class="sec-title">Punë të kryera / mbetur</span></div>
  <div class="chart-wrap" id="wchart"></div>
</div>

<div id="s-clients" class="screen">
  <div class="sec-header">
    <span class="sec-title">Klientët & Borxhet</span>
    <button class="add-btn" onclick="openModal('m-client')"><i class="fa-solid fa-plus"></i></button>
  </div>
  <div class="filter-row">
    <button class="filter-chip active" onclick="filterClients('all',this)">Të gjithë</button>
    <button class="filter-chip" onclick="filterClients('unpaid',this)">Pa paguar</button>
    <button class="filter-chip" onclick="filterClients('paid',this)">Paguar</button>
  </div>
  <div class="sum-box" id="debt-sum" style="display:none;">
    <span class="sum-label">Borxh total</span>
    <span class="sum-val" id="total-debt" style="color:var(--r);">€ 0</span>
  </div>
  <div id="clients-list"></div>
</div>

<div id="s-history" class="screen">
  <div class="sec-header"><span class="sec-title">Historiku i punëve</span></div>
  <div class="date-row">
    <input type="date" class="date-field" id="h-from" onchange="renderHistory()">
    <input type="date" class="date-field" id="h-to" onchange="renderHistory()">
  </div>
  <div class="filter-row">
    <button class="filter-chip active" onclick="filterHistory('all',this)">Të gjitha</button>
    <button class="filter-chip" onclick="filterHistory('Kryer',this)">Kryer</button>
    <button class="filter-chip" onclick="filterHistory('Vonuar',this)">Vonuar</button>
    <button class="filter-chip" onclick="filterHistory('Gati',this)">Gati</button>
  </div>
  <div class="sum-box" id="hist-sum" style="display:none;">
    <span class="sum-label">Totali i periudhës</span>
    <span class="sum-val" id="hist-total" style="color:var(--g);">€ 0</span>
  </div>
  <div id="history-list"></div>
</div>

<div id="s-notif" class="screen">
  <div class="sec-header">
    <span class="sec-title">Njoftimet</span>
    <span style="font-size:12px;color:var(--b);cursor:pointer;font-weight:600;" onclick="clearNotifs()">Pastro</span>
  </div>
  <div id="notif-list"></div>
</div>

</div>
</div><!-- app-wrap -->

<!-- MODALS -->
<div class="modal-overlay" id="m-order" onclick="bgClose(event,'m-order')">
  <div class="modal">
    <div class="modal-handle"></div>
    <div class="modal-title">Porosi e re</div>
    <div class="field"><label>Klienti</label><input id="o-c" type="text" placeholder="Emri i klientit" list="clients-dl"><datalist id="clients-dl"></datalist></div>
    <div class="field"><label>Produkti / Shërbimi</label><input id="o-p" type="text" placeholder="p.sh. Reklamë 3D, Alukonbond, Banner..."></div>
    <div class="field"><label>Sasia / Përshkrimi</label><input id="o-q" type="text" placeholder="p.sh. 500 copë / 10 m²"></div>
    <div class="field"><label>Çmimi (€)</label><input id="o-pr" type="number" placeholder="0.00" step="0.01"></div>
    <div class="field"><label>Statusi i pagesës</label>
      <select id="o-pay"><option value="unpaid">Pa paguar</option><option value="paid">Paguar</option><option value="partial">Pjesërisht</option></select>
    </div>
    <div class="field"><label>Punëtori</label><select id="o-w"></select></div>
    <div class="field"><label>Afati</label><input id="o-due" type="date"></div>
    <div class="btn-row">
      <button class="btn cancel" onclick="closeModal('m-order')">Anulo</button>
      <button class="btn primary" onclick="addOrder()">Ruaj</button>
    </div>
  </div>
</div>

<div class="modal-overlay" id="m-produkt" onclick="bgClose(event,'m-produkt')">
  <div class="modal">
    <div class="modal-handle"></div>
    <div class="modal-title">Shto material / produkt</div>
    <div class="field"><label>Emri (shkruaj çfarë të duash)</label><input id="p-n" type="text" placeholder="p.sh. Reklamë 3D, Alukonbond, Vinyl..."></div>
    <div class="field"><label>Kategoria</label>
      <select id="p-c"><option>Letër</option><option>Bojë</option><option>Vinyl / Flex</option><option>Karton</option><option>3D</option><option>Aluminium / Alukonbond</option><option>Tabelë</option><option>Tjetër</option></select>
    </div>
    <div class="field"><label>Njësia matëse</label>
      <select id="p-ut" onchange="toggleUnit()">
        <option value="riz.">Rizme (riz.)</option>
        <option value="m²">Sipërfaqe (m²)</option>
        <option value="copë">Copë</option>
        <option value="njësi">Njësi</option>
        <option value="ml">Metër linear (ml)</option>
        <option value="kg">Kilogram (kg)</option>
        <option value="tjetër">Tjetër...</option>
      </select>
    </div>
    <div class="field" id="unit-cw" style="display:none;"><label>Njësia (shtype)</label><input id="p-uc" type="text" placeholder="p.sh. pako..."></div>
    <div class="field"><label>Çmimi për njësi (€)</label><input id="p-price" type="number" placeholder="0.00" step="0.01"></div>
    <div class="field"><label>Sasia aktuale</label><input id="p-q" type="number" placeholder="0"></div>
    <div class="field"><label>Alarm kur mbaron (min. sasi)</label><input id="p-m" type="number" placeholder="2"></div>
    <div class="btn-row">
      <button class="btn cancel" onclick="closeModal('m-produkt')">Anulo</button>
      <button class="btn primary" onclick="addProdukt()">Shto</button>
    </div>
  </div>
</div>

<div class="modal-overlay" id="m-worker" onclick="bgClose(event,'m-worker')">
  <div class="modal">
    <div class="modal-handle"></div>
    <div class="modal-title">Shto punëtor</div>
    <div class="field"><label>Emri i plotë</label><input id="w-n" type="text" placeholder="Emri Mbiemri"></div>
    <div class="field"><label>PIN / Fjalëkalimi</label><input id="w-pin" type="text" placeholder="p.sh. 1234 ose emri"></div>
    <div class="field"><label>Roli</label><select id="w-r"><option>Punëtor</option><option>Admin</option></select></div>
    <div class="field"><label>Telefoni</label><input id="w-p" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="btn-row">
      <button class="btn cancel" onclick="closeModal('m-worker')">Anulo</button>
      <button class="btn primary" onclick="addWorker()">Shto</button>
    </div>
  </div>
</div>

<div class="modal-overlay" id="m-client" onclick="bgClose(event,'m-client')">
  <div class="modal">
    <div class="modal-handle"></div>
    <div class="modal-title">Shto klient</div>
    <div class="field"><label>Emri / Kompania</label><input id="cl-n" type="text" placeholder="Emri i klientit"></div>
    <div class="field"><label>Telefoni</label><input id="cl-p" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="field"><label>Borxhi fillestar (€)</label><input id="cl-d" type="number" placeholder="0.00" step="0.01"></div>
    <div class="btn-row">
      <button class="btn cancel" onclick="closeModal('m-client')">Anulo</button>
      <button class="btn primary" onclick="addClient()">Shto</button>
    </div>
  </div>
</div>

<div class="modal-overlay" id="m-status" onclick="bgClose(event,'m-status')">
  <div class="modal">
    <div class="modal-handle"></div>
    <div class="modal-title">Ndrysho statusin</div>
    <div class="status-options">
      <button class="status-opt" style="color:var(--g);border-color:rgba(0,196,140,0.3);" onclick="setStatus('Gati','green')"><i class="fa-solid fa-check-circle"></i> Gati — Në dorëzim</button>
      <button class="status-opt" style="color:var(--a);border-color:rgba(245,166,35,0.3);" onclick="setStatus('Në punë','amber')"><i class="fa-solid fa-spinner"></i> Vazhdon — Në punë</button>
      <button class="status-opt" style="color:var(--r);border-color:rgba(255,77,77,0.3);" onclick="setStatus('Vonuar','red')"><i class="fa-solid fa-clock"></i> Ka vonesë — Vonuar</button>
      <button class="status-opt" style="color:var(--pu);border-color:rgba(168,85,247,0.3);background:rgba(168,85,247,0.06);" onclick="setStatus('Kryer','pur')"><i class="fa-solid fa-circle-check"></i> U realizua — Kalo në Historik</button>
    </div>
    <button class="btn cancel" style="margin-top:12px;width:100%;" onclick="closeModal('m-status')">Mbyll</button>
  </div>
</div>

<div class="toast" id="toast"></div>

<!-- FIREBASE -->
<script type="module">
import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.0/firebase-app.js";
import { getFirestore, collection, addDoc, getDocs, doc, updateDoc, deleteDoc, onSnapshot, query, orderBy, serverTimestamp } from "https://www.gstatic.com/firebasejs/11.0.0/firebase-firestore.js";

const firebaseConfig = {
  apiKey: "AIzaSyAE2hpDlkfLkIEGDOviPX64PJVY1-kfJIY",
  authDomain: "cpictures-44339.firebaseapp.com",
  projectId: "cpictures-44339",
  storageBucket: "cpictures-44339.firebasestorage.app",
  messagingSenderId: "1086138474106",
  appId: "1:1086138474106:web:5835bc5a3a04000c5b65c3",
  measurementId: "G-PE375XCX9S"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

// STATE
var currentUser = null;
var orderFilter = 'all';
var invFilter = 'all';
var clientFilter = 'all';
var histFilter = 'all';
var activeOrderId = null;

// CACHE
var orders = [];
var inventory = [];
var workers = [];
var clients = [];
var notifications = [];
var nc = 0;

function G(id){return document.getElementById(id);}
function toast(msg){var t=G('toast');t.textContent=msg;t.classList.add('show');setTimeout(function(){t.classList.remove('show');},2500);}
function openModal(id){G(id).classList.add('open');}
function closeModal(id){G(id).classList.remove('open');}
function bgClose(e,id){if(e.target.id===id)closeModal(id);}
window.openModal=openModal;window.closeModal=closeModal;window.bgClose=bgClose;

function initials(n){return n.split(' ').map(function(w){return w[0];}).join('').substring(0,2).toUpperCase();}
function bcls(s){return s==='Gati'?'green':s==='Në punë'?'amber':s==='Vonuar'?'red':s==='Kryer'?'pur':'blue';}
function todayStr(){return new Date().toISOString().slice(0,10);}
function fmtDate(d){if(!d)return'';var p=d.slice?d.slice(0,10).split('-'):[];return p.length===3?p[2]+'.'+p[1]+'.'+p[0]:d;}

// LOGIN
var USERS = [
  {name:'Besnik',pin:'admin123',role:'Admin',color:['rgba(0,196,140,0.15)','#00C48C']},
];

function doLogin(){
  var pin = G('l-pin').value.trim().toLowerCase();
  var found = USERS.find(function(u){return u.pin.toLowerCase()===pin||u.name.toLowerCase()===pin;});
  if(!found){
    // check from workers db
    var wFound = workers.find(function(w){return w.pin&&(w.pin.toLowerCase()===pin||w.name.toLowerCase()===pin);});
    if(wFound){found={name:wFound.name,pin:wFound.pin,role:wFound.role,color:wFound.color||['rgba(77,158,255,0.15)','#4D9EFF']};}
  }
  if(!found){G('login-err').textContent='PIN i gabuar! Provo përsëri.';return;}
  currentUser=found;
  localStorage.setItem('cp_user',JSON.stringify(found));
  showApp();
}
window.doLogin=doLogin;

function doLogout(){
  currentUser=null;
  localStorage.removeItem('cp_user');
  G('app-wrap').style.display='none';
  G('login-screen').classList.add('show');
  G('l-pin').value='';G('login-err').textContent='';
}
window.doLogout=doLogout;

function showApp(){
  G('login-screen').classList.remove('show');
  G('app-wrap').style.display='flex';
  G('user-label').textContent='Hyrë si: '+currentUser.name+' · '+currentUser.role;
  // show/hide admin cards
  var isAdmin=currentUser.role==='Admin';
  G('card-fit').style.display=isAdmin?'block':'none';
  G('card-mua').style.display=isAdmin?'block':'none';
  G('debt-sum').style.display=isAdmin?'flex':'none';
  G('hist-sum').style.display=isAdmin?'flex':'none';
  G('add-worker-btn').style.display=isAdmin?'flex':'none';
  fillWorkerSelect();
  renderHome();
  updBadge();
  // weekly debt check (Monday)
  if(new Date().getDay()===1){
    var unpaid=clients.filter(function(c){return !c.paid&&c.debt>0;});
    if(unpaid.length){
      var names=unpaid.slice(0,3).map(function(c){return c.name+' (€'+c.debt+')'}).join(' · ');
      addNotifLocal('📅 Obligime javore',names,'Sistem','#4D9EFF','Borxh','blue');
    }
  }
}

// REALTIME LISTENERS
function startListeners(){
  // Orders
  onSnapshot(query(collection(db,'orders'),orderBy('createdAt','desc')), function(snap){
    orders=[];
    snap.forEach(function(d){orders.push(Object.assign({id:d.id},d.data()));});
    renderHome();renderOrders();renderHistory();
  });
  // Inventory
  onSnapshot(collection(db,'inventory'), function(snap){
    inventory=[];
    snap.forEach(function(d){inventory.push(Object.assign({id:d.id},d.data()));});
    renderInv();
  });
  // Workers
  onSnapshot(collection(db,'workers'), function(snap){
    workers=[];
    snap.forEach(function(d){workers.push(Object.assign({id:d.id},d.data()));});
    fillWorkerSelect();renderWorkers();
  });
  // Clients
  onSnapshot(collection(db,'clients'), function(snap){
    clients=[];
    snap.forEach(function(d){clients.push(Object.assign({id:d.id},d.data()));});
    renderClients();renderHome();
    // fill datalist
    var dl=G('clients-dl');if(dl){dl.innerHTML='';clients.forEach(function(c){var o=document.createElement('option');o.value=c.name;dl.appendChild(o);});}
  });
  // Notifications
  onSnapshot(query(collection(db,'notifications'),orderBy('createdAt','desc')), function(snap){
    notifications=[];
    snap.forEach(function(d){notifications.push(Object.assign({id:d.id},d.data()));});
    nc=notifications.filter(function(n){return !n.read;}).length;
    updBadge();renderNotifs();
  });
}

function updBadge(){G('nbadge').textContent=nc;G('nbadge').style.display=nc>0?'flex':'none';G('nav-dot').style.display=nc>0?'block':'none';}
function markRead(){nc=0;updBadge();}
window.markRead=markRead;

async function clearNotifs(){
  for(var n of notifications){try{await deleteDoc(doc(db,'notifications',n.id));}catch(e){}}
  nc=0;updBadge();
}
window.clearNotifs=clearNotifs;

async function addNotifDB(text,desc,worker,color,badge,cls){
  try{await addDoc(collection(db,'notifications'),{text,desc,worker,color,badge,cls,read:false,createdAt:serverTimestamp()});}catch(e){console.log(e);}
}
function addNotifLocal(text,desc,worker,color,badge,cls){
  notifications.unshift({text,desc,worker,color,badge,cls});nc++;updBadge();renderNotifs();
}

// SWITCH
function switchTo(sid,nid){
  document.querySelectorAll('.screen').forEach(function(s){s.classList.remove('active');});
  document.querySelectorAll('.tnav-item').forEach(function(b){b.classList.remove('active');});
  G(sid).classList.add('active');if(nid)G(nid).classList.add('active');
  document.querySelector('.scroll-area').scrollTop=0;
}
window.switchTo=switchTo;

// RENDER HOME
function renderHome(){
  var active=orders.filter(function(o){return !o.done;});
  var borxhe=clients.filter(function(c){return !c.paid&&c.debt>0;}).length;
  G('st-por').textContent=active.length;
  G('st-bor').textContent=borxhe;
  if(currentUser&&currentUser.role==='Admin'){
    var today=todayStr();
    var fitSot=orders.filter(function(o){return o.date===today&&o.pay==='paid';}).reduce(function(a,b){return a+parseFloat(b.price||0);},0);
    var m=new Date().getMonth();var y=new Date().getFullYear();
    var fitMua=orders.filter(function(o){var d=new Date(o.date||'');return d.getMonth()===m&&d.getFullYear()===y&&o.pay==='paid';}).reduce(function(a,b){return a+parseFloat(b.price||0);},0);
    G('st-fit').textContent='€ '+fitSot.toFixed(0);
    G('st-mua').textContent='€ '+fitMua.toFixed(0);
  }
  var l=G('home-list');if(!l)return;l.innerHTML='';
  var show=active.slice(0,5);
  if(!show.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clipboard-check"></i><p>Asnjë porosi aktive</p></div>';return;}
  show.forEach(function(o){l.appendChild(makeOrderCard(o));});
}

function makeOrderCard(o){
  var cl=bcls(o.status);
  var ibg=cl==='green'?'rgba(0,196,140,0.12)':cl==='amber'?'rgba(245,166,35,0.12)':cl==='red'?'rgba(255,77,77,0.12)':'rgba(168,85,247,0.12)';
  var ic=cl==='green'?'#00C48C':cl==='amber'?'#F5A623':cl==='red'?'#FF4D4D':'#A855F7';
  var payBadge=o.pay==='paid'?'<span class="badge green">Paguar</span>':o.pay==='partial'?'<span class="badge amber">Pjesërisht</span>':'<span class="badge red">Pa paguar</span>';
  var el=document.createElement('div');el.className='card';
  el.innerHTML='<div class="card-icon" style="background:'+ibg+';"><i class="fa-solid fa-file-invoice" style="color:'+ic+';"></i></div>'
    +'<div class="card-body"><div class="card-title">'+o.prod+'</div><div class="card-sub">'+(o.client||'')+' · '+(o.worker||'')+' · '+fmtDate(o.date)+'</div></div>'
    +'<div class="card-right"><span class="badge '+cl+'">'+o.status+'</span> '+payBadge+'<div class="card-price">€ '+parseFloat(o.price||0).toFixed(2)+'</div></div>';
  el.onclick=function(){activeOrderId=o.id;openModal('m-status');};
  return el;
}

function filterOrders(f,el){orderFilter=f;document.querySelectorAll('#s-orders .filter-chip').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderOrders();}
window.filterOrders=filterOrders;

function renderOrders(){
  var l=G('orders-list');if(!l)return;l.innerHTML='';
  var list=orders.filter(function(o){
    if(orderFilter==='all')return !o.done;
    return o.status===orderFilter&&!o.done;
  });
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clipboard-list"></i><p>Asnjë porosi</p></div>';return;}
  list.forEach(function(o){l.appendChild(makeOrderCard(o));});
}

function filterInv(f,el){invFilter=f;document.querySelectorAll('#s-inv .filter-chip').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderInv();}
window.filterInv=filterInv;

function renderInv(){
  var l=G('inv-list');if(!l)return;l.innerHTML='';
  var list=inventory.filter(function(i){return invFilter==='all'||i.cat.includes(invFilter);});
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-box"></i><p>Asnjë material</p></div>';return;}
  list.forEach(function(item){
    var min=parseFloat(item.min)||1;var qty=parseFloat(item.qty)||0;
    var pct=Math.min(100,Math.round((qty/Math.max(min*3,qty,1))*100));
    var col=qty<=min?'#FF4D4D':qty<=min*2?'#F5A623':'#00C48C';
    var ibg=qty<=min?'rgba(255,77,77,0.12)':qty<=min*2?'rgba(245,166,35,0.12)':'rgba(77,158,255,0.12)';
    var ic=qty<=min?'#FF4D4D':qty<=min*2?'#F5A623':'#4D9EFF';
    var warn=qty<=min?'<div class="prog-warn" style="color:#FF4D4D;"><i class="fa-solid fa-triangle-exclamation"></i> Pothuaj mbaroi!</div>':qty<=min*2?'<div class="prog-warn" style="color:#F5A623;">Stok i ulët</div>':'';
    var el=document.createElement('div');el.className='inv-row';
    el.innerHTML='<div class="card-icon" style="background:'+ibg+';"><i class="fa-solid fa-box-archive" style="color:'+ic+';font-size:15px;"></i></div>'
      +'<div class="prog-wrap"><div class="prog-top"><span class="prog-name">'+item.name+'</span>'
      +'<span class="prog-qty" style="color:'+col+';">'+qty+' '+item.unit+'</span></div>'
      +'<div class="prog-bar"><div class="prog-fill" style="width:'+pct+'%;background:'+col+';"></div></div>'
      +(item.unitPrice?'<div style="font-size:10px;color:var(--t3);margin-top:3px;">€'+item.unitPrice+'/'+item.unit+' · '+item.cat+'</div>':'')
      +warn+'</div>';
    l.appendChild(el);
  });
}

function renderWorkers(){
  var l=G('workers-list');if(!l)return;l.innerHTML='';
  var colors=[['rgba(0,196,140,0.15)','#00C48C'],['rgba(77,158,255,0.15)','#4D9EFF'],['rgba(245,166,35,0.15)','#F5A623'],['rgba(255,77,77,0.15)','#FF4D4D'],['rgba(168,85,247,0.15)','#A855F7']];
  workers.forEach(function(w,i){
    var c=w.color||colors[i%colors.length];
    var isAdmin2=currentUser&&currentUser.role==='Admin';
    var el=document.createElement('div');el.className='card';
    var roleChip='<span class="role-chip '+(w.role==='Admin'?'admin':'worker')+'">'+w.role+'</span>';
    var delBtn=isAdmin2?'<button onclick="event.stopPropagation();delWorker(\''+w.id+'\')" style="background:var(--rl);border:none;color:var(--r);padding:6px 10px;border-radius:8px;cursor:pointer;font-size:12px;"><i class="fa-solid fa-trash"></i></button>':'';
    el.innerHTML='<div class="avatar" style="background:'+c[0]+';color:'+c[1]+';">'+initials(w.name)+'</div>'
      +'<div class="card-body"><div class="card-title">'+w.name+' '+roleChip+'</div>'
      +'<div class="card-sub">'+(parseInt(w.done)||0)+' kryer · '+(parseInt(w.orders)||0)+' total'+(w.phone?' · '+w.phone:'')+'</div></div>'
      +delBtn;
    l.appendChild(el);
  });
  // Chart
  var wc=G('wchart');if(!wc)return;wc.innerHTML='';
  var colors2=[['rgba(0,196,140,0.15)','#00C48C'],['rgba(77,158,255,0.15)','#4D9EFF'],['rgba(245,166,35,0.15)','#F5A623'],['rgba(255,77,77,0.15)','#FF4D4D'],['rgba(168,85,247,0.15)','#A855F7']];
  var maxO=Math.max.apply(null,workers.map(function(w){return parseInt(w.orders)||0;}))||1;
  workers.forEach(function(w,i){
    var c=w.color||colors2[i%colors2.length];
    var done=parseInt(w.done)||0;var total=parseInt(w.orders)||0;var mbetur=total-done;
    var pct=total>0?Math.round((done/total)*100):0;
    var row=document.createElement('div');row.className='chart-row';
    row.innerHTML='<span class="chart-lbl">'+w.name.split(' ')[0]+'</span>'
      +'<div class="chart-bg"><div class="chart-fill" style="width:'+pct+'%;background:'+c[1]+';"></div></div>'
      +'<span class="chart-num"><span style="color:#00C48C;">'+done+'✓</span> <span style="color:#FF4D4D;">'+mbetur+'✗</span></span>';
    wc.appendChild(row);
  });
  if(!workers.length)wc.innerHTML='<div class="empty" style="padding:20px;"><p>Asnjë punëtor</p></div>';
}

function filterClients(f,el){clientFilter=f;document.querySelectorAll('#s-clients .filter-chip').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderClients();}
window.filterClients=filterClients;

function renderClients(){
  var l=G('clients-list');if(!l)return;l.innerHTML='';
  var total=clients.filter(function(c){return !c.paid;}).reduce(function(a,b){return a+parseFloat(b.debt||0);},0);
  var td=G('total-debt');if(td)td.textContent='€ '+total.toFixed(2);
  var list=clients.filter(function(c){
    if(clientFilter==='unpaid')return !c.paid&&parseFloat(c.debt||0)>0;
    if(clientFilter==='paid')return c.paid||parseFloat(c.debt||0)===0;
    return true;
  });
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-address-book"></i><p>Asnjë klient</p></div>';return;}
  list.forEach(function(c){
    var el=document.createElement('div');el.className='client-card';
    var debtTxt=c.paid||parseFloat(c.debt||0)===0?'Paguar':'€ '+parseFloat(c.debt||0).toFixed(2)+' borxh';
    var debtCls=c.paid||parseFloat(c.debt||0)===0?'paid':'owe';
    var payBtn=c.paid||parseFloat(c.debt||0)===0
      ?'<button class="pay-btn mark-unpaid" onclick="togglePay(\''+c.id+'\')">Shëno pa paguar</button>'
      :'<button class="pay-btn mark-paid" onclick="togglePay(\''+c.id+'\')">Paguar ✓</button>';
    var phoneLink=c.phone?'<a href="tel:'+c.phone+'" style="color:var(--b);font-size:12px;text-decoration:none;display:flex;align-items:center;gap:4px;"><i class="fa-solid fa-phone"></i> '+c.phone+'</a>':'<span></span>';
    el.innerHTML='<div class="client-header">'
      +'<div class="avatar" style="background:var(--s3);color:var(--t2);width:34px;height:34px;font-size:12px;">'+initials(c.name)+'</div>'
      +'<span class="client-name">'+c.name+'</span>'
      +'<span class="client-debt '+debtCls+'">'+debtTxt+'</span>'
      +'</div>'
      +'<div style="display:flex;justify-content:space-between;align-items:center;">'+phoneLink+payBtn+'</div>';
    l.appendChild(el);
  });
}

async function togglePay(id){
  var c=clients.find(function(x){return x.id===id;});if(!c)return;
  var newPaid=!c.paid;var newDebt=newPaid?0:parseFloat(c.debt||0);
  try{
    await updateDoc(doc(db,'clients',id),{paid:newPaid,debt:newDebt});
    await addNotifDB(newPaid?'Pagesa e kryer':'Pagesa e anuluar',c.name,'Admin',newPaid?'#00C48C':'#FF4D4D',newPaid?'Paguar':'Pa paguar',newPaid?'green':'red');
    toast(newPaid?c.name+' — paguar!':c.name+' — shënuar pa paguar');
  }catch(e){toast('Gabim: '+e.message);}
}
window.togglePay=togglePay;

function filterHistory(f,el){histFilter=f;document.querySelectorAll('#s-history .filter-chip').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderHistory();}
window.filterHistory=filterHistory;

function renderHistory(){
  var l=G('history-list');if(!l)return;l.innerHTML='';
  var from=G('h-from')?G('h-from').value:'';var to=G('h-to')?G('h-to').value:'';
  var list=orders.filter(function(o){
    var inDate=true;
    if(from)inDate=o.date>=from;
    if(to)inDate=inDate&&o.date<=to;
    if(histFilter!=='all')return inDate&&o.status===histFilter;
    return inDate;
  });
  var total=list.reduce(function(a,b){return a+parseFloat(b.price||0);},0);
  var ht=G('hist-total');if(ht)ht.textContent='€ '+total.toFixed(2);
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clock-rotate-left"></i><p>Asnjë porosi</p></div>';return;}
  list.forEach(function(o){l.appendChild(makeOrderCard(o));});
}

function renderNotifs(){
  var l=G('notif-list');if(!l)return;l.innerHTML='';
  if(!notifications.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-bell-slash"></i><p>Asnjë njoftim</p></div>';return;}
  notifications.slice(0,30).forEach(function(n){
    var el=document.createElement('div');el.className='notif-item';
    el.innerHTML='<div class="notif-pip" style="background:'+n.color+';"></div>'
      +'<div style="flex:1;"><div style="font-size:13px;font-weight:600;color:var(--t1);font-family:var(--ff);">'+n.text+' <span class="badge '+n.cls+'">'+n.badge+'</span></div>'
      +'<div style="font-size:12px;color:var(--t2);margin-top:3px;">'+n.desc+'</div>'
      +'<div style="font-size:10px;color:var(--t3);margin-top:2px;">'+n.worker+'</div></div>';
    l.appendChild(el);
  });
}

function fillWorkerSelect(){
  var s=G('o-w');if(!s)return;s.innerHTML='';
  if(currentUser){{var o=document.createElement('option');o.value=currentUser.name;o.textContent=currentUser.name+' (unë)';s.appendChild(o);}}
  workers.forEach(function(w){
    if(currentUser&&w.name===currentUser.name)return;
    var o=document.createElement('option');o.value=w.name;o.textContent=w.name;s.appendChild(o);
  });
}

// ADD ORDER
async function addOrder(){
  var c=G('o-c').value.trim();if(!c){toast('Shkruaj emrin e klientit!');return;}
  var prod=G('o-p').value.trim();if(!prod){toast('Shkruaj produktin!');return;}
  var price=parseFloat(G('o-pr').value)||0;
  var pay=G('o-pay').value;
  var worker=G('o-w').value||currentUser.name;
  var due=G('o-due').value||todayStr();
  try{
    await addDoc(collection(db,'orders'),{client:c,prod:prod,qty:G('o-q').value||'1',price:price,worker:worker,status:'Në punë',pay:pay,date:due,done:false,createdAt:serverTimestamp()});
    if(pay==='unpaid'||pay==='partial'){
      var cl=clients.find(function(x){return x.name===c;});
      if(!cl){await addDoc(collection(db,'clients'),{name:c,phone:'',debt:price,paid:false,createdAt:serverTimestamp()});}
      else{await updateDoc(doc(db,'clients',cl.id),{debt:parseFloat(cl.debt||0)+price,paid:false});}
    }
    // update worker orders count
    var wObj=workers.find(function(w){return w.name===worker;});
    if(wObj){await updateDoc(doc(db,'workers',wObj.id),{orders:(parseInt(wObj.orders)||0)+1});}
    await addNotifDB('Porosi e re',prod+' — '+c,worker,'#4D9EFF','E re','blue');
    closeModal('m-order');
    G('o-c').value='';G('o-p').value='';G('o-q').value='';G('o-pr').value='';
    toast('Porosia u shtua!');
  }catch(e){toast('Gabim: '+e.message);}
}
window.addOrder=addOrder;

// ADD PRODUKT
async function addProdukt(){
  var n=G('p-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var ut=G('p-ut').value;var unit=ut==='tjetër'?(G('p-uc').value.trim()||'njësi'):ut;
  var qty=parseFloat(G('p-q').value)||0;var min=parseFloat(G('p-m').value)||1;
  var unitPrice=parseFloat(G('p-price').value)||0;
  try{
    await addDoc(collection(db,'inventory'),{name:n,cat:G('p-c').value,qty:qty,unit:unit,unitPrice:unitPrice,min:min,createdAt:serverTimestamp()});
    if(qty<=min)await addNotifDB('Stoku i ulët',n+' — '+qty+' '+unit,'Sistem','#F5A623','Alarm','amber');
    closeModal('m-produkt');
    G('p-n').value='';G('p-q').value='';G('p-m').value='';G('p-price').value='';
    toast('Materiali u shtua!');
  }catch(e){toast('Gabim: '+e.message);}
}
window.addProdukt=addProdukt;

// ADD WORKER
async function addWorker(){
  var n=G('w-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var pin=G('w-pin').value.trim();if(!pin){toast('Shkruaj PIN-in!');return;}
  var colors=[['rgba(0,196,140,0.15)','#00C48C'],['rgba(77,158,255,0.15)','#4D9EFF'],['rgba(245,166,35,0.15)','#F5A623'],['rgba(255,77,77,0.15)','#FF4D4D'],['rgba(168,85,247,0.15)','#A855F7']];
  var c=colors[workers.length%colors.length];
  try{
    await addDoc(collection(db,'workers'),{name:n,pin:pin,role:G('w-r').value,phone:G('w-p').value,orders:0,done:0,color:c,createdAt:serverTimestamp()});
    closeModal('m-worker');G('w-n').value='';G('w-pin').value='';G('w-p').value='';
    toast(n+' u shtua! PIN: '+pin);
  }catch(e){toast('Gabim: '+e.message);}
}
window.addWorker=addWorker;

// DELETE WORKER
async function delWorker(id){
  if(!confirm('A jeni i sigurt?'))return;
  try{await deleteDoc(doc(db,'workers',id));toast('Punëtori u largua!');}
  catch(e){toast('Gabim!');}
}
window.delWorker=delWorker;

// ADD CLIENT
async function addClient(){
  var n=G('cl-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var debt=parseFloat(G('cl-d').value)||0;
  try{
    await addDoc(collection(db,'clients'),{name:n,phone:G('cl-p').value,debt:debt,paid:debt===0,createdAt:serverTimestamp()});
    closeModal('m-client');G('cl-n').value='';G('cl-p').value='';G('cl-d').value='';
    toast(n+' u shtua!');
  }catch(e){toast('Gabim: '+e.message);}
}
window.addClient=addClient;

// SET STATUS
async function setStatus(status,cls){
  if(!activeOrderId){closeModal('m-status');return;}
  var o=orders.find(function(x){return x.id===activeOrderId;});if(!o){closeModal('m-status');return;}
  var isDone=status==='Kryer';
  try{
    await updateDoc(doc(db,'orders',activeOrderId),{status:status,done:isDone});
    if(isDone){
      var wObj=workers.find(function(w){return w.name===o.worker;});
      if(wObj)await updateDoc(doc(db,'workers',wObj.id),{done:(parseInt(wObj.done)||0)+1});
    }
    var col=status==='Gati'?'#00C48C':status==='Vonuar'?'#FF4D4D':status==='Kryer'?'#A855F7':'#F5A623';
    var msg=status==='Gati'?'Porosia u krye':status==='Kryer'?'Porosia u realizua ✓':status==='Vonuar'?'Porosi e vonuar':'Porosia vazhdues';
    await addNotifDB(msg,o.prod+' — '+o.client,currentUser.name,col,status,cls);
    toast(isDone?'Kaloi në historik!':'Statusi u ndryshua!');
  }catch(e){toast('Gabim: '+e.message);}
  closeModal('m-status');
}
window.setStatus=setStatus;

function toggleUnit(){G('unit-cw').style.display=G('p-ut').value==='tjetër'?'block':'none';}
window.toggleUnit=toggleUnit;
window.filterHistory=filterHistory;
window.filterOrders=filterOrders;
window.filterInv=filterInv;
window.filterClients=filterClients;

// INIT
G('loading-screen').style.display='flex';
startListeners();

// Check saved login
var saved=localStorage.getItem('cp_user');
if(saved){
  try{currentUser=JSON.parse(saved);showApp();}catch(e){currentUser=null;}
}

setTimeout(function(){
  G('loading-screen').style.display='none';
  if(!currentUser){G('login-screen').classList.add('show');}
  else{G('app-wrap').style.display='flex';showApp();}
},1500);

// set history dates
var today2=new Date();var first=new Date(today2.getFullYear(),today2.getMonth(),1);
if(G('h-from'))G('h-from').value=first.toISOString().slice(0,10);
if(G('h-to'))G('h-to').value=today2.toISOString().slice(0,10);

// Enter key for login
G('l-pin').addEventListener('keypress',function(e){if(e.key==='Enter')doLogin();});
</script>
</body>
</html>

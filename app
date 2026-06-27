<!DOCTYPE html>
<html lang="sq">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="CPictures">
<meta name="theme-color" content="#ffffff">
<link rel="manifest" href="data:application/manifest+json,{
  %22name%22:%22CPictures%22,
  %22short_name%22:%22CPictures%22,
  %22start_url%22:%22./%22,
  %22display%22:%22standalone%22,
  %22background_color%22:%22%23ffffff%22,
  %22theme_color%22:%22%23E8192C%22,
  %22icons%22:[{
    %22src%22:%22data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 192 192'%3E%3Crect width='192' height='192' rx='40' fill='%23E8192C'/%3E%3Ctext x='96' y='140' font-family='Arial' font-weight='900' font-size='130' fill='white' text-anchor='middle'%3EC%3C/text%3E%3C/svg%3E%22,
    %22sizes%22:%22192x192%22,
    %22type%22:%22image/svg+xml%22,
    %22purpose%22:%22any maskable%22
  },{
    %22src%22:%22data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'%3E%3Crect width='512' height='512' rx='100' fill='%23E8192C'/%3E%3Ctext x='256' y='380' font-family='Arial' font-weight='900' font-size='360' fill='white' text-anchor='middle'%3EC%3C/text%3E%3C/svg%3E%22,
    %22sizes%22:%22512x512%22,
    %22type%22:%22image/svg+xml%22,
    %22purpose%22:%22any maskable%22
  }]
}">
<title>CPictures</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Mono:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root{
  --red:#E8192C;--redl:rgba(232,25,44,0.08);--redd:#C0001A;
  --green:#00B37A;--greenl:rgba(0,179,122,0.1);
  --amber:#F59E0B;--amberl:rgba(245,158,11,0.1);
  --blue:#3B82F6;--bluel:rgba(59,130,246,0.1);
  --pur:#8B5CF6;--purl:rgba(139,92,246,0.1);
  --bg:#F5F5F7;--white:#fff;
  --br:rgba(0,0,0,0.07);--br2:rgba(0,0,0,0.12);
  --t1:#0A0A0A;--t2:#6B6B6B;--t3:#ABABAB;
  --r1:16px;--r2:12px;--r3:8px;
  --sh:0 2px 12px rgba(0,0,0,0.06);
  --ff:'Inter',sans-serif;--fm:'DM Mono',monospace;
  --nav:68px;
}
*{box-sizing:border-box;margin:0;padding:0;-webkit-tap-highlight-color:transparent;}
html,body{height:100%;overflow:hidden;background:var(--bg);}
body{font-family:var(--ff);color:var(--t1);display:flex;flex-direction:column;max-width:430px;margin:0 auto;}

/* LOADING */
.ld{position:fixed;inset:0;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;z-index:999;}
.ld-logo{font-size:32px;font-weight:800;margin-bottom:20px;letter-spacing:-1px;}
.ld-logo span{color:var(--red);}
.spinner{width:30px;height:30px;border:3px solid #f0f0f0;border-top-color:var(--red);border-radius:50%;animation:spin 0.8s linear infinite;}
@keyframes spin{to{transform:rotate(360deg)}}

/* LOGIN */
.login{position:fixed;inset:0;background:#fff;display:none;flex-direction:column;align-items:center;justify-content:center;padding:32px;z-index:998;}
.login.show{display:flex;}
.login-logo{font-size:40px;font-weight:800;letter-spacing:-1px;margin-bottom:6px;}
.login-logo span{color:var(--red);}
.login-sub{font-size:14px;color:var(--t2);margin-bottom:36px;}
.login input{width:100%;padding:14px 16px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:16px;font-family:var(--ff);background:var(--bg);color:var(--t1);outline:none;margin-bottom:12px;}
.login input:focus{border-color:var(--red);background:#fff;}
.login-btn{width:100%;padding:14px;border-radius:var(--r2);border:none;font-size:16px;font-weight:700;cursor:pointer;background:var(--red);color:#fff;box-shadow:0 4px 20px rgba(232,25,44,0.3);}
.login-err{color:var(--red);font-size:13px;text-align:center;margin-top:10px;min-height:18px;}

/* APP */
#app{display:none;flex-direction:column;height:100%;}

/* TOPBAR */
.tb{background:#fff;padding:14px 18px 12px;display:flex;align-items:center;justify-content:space-between;border-bottom:1px solid var(--br);flex-shrink:0;padding-top:max(14px,env(safe-area-inset-top));}
.tb-logo{font-size:20px;font-weight:800;letter-spacing:-0.5px;}
.tb-logo span{color:var(--red);}
.tb-right{display:flex;gap:8px;}
.ib{width:36px;height:36px;border-radius:10px;background:var(--bg);border:none;cursor:pointer;display:flex;align-items:center;justify-content:center;color:var(--t2);font-size:15px;position:relative;}
.nb{position:absolute;top:3px;right:3px;width:14px;height:14px;border-radius:50%;background:var(--red);color:#fff;font-size:9px;font-weight:700;display:flex;align-items:center;justify-content:center;}

/* SCROLL */
.sa{flex:1;overflow-y:auto;-webkit-overflow-scrolling:touch;padding-bottom:var(--nav);}
.sc{display:none;padding:16px;}
.sc.active{display:block;animation:fu 0.18s ease;}
@keyframes fu{from{opacity:0;transform:translateY(5px)}to{opacity:1;transform:translateY(0)}}

/* BOTTOM NAV */
.bn{position:fixed;bottom:0;left:50%;transform:translateX(-50%);width:100%;max-width:430px;background:#fff;border-top:1px solid var(--br);display:flex;z-index:50;padding-bottom:env(safe-area-inset-bottom,6px);}
.bi{flex:1;display:flex;flex-direction:column;align-items:center;gap:3px;cursor:pointer;padding:9px 4px 5px;border:none;background:none;color:var(--t3);font-size:10px;font-family:var(--ff);font-weight:500;position:relative;transition:color 0.15s;}
.bi i{font-size:21px;}
.bi.active{color:var(--red);}
.bi.active i{transform:scale(1.08);}
.nd{position:absolute;top:7px;right:calc(50% - 14px);width:6px;height:6px;border-radius:50%;background:var(--red);}

/* MORE MENU */
.mm{background:#fff;border-radius:24px 24px 0 0;padding:18px 16px;position:fixed;bottom:var(--nav);left:50%;transform:translateX(-50%);width:100%;max-width:430px;z-index:49;display:none;box-shadow:0 -4px 30px rgba(0,0,0,0.1);}
.mm.open{display:block;animation:su 0.2s ease;}
@keyframes su{from{transform:translateX(-50%) translateY(20px);opacity:0}to{transform:translateX(-50%) translateY(0);opacity:1}}
.mg{display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px;}
.mi{display:flex;flex-direction:column;align-items:center;gap:6px;padding:14px 8px;border-radius:var(--r2);background:var(--bg);cursor:pointer;border:none;font-family:var(--ff);}
.mi i{font-size:22px;color:var(--red);}
.mi span{font-size:11px;font-weight:500;color:var(--t2);}
.mo{position:fixed;inset:0;z-index:48;display:none;}
.mo.open{display:block;}

/* STATS */
.sg{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:16px;}
.sc-card{background:#fff;border-radius:var(--r1);padding:16px;box-shadow:var(--sh);}
.sc-lbl{font-size:12px;color:var(--t2);margin-bottom:8px;font-weight:500;}
.sc-val{font-size:22px;font-weight:700;font-family:var(--fm);color:var(--red);}
.sc-sub{font-size:11px;color:var(--t3);margin-top:4px;}

/* PAGE HEADER */
.ph{display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;}
.pt{font-size:22px;font-weight:700;letter-spacing:-0.3px;}
.sl{font-size:13px;font-weight:600;color:var(--red);cursor:pointer;}
.ab{width:32px;height:32px;border-radius:10px;background:var(--red);border:none;color:#fff;font-size:17px;cursor:pointer;display:flex;align-items:center;justify-content:center;box-shadow:0 3px 10px rgba(232,25,44,0.3);}

/* CARD */
.card{background:#fff;border-radius:var(--r1);margin-bottom:8px;padding:14px;display:flex;align-items:center;gap:12px;cursor:pointer;box-shadow:var(--sh);}
.card:active{opacity:0.88;}
.ci{width:40px;height:40px;border-radius:12px;display:flex;align-items:center;justify-content:center;font-size:16px;flex-shrink:0;}
.cb{flex:1;min-width:0;}
.cn{font-size:11px;font-weight:600;color:var(--t3);margin-bottom:2px;}
.ct{font-size:14px;font-weight:600;color:var(--t1);white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.cs{font-size:12px;color:var(--t2);margin-top:2px;}
.cr{text-align:right;flex-shrink:0;}
.cp{font-size:15px;font-weight:700;font-family:var(--fm);}
.cp-s{font-size:11px;color:var(--t2);margin-top:2px;}

/* BADGE */
.badge{display:inline-block;font-size:11px;font-weight:600;padding:4px 10px;border-radius:20px;}
.badge.green{background:var(--greenl);color:var(--green);}
.badge.amber{background:var(--amberl);color:var(--amber);}
.badge.red{background:var(--redl);color:var(--red);}
.badge.blue{background:var(--bluel);color:var(--blue);}
.badge.pur{background:var(--purl);color:var(--pur);}
.badge.gray{background:var(--bg);color:var(--t2);}

/* FILTER */
.fr{display:flex;gap:8px;margin-bottom:12px;overflow-x:auto;scrollbar-width:none;padding-bottom:2px;}
.fr::-webkit-scrollbar{display:none;}
.fc{flex-shrink:0;padding:7px 16px;border-radius:20px;border:1.5px solid var(--br2);background:#fff;color:var(--t2);font-size:12px;font-family:var(--ff);cursor:pointer;font-weight:500;}
.fc.active{background:var(--red);color:#fff;border-color:var(--red);font-weight:600;}

/* INV */
.inv{background:#fff;border-radius:var(--r1);margin-bottom:8px;padding:14px;box-shadow:var(--sh);}
.pb{height:5px;border-radius:3px;background:var(--bg);overflow:hidden;margin-top:6px;}
.pf{height:100%;border-radius:3px;}

/* CLIENT */
.cc{background:#fff;border-radius:var(--r1);margin-bottom:8px;padding:14px;box-shadow:var(--sh);cursor:pointer;}
.av{width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:700;flex-shrink:0;}

/* BIZ */
.bz{display:flex;gap:8px;margin-top:10px;}
.bs{flex:1;background:var(--bg);border-radius:var(--r3);padding:8px;text-align:center;}
.bv{font-size:15px;font-weight:700;font-family:var(--fm);}
.bl{font-size:10px;color:var(--t2);margin-top:2px;text-transform:uppercase;}

/* TERRENI */
.tc{background:#fff;border-radius:var(--r1);margin-bottom:8px;overflow:hidden;cursor:pointer;box-shadow:var(--sh);}
.th{padding:14px;display:flex;align-items:center;gap:12px;}
.tbody{padding:0 14px 14px;}
.tm{background:var(--bg);border-radius:var(--r3);padding:10px 12px;margin-bottom:6px;}
.tmr{display:flex;justify-content:space-between;padding:3px 0;}
.tph{width:100%;max-height:160px;object-fit:cover;cursor:zoom-in;}

/* MASA */
.mr{display:flex;gap:6px;align-items:center;margin-bottom:6px;background:var(--bg);border-radius:var(--r3);padding:8px 10px;}
.mi2{flex:1;padding:7px 9px;border-radius:var(--r3);border:1.5px solid var(--br2);font-size:13px;font-family:var(--ff);background:#fff;color:var(--t1);outline:none;min-width:0;}
.mi2:focus{border-color:var(--red);}

/* CHART */
.ch{background:#fff;border-radius:var(--r1);padding:14px;margin-bottom:10px;box-shadow:var(--sh);}
.chr{display:flex;align-items:center;gap:10px;margin-bottom:10px;}
.chr:last-child{margin-bottom:0;}
.chl{font-size:11px;color:var(--t2);width:55px;flex-shrink:0;}
.chb{flex:1;height:13px;background:var(--bg);border-radius:4px;overflow:hidden;}
.chf{height:100%;border-radius:4px;}
.chn{font-size:11px;font-weight:600;width:60px;text-align:right;font-family:var(--fm);}

/* DATE */
.dr{display:flex;gap:8px;margin-bottom:10px;}
.df{flex:1;background:#fff;border:1.5px solid var(--br2);border-radius:var(--r3);padding:9px 11px;font-size:12px;color:var(--t1);font-family:var(--ff);box-shadow:var(--sh);}
.df:focus{outline:none;border-color:var(--red);}
.df::-webkit-calendar-picker-indicator{opacity:0.5;}

/* SUM BOX */
.sb2{background:#fff;border-radius:var(--r1);padding:12px 14px;margin-bottom:12px;display:flex;justify-content:space-between;align-items:center;box-shadow:var(--sh);}

/* NOTIF */
.ni{background:#fff;border-radius:var(--r1);padding:13px 14px;margin-bottom:8px;display:flex;gap:12px;box-shadow:var(--sh);}
.np{width:8px;height:8px;border-radius:50%;flex-shrink:0;margin-top:4px;}

/* MODAL */
.ov{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:200;align-items:flex-end;justify-content:center;backdrop-filter:blur(2px);}
.ov.open{display:flex;}
.modal{background:#fff;border-radius:28px 28px 0 0;padding:20px 18px calc(env(safe-area-inset-bottom,0px) + 20px);width:100%;max-width:430px;max-height:90vh;overflow-y:auto;}
.mh{width:40px;height:4px;border-radius:2px;background:var(--br2);margin:0 auto 16px;}
.mt{font-size:18px;font-weight:700;margin-bottom:16px;}
.fl{margin-bottom:13px;}
.fl label{font-size:11px;font-weight:600;color:var(--t2);display:block;margin-bottom:5px;text-transform:uppercase;letter-spacing:0.4px;}
.fl input,.fl select,.fl textarea{width:100%;padding:12px 14px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:14px;font-family:var(--ff);background:var(--bg);color:var(--t1);outline:none;}
.fl input:focus,.fl select:focus,.fl textarea:focus{border-color:var(--red);background:#fff;}
.fl select option{background:#fff;}
.br3{display:flex;gap:10px;margin-top:16px;}
.btn{flex:1;padding:13px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:14px;font-weight:600;font-family:var(--ff);cursor:pointer;}
.btn.cancel{background:var(--bg);color:var(--t2);}
.btn.primary{background:var(--red);color:#fff;border-color:var(--red);box-shadow:0 4px 14px rgba(232,25,44,0.3);}
.btn.sec{background:var(--bluel);color:var(--blue);border-color:var(--blue);}
.btn.ok{background:var(--greenl);color:var(--green);border-color:var(--green);}
.sopt{width:100%;padding:13px 16px;border-radius:var(--r2);border:1.5px solid;font-size:14px;font-weight:600;cursor:pointer;display:flex;align-items:center;gap:10px;font-family:var(--ff);background:transparent;margin-bottom:8px;}

/* ZOOM */
.zoom-bg{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.93);z-index:500;align-items:center;justify-content:center;cursor:zoom-out;}
.zoom-bg.open{display:flex;}
.zoom-bg img{max-width:96%;max-height:96%;border-radius:10px;object-fit:contain;}
.zoom-close{position:absolute;top:18px;right:18px;background:rgba(255,255,255,0.2);border:none;color:#fff;width:38px;height:38px;border-radius:50%;font-size:18px;cursor:pointer;}

/* INSTALL BANNER */
.inst-banner{background:linear-gradient(135deg,var(--red),#FF5060);border-radius:var(--r1);padding:14px 16px;margin-bottom:14px;display:flex;align-items:center;gap:12px;cursor:pointer;box-shadow:0 4px 16px rgba(232,25,44,0.25);}
.inst-banner i{font-size:22px;color:#fff;flex-shrink:0;}
.inst-t{font-size:13px;font-weight:700;color:#fff;}
.inst-s{font-size:11px;color:rgba(255,255,255,0.8);margin-top:2px;}

.role-chip{display:inline-flex;padding:3px 10px;border-radius:20px;font-size:10px;font-weight:600;}
.role-chip.admin{background:var(--purl);color:var(--pur);}
.role-chip.worker{background:var(--bg);color:var(--t2);}
.empty{text-align:center;padding:40px 20px;color:var(--t3);}
.empty i{font-size:38px;margin-bottom:12px;display:block;color:#ddd;}

/* CHAT STYLES */
.msg-wrap{display:flex;gap:8px;align-items:flex-end;margin-bottom:4px;}
.msg-wrap.mine{flex-direction:row-reverse;}
.msg-avatar{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:700;flex-shrink:0;margin-bottom:2px;}
.msg-bubble{max-width:72%;padding:9px 13px;border-radius:18px;font-size:13px;line-height:1.45;word-break:break-word;}
.msg-bubble.mine{background:var(--red);color:#fff;border-bottom-right-radius:4px;}
.msg-bubble.other{background:#fff;color:var(--t1);border-bottom-left-radius:4px;box-shadow:0 1px 4px rgba(0,0,0,0.08);}
.msg-meta{font-size:10px;color:var(--t3);margin-top:3px;text-align:right;}
.msg-meta.other{text-align:left;}
.msg-sender{font-size:10px;font-weight:600;color:var(--t2);margin-bottom:3px;}
.chat-date-sep{text-align:center;font-size:11px;color:var(--t3);margin:10px 0;font-weight:500;}
.toast{position:fixed;top:max(80px,env(safe-area-inset-top,0px) + 70px);left:50%;transform:translateX(-50%) translateY(-8px);background:var(--t1);color:#fff;padding:11px 20px;border-radius:30px;font-size:13px;font-weight:500;z-index:300;opacity:0;transition:all 0.25s;pointer-events:none;white-space:nowrap;}
.toast.show{opacity:1;transform:translateX(-50%) translateY(0);}
</style>
</head>
<body>

<div class="ld" id="ld"><div class="ld-logo">C<span>Pictures</span></div><div class="spinner"></div><div style="font-size:12px;color:var(--t3);margin-top:14px;">Duke ngarkuar...</div></div>

<div class="login" id="login">
  <div class="login-logo">C<span>Pictures</span></div>
  <div class="login-sub">Hyr me emrin ose PIN-in tënd</div>
  <input type="text" id="l-pin" placeholder="Emri ose PIN-i" maxlength="30">
  <button class="login-btn" onclick="doLogin()">Hyr</button>
  <div class="login-err" id="l-err"></div>
</div>

<div id="app" style="display:none;flex-direction:column;height:100%;">
  <div class="tb">
    <div class="tb-logo">C<span>Pictures</span></div>
    <div class="tb-right">
      <button class="ib" onclick="showInstall()"><i class="fa-solid fa-download"></i></button>
      <button class="ib" onclick="goNotif()"><i class="fa-solid fa-bell"></i><div class="nb" id="nb" style="display:none;"></div></button>
      <button class="ib" onclick="doLogout()"><i class="fa-solid fa-right-from-bracket"></i></button>
    </div>
  </div>

  <div class="sa">
    <div id="s-home" class="sc active">
      <div id="inst-wrap"></div>
      <div class="sg">
        <div class="sc-card adm" id="c-fit" style="display:none;"><div class="sc-lbl">Fitim Sot</div><div class="sc-val" id="st-fit">€ 0</div><div class="sc-sub">Vetëm admin</div></div>
        <div class="sc-card adm" id="c-mua" style="display:none;"><div class="sc-lbl">Fitim Muaji</div><div class="sc-val" id="st-mua">€ 0</div><div class="sc-sub">Vetëm admin</div></div>
        <div class="sc-card"><div class="sc-lbl">Porosi Aktive</div><div class="sc-val" id="st-por">0</div></div>
        <div class="sc-card"><div class="sc-lbl">Borxhe Aktive</div><div class="sc-val" id="st-bor">0</div><div class="sc-sub" style="cursor:pointer;color:var(--blue);" onclick="go('s-clients','bi-clients')">Shiko →</div></div>
      </div>
      <div class="ph"><div style="font-size:17px;font-weight:700;">Porositë e fundit</div><span class="sl" onclick="go('s-orders','bi-orders')">Shiko të gjitha</span></div>
      <div id="home-list"></div>
    </div>

    <div id="s-orders" class="sc">
      <div class="ph"><div class="pt">Porositë</div><button class="ab" onclick="openNewOrder()"><i class="fa-solid fa-plus"></i></button></div>
      <div class="fr">
        <button class="fc active" onclick="fOrders('all',this)">Të gjitha</button>
        <button class="fc" onclick="fOrders('Në punë',this)">Në punë</button>
        <button class="fc" onclick="fOrders('Gati',this)">Gati</button>
        <button class="fc" onclick="fOrders('Vonuar',this)">Vonuar</button>
        <button class="fc" onclick="fOrders('Kryer',this)">Kryer</button>
      </div>
      <div id="orders-list"></div>
    </div>

    <div id="s-inv" class="sc">
      <div class="ph"><div class="pt">Stoku</div><button class="ab" onclick="openM('m-inv')"><i class="fa-solid fa-plus"></i></button></div>
      <div class="fr">
        <button class="fc active" onclick="fInv('all',this)">Të gjitha</button>
        <button class="fc" onclick="fInv('Letër',this)">Letër</button>
        <button class="fc" onclick="fInv('Bojë',this)">Bojë</button>
        <button class="fc" onclick="fInv('Vinyl',this)">Vinyl</button>
        <button class="fc" onclick="fInv('3D',this)">3D</button>
        <button class="fc" onclick="fInv('Aluminium',this)">Aluminium</button>
        <button class="fc" onclick="fInv('Tjetër',this)">Tjetër</button>
      </div>
      <div id="inv-list"></div>
    </div>

    <div id="s-clients" class="sc">
      <div class="ph"><div class="pt">Klientët</div><button class="ab" onclick="openM('m-client')"><i class="fa-solid fa-plus"></i></button></div>
      <div class="fr">
        <button class="fc active" onclick="fClients('all',this)">Të gjithë</button>
        <button class="fc" onclick="fClients('unpaid',this)">Pa paguar</button>
        <button class="fc" onclick="fClients('paid',this)">Paguar</button>
      </div>
      <div class="sb2 adm" id="debt-sum" style="display:none;"><span style="font-size:13px;color:var(--t2);">Borxh total</span><span style="font-size:17px;font-weight:700;font-family:var(--fm);color:var(--red);" id="total-debt">€ 0</span></div>
      <div id="clients-list"></div>
    </div>

    <div id="s-workers" class="sc">
      <div class="ph"><div class="pt">Punëtorët</div><button class="ab" id="add-w-btn" onclick="openM('m-worker')"><i class="fa-solid fa-plus"></i></button></div>
      <div id="workers-list"></div>
      <div style="font-size:14px;font-weight:700;margin:16px 0 10px;">🏆 Performanca</div>
      <div class="ch" id="perf-chart"></div>
    </div>

    <div id="s-biz" class="sc">
      <div class="ph"><div class="pt">Bisneset</div><button class="ab" onclick="openM('m-biz')"><i class="fa-solid fa-plus"></i></button></div>
      <div class="fr">
        <button class="fc active" onclick="fBiz('all',this)">Të gjitha</button>
        <button class="fc" onclick="fBiz('unpaid',this)">Me borxh</button>
        <button class="fc" onclick="fBiz('paid',this)">Paguar</button>
      </div>
      <div id="biz-list"></div>
    </div>

    <div id="s-terreni" class="sc">
      <div class="ph"><div class="pt">Terreni</div><button class="ab" onclick="openM('m-terreni')"><i class="fa-solid fa-plus"></i></button></div>
      <div class="fr">
        <button class="fc active" onclick="fTerreni('all',this)">Të gjitha</button>
        <button class="fc" onclick="fTerreni('Në pritje',this)">Në pritje</button>
        <button class="fc" onclick="fTerreni('Konfirmuar',this)">Konfirmuar</button>
        <button class="fc" onclick="fTerreni('Kryer',this)">Kryer</button>
      </div>
      <div id="terreni-list"></div>
    </div>

    <div id="s-history" class="sc">
      <div class="ph"><div class="pt">Historiku</div></div>
      <div class="dr"><input type="date" class="df" id="h-from" onchange="renderHistory()"><input type="date" class="df" id="h-to" onchange="renderHistory()"></div>
      <div class="fr">
        <button class="fc active" onclick="fHistory('all',this)">Të gjitha</button>
        <button class="fc" onclick="fHistory('Kryer',this)">Kryer</button>
        <button class="fc" onclick="fHistory('Vonuar',this)">Vonuar</button>
      </div>
      <div class="sb2 adm" id="hist-sum" style="display:none;"><span style="font-size:13px;color:var(--t2);">Totali</span><span style="font-size:17px;font-weight:700;font-family:var(--fm);color:var(--green);" id="hist-total">€ 0</span></div>
      <div id="history-list"></div>
    </div>

    <div id="s-chat" class="sc">
  <div class="ph"><div class="pt">Mesazhet</div></div>
  <div id="chat-messages" style="display:flex;flex-direction:column;gap:8px;margin-bottom:12px;min-height:200px;"></div>
  <div style="position:sticky;bottom:0;background:var(--bg);padding-top:10px;">
    <div style="display:flex;gap:8px;align-items:flex-end;">
      <textarea id="chat-input" placeholder="Shkruaj mesazh..." 
        style="flex:1;padding:10px 14px;border-radius:20px;border:1.5px solid var(--br2);font-size:14px;font-family:var(--ff);background:#fff;color:var(--t1);outline:none;resize:none;max-height:100px;line-height:1.4;" 
        rows="1" oninput="autoResize(this)" onkeypress="chatEnter(event)"></textarea>
      <button onclick="sendMsg()" style="width:42px;height:42px;border-radius:50%;background:var(--red);border:none;color:#fff;font-size:18px;cursor:pointer;flex-shrink:0;display:flex;align-items:center;justify-content:center;box-shadow:0 3px 10px rgba(232,25,44,0.3);">
        <i class="fa-solid fa-paper-plane"></i>
      </button>
    </div>
  </div>
</div>

<div id="s-notif" class="sc">
      <div class="ph"><div class="pt">Njoftimet</div><span class="sl" onclick="clearNotifs()">Pastro</span></div>
      <div id="notif-list"></div>
    </div>
  </div>

  <nav class="bn">
    <button class="bi active" id="bi-home" onclick="go('s-home','bi-home')"><i class="fa-solid fa-house"></i><span>Ballina</span></button>
    <button class="bi" id="bi-chat" onclick="openChat()"><i class="fa-solid fa-comments"></i><span>Mesazhe</span><div class="nd" id="chat-dot" style="display:none;"></div></button>
    <button class="bi" id="bi-orders" onclick="go('s-orders','bi-orders')"><i class="fa-solid fa-clipboard-list"></i><span>Porositë</span></button>
    <button class="bi" id="bi-inv" onclick="go('s-inv','bi-inv')"><i class="fa-solid fa-box"></i><span>Stoku</span></button>
    <button class="bi" id="bi-more" onclick="toggleMore()"><i class="fa-solid fa-ellipsis"></i><span>Më shumë</span><div class="nd" id="nav-dot" style="display:none;"></div></button>
  </nav>
</div>

<div class="mo" id="mo" onclick="closeMore()"></div>
<div class="mm" id="mm">
  <div style="font-size:12px;font-weight:600;color:var(--t3);text-transform:uppercase;letter-spacing:0.5px;margin-bottom:12px;">Më shumë</div>
  <div class="mg">
    <button class="mi" onclick="go('s-clients');closeMore()"><i class="fa-solid fa-users"></i><span>Klientët</span></button>
    <button class="mi" onclick="go('s-workers');closeMore()"><i class="fa-solid fa-id-badge"></i><span>Punëtorët</span></button>
    <button class="mi" onclick="go('s-biz');closeMore()"><i class="fa-solid fa-building"></i><span>Bisneset</span></button>
    <button class="mi" onclick="go('s-terreni');closeMore()"><i class="fa-solid fa-ruler-combined"></i><span>Terreni</span></button>
    <button class="mi" onclick="go('s-history');closeMore()"><i class="fa-solid fa-clock-rotate-left"></i><span>Historiku</span></button>
    <button class="mi" onclick="goNotif();closeMore()"><i class="fa-solid fa-bell"></i><span>Njoftime</span></button>
    <button class="mi" onclick="doLogout()"><i class="fa-solid fa-right-from-bracket" style="color:var(--t2);"></i><span style="color:var(--t2);">Dil</span></button>
  </div>
</div>

<!-- MODALS -->
<div class="ov" id="m-order" onclick="bgClose(event,'m-order')">
  <div class="modal">
    <div class="mh"></div><div class="mt" id="m-order-title">Porosi e re</div>
    <input type="hidden" id="o-eid">
    <div class="fl"><label>Klienti</label><input id="o-c" type="text" placeholder="Emri i klientit" list="cl-dl"><datalist id="cl-dl"></datalist></div>
    <div class="fl"><label>Produkti / Shërbimi</label><input id="o-p" type="text" placeholder="p.sh. Reklamë 3D, Banner..."></div>
    <div class="fl"><label>Sasia</label><input id="o-q" type="text" placeholder="p.sh. 500 copë / 10 m²"></div>
    <div class="fl"><label>Çmimi (€)</label><input id="o-pr" type="number" placeholder="0.00" step="0.01"></div>
    <div class="fl"><label>Mënyra e pagesës</label><select id="o-pm"><option value="">— Zgjidh —</option><option value="kesh">Kesh 💵</option><option value="bankë">Bankë 🏦</option><option value="pa paguar">Pa paguar</option><option value="pjesërisht">Pjesërisht</option></select></div>
    <div class="fl"><label>Statusi i pagesës</label><select id="o-pay"><option value="unpaid">Pa paguar</option><option value="paid">Paguar</option><option value="partial">Pjesërisht</option></select></div>
    <div class="fl"><label>Punëtori</label><select id="o-w"></select></div>
    <div class="fl"><label>Afati</label><input id="o-due" type="date"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-order')">Anulo</button><button class="btn primary" id="o-sbtn" onclick="saveOrder()">Ruaj</button></div>
  </div>
</div>

<div class="ov" id="m-status" onclick="bgClose(event,'m-status')">
  <div class="modal">
    <div class="mh"></div><div class="mt">Veprime</div>
    <button class="sopt" style="color:var(--green);border-color:rgba(0,179,122,0.3);" onclick="setStatus('Gati','green')"><i class="fa-solid fa-check-circle"></i> Gati — Në dorëzim</button>
    <button class="sopt" style="color:var(--amber);border-color:rgba(245,158,11,0.3);" onclick="setStatus('Në punë','amber')"><i class="fa-solid fa-spinner"></i> Vazhdon — Në punë</button>
    <button class="sopt" style="color:var(--red);border-color:rgba(232,25,44,0.3);" onclick="setStatus('Vonuar','red')"><i class="fa-solid fa-clock"></i> Ka vonesë</button>
    <button class="sopt" style="color:var(--pur);border-color:rgba(139,92,246,0.3);background:var(--purl);" onclick="setStatus('Kryer','pur')"><i class="fa-solid fa-circle-check"></i> U realizua — Historik</button>
    <button class="btn sec" style="width:100%;margin-bottom:8px;" onclick="editActiveOrder()"><i class="fa-solid fa-pen"></i> Edito porosinë</button>
    <button class="btn cancel" style="width:100%;" onclick="closeM('m-status')">Mbyll</button>
    <button onclick="deleteActiveOrder()" style="width:100%;margin-top:8px;padding:11px;border-radius:var(--r2);border:none;background:#FFF0F0;color:var(--red);font-size:13px;font-weight:600;cursor:pointer;"><i class="fa-solid fa-trash"></i> Fshi porosinë</button>
  </div>
</div>

<div class="ov" id="m-inv" onclick="bgClose(event,'m-inv')">
  <div class="modal">
    <div class="mh"></div><div class="mt">Shto material</div>
    <div class="fl"><label>Emri (shkruaj çfarë të duash)</label><input id="p-n" type="text" placeholder="p.sh. Reklamë 3D, Alukonbond..."></div>
    <div class="fl"><label>Kategoria</label><select id="p-c"><option>Letër</option><option>Bojë</option><option>Vinyl / Flex</option><option>Karton</option><option>3D</option><option>Aluminium / Alukonbond</option><option>Tabelë</option><option>Tjetër</option></select></div>
    <div class="fl"><label>Njësia</label><select id="p-ut" onchange="toggleUnit()"><option value="riz.">Rizme (riz.)</option><option value="m²">Sipërfaqe (m²)</option><option value="copë">Copë</option><option value="njësi">Njësi</option><option value="ml">Metër linear (ml)</option><option value="kg">Kilogram (kg)</option><option value="tjetër">Tjetër...</option></select></div>
    <div class="fl" id="unit-cw" style="display:none;"><label>Njësia</label><input id="p-uc" type="text" placeholder="p.sh. pako..."></div>
    <div class="fl"><label>Çmimi/njësi (€)</label><input id="p-price" type="number" placeholder="0.00" step="0.01"></div>
    <div class="fl"><label>Sasia aktuale</label><input id="p-q" type="number" placeholder="0"></div>
    <div class="fl"><label>Alarm kur mbaron (min. sasi)</label><input id="p-m" type="number" placeholder="2"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-inv')">Anulo</button><button class="btn primary" onclick="addInv()">Shto</button></div>
  </div>
</div>

<div class="ov" id="m-worker" onclick="bgClose(event,'m-worker')">
  <div class="modal">
    <div class="mh"></div><div class="mt">Shto punëtor</div>
    <div class="fl"><label>Emri i plotë</label><input id="w-n" type="text" placeholder="Emri Mbiemri"></div>
    <div class="fl"><label>PIN / Fjalëkalimi</label><input id="w-pin" type="text" placeholder="p.sh. 1234"></div>
    <div class="fl"><label>Roli</label><select id="w-r"><option>Punëtor</option><option>Admin</option></select></div>
    <div class="fl"><label>Telefoni</label><input id="w-p" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-worker')">Anulo</button><button class="btn primary" onclick="addWorker()">Shto</button></div>
  </div>
</div>

<div class="ov" id="m-client" onclick="bgClose(event,'m-client')">
  <div class="modal">
    <div class="mh"></div><div class="mt" id="m-client-title">Shto klient</div>
    <input type="hidden" id="cl-eid">
    <div class="fl"><label>Emri / Kompania</label><input id="cl-n" type="text" placeholder="Emri i klientit"></div>
    <div class="fl"><label>Numri i telefonit</label><input id="cl-p" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="fl"><label>Borxhi (€)</label><input id="cl-d" type="number" placeholder="0.00" step="0.01"></div>
    <div class="fl"><label>Shënim (për çfarë)</label><input id="cl-note" type="text" placeholder="p.sh. Banner, Broshurë..."></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-client')">Anulo</button><button class="btn primary" onclick="saveClient()">Ruaj</button></div>
  </div>
</div>

<div class="ov" id="m-client-detail" onclick="bgClose(event,'m-client-detail')">
  <div class="modal">
    <div class="mh"></div><div class="mt" id="cd-title">Klienti</div>
    <div id="cd-body"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-client-detail')">Mbyll</button><button class="btn sec" id="cd-edit-btn">Edito</button></div>
  </div>
</div>

<div class="ov" id="m-payment" onclick="bgClose(event,'m-payment')">
  <div class="modal">
    <div class="mh"></div><div class="mt">💰 Regjistro pagesën</div>
    <input type="hidden" id="pay-cid">
    <div class="fl"><label>Klienti</label><input id="pay-cname" type="text" readonly style="background:var(--bg);"></div>
    <div class="fl"><label>Borxhi total</label><input id="pay-debt" type="text" readonly style="background:var(--bg);color:var(--red);font-weight:700;"></div>
    <div class="fl"><label>Shuma e paguar (€)</label><input id="pay-amt" type="number" placeholder="0.00" step="0.01"></div>
    <div class="fl"><label>Mënyra e pagesës</label><select id="pay-meth"><option value="kesh">Kesh 💵</option><option value="bankë">Bankë / Transfer 🏦</option></select></div>
    <div class="fl"><label>Punëtori që pranoi pagesën</label><select id="pay-wrkr"></select></div>
    <div class="fl"><label>Shënim (opsional)</label><input id="pay-note" type="text" placeholder="p.sh. faturë nr. 123..."></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-payment')">Anulo</button><button class="btn primary" onclick="confirmPayment()">Konfirmo ✓</button></div>
  </div>
</div>

<div class="ov" id="m-biz" onclick="bgClose(event,'m-biz')">
  <div class="modal">
    <div class="mh"></div><div class="mt">Shto biznes</div>
    <div class="fl"><label>Emri i biznesit</label><input id="b-n" type="text" placeholder="p.sh. Albdesign SH.P.K."></div>
    <div class="fl"><label>Kontakti</label><input id="b-con" type="text" placeholder="Emri i kontaktit"></div>
    <div class="fl"><label>Telefoni</label><input id="b-p" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="fl"><label>Adresa</label><input id="b-addr" type="text" placeholder="Adresa"></div>
    <div class="fl"><label>Borxhi (€)</label><input id="b-d" type="number" placeholder="0.00" step="0.01"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-biz')">Anulo</button><button class="btn primary" onclick="addBiz()">Shto</button></div>
  </div>
</div>

<div class="ov" id="m-biz-detail" onclick="bgClose(event,'m-biz-detail')">
  <div class="modal">
    <div class="mh"></div><div class="mt" id="bd-title">Biznesi</div>
    <div id="bd-body"></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-biz-detail')">Mbyll</button><button class="btn ok" id="bd-pay-btn">Shëno paguar ✓</button></div>
  </div>
</div>

<div class="ov" id="m-terreni" onclick="bgClose(event,'m-terreni')">
  <div class="modal">
    <div class="mh"></div><div class="mt">📍 Matje në Terren</div>
    <div class="fl"><label>Klienti</label><input id="t-c" type="text" placeholder="Emri i klientit" list="cl-dl"></div>
    <div class="fl"><label>Telefoni i klientit</label><input id="t-phone" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="fl"><label>Adresa</label><input id="t-addr" type="text" placeholder="Rr. Nëna Terezë, Prishtinë"></div>
    <div class="fl"><label>Google Maps Link</label><input id="t-maps" type="url" placeholder="https://maps.google.com/..."></div>
    <div class="fl">
      <label>Lloji i punës</label>
      <div style="display:flex;gap:6px;">
        <input id="t-type" type="text" list="t-type-list" placeholder="p.sh. Xham, Reklamë 3D..." style="flex:1;padding:12px 14px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:14px;font-family:var(--ff);background:var(--bg);color:var(--t1);outline:none;">
        <datalist id="t-type-list"><option>Xham / Dritare</option><option>Reklamë 3D</option><option>Alukonbond / Fasadë</option><option>Tabelë</option><option>Vinyl / Sticker</option><option>Banner / Roll-up</option><option>Neon / LED</option><option>Tjetër</option></datalist>
        <button type="button" onclick="addCustomType()" style="width:42px;height:46px;border-radius:var(--r2);background:var(--red);border:none;color:#fff;font-size:20px;cursor:pointer;flex-shrink:0;font-weight:700;">+</button>
      </div>
    </div>
    <div class="fl">
      <label>Masat (shto sa të duash)</label>
      <div id="masa-rows"></div>
      <button type="button" onclick="addMasaRow()" style="width:100%;padding:9px;border-radius:var(--r3);border:1.5px dashed rgba(232,25,44,0.3);background:var(--redl);color:var(--red);font-size:12px;font-weight:600;cursor:pointer;margin-top:4px;"><i class="fa-solid fa-plus"></i> Shto masë tjetër</button>
    </div>
    <div class="fl"><label>Sasia (copë)</label><input id="t-qty" type="number" placeholder="1" value="1"></div>
    <div class="fl">
      <label>Foto nga terreni (deri 8 foto)</label>
      <div style="display:flex;gap:8px;margin-bottom:10px;">
        <button type="button" onclick="document.getElementById('t-cam').click()" style="flex:1;padding:12px 6px;border-radius:var(--r2);border:1.5px dashed rgba(232,25,44,0.3);background:var(--redl);cursor:pointer;text-align:center;">
          <i class="fa-solid fa-camera" style="font-size:20px;color:var(--red);display:block;margin-bottom:4px;"></i>
          <div style="font-size:12px;font-weight:600;color:var(--red);">Bëj foto</div>
        </button>
        <button type="button" onclick="document.getElementById('t-gallery').click()" style="flex:1;padding:12px 6px;border-radius:var(--r2);border:1.5px dashed rgba(59,130,246,0.3);background:var(--bluel);cursor:pointer;text-align:center;">
          <i class="fa-solid fa-image" style="font-size:20px;color:var(--blue);display:block;margin-bottom:4px;"></i>
          <div style="font-size:12px;font-weight:600;color:var(--blue);">Nga galeria</div>
        </button>
      </div>
      <input type="file" id="t-cam" accept="image/*" capture="environment" style="display:none;" onchange="addPhoto(this)">
      <input type="file" id="t-gallery" accept="image/*" multiple style="display:none;" onchange="addPhotos(this)">
      <div id="t-photos-grid" style="display:grid;grid-template-columns:1fr 1fr;gap:8px;"></div>
      <div id="t-photo-count" style="font-size:11px;color:var(--t2);margin-top:6px;text-align:center;"></div>
    </div>
    <div class="fl"><label>Shënime</label><textarea id="t-notes" placeholder="Ngjyra, materiali..." style="height:60px;resize:none;width:100%;padding:12px 14px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:14px;font-family:var(--ff);background:var(--bg);color:var(--t1);outline:none;"></textarea></div>
    <div class="fl"><label>Punëtori</label><select id="t-worker"></select></div>
    <div class="br3"><button class="btn cancel" onclick="closeM('m-terreni')">Anulo</button><button class="btn primary" onclick="addTerreni()">Dërgo ✓</button></div>
  </div>
</div>

<div class="ov" id="m-terreni-view" onclick="bgClose(event,'m-terreni-view')">
  <div class="modal">
    <div class="mh"></div><div class="mt" id="tv-title">Detajet</div>
    <div id="tv-body"></div>
    <div id="tv-status" style="margin-top:12px;"></div>
    <button class="btn sec" style="width:100%;margin-top:8px;" onclick="openTerreniEdit()"><i class="fa-solid fa-pen"></i> Edito matjen</button>
    <button onclick="deleteTerreni()" style="width:100%;margin-top:8px;padding:12px;border-radius:var(--r2);border:none;background:#FFF0F0;color:var(--red);font-size:14px;font-weight:600;cursor:pointer;"><i class="fa-solid fa-trash"></i> Fshi këtë matje</button>
    <button class="btn cancel" style="width:100%;margin-top:8px;" onclick="closeM('m-terreni-view')">Mbyll</button>
  </div>
</div>

<div class="ov" id="m-terreni-edit" onclick="bgClose(event,'m-terreni-edit')">
  <div class="modal">
    <div class="mh"></div><div class="mt">✏️ Edito matjen</div>
    <input type="hidden" id="te-id">
    <div class="fl"><label>Klienti</label><input id="te-c" type="text" placeholder="Emri i klientit"></div>
    <div class="fl"><label>Telefoni i klientit</label><input id="te-phone" type="tel" placeholder="+383 4X XXX XXX"></div>
    <div class="fl"><label>Adresa</label><input id="te-addr" type="text" placeholder="Adresa"></div>
    <div class="fl"><label>Google Maps Link</label><input id="te-maps" type="url" placeholder="https://maps.google.com/..."></div>
    <div class="fl"><label>Lloji i punës</label><input id="te-type" type="text" placeholder="p.sh. Xham, Reklamë 3D..."></div>
    <div class="fl"><label>Shënime</label><textarea id="te-notes" style="height:60px;resize:none;width:100%;padding:12px 14px;border-radius:var(--r2);border:1.5px solid var(--br2);font-size:14px;font-family:var(--ff);background:var(--bg);color:var(--t1);outline:none;" placeholder="Shënime..."></textarea></div>
    <div class="fl">
      <label>Foto ekzistuese</label>
      <div id="te-existing-photos" style="display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-bottom:8px;"></div>
      <label style="margin-top:8px;">Shto foto të reja</label>
      <div style="display:flex;gap:8px;margin-top:6px;">
        <button type="button" onclick="document.getElementById('te-cam').click()" style="flex:1;padding:10px;border-radius:var(--r2);border:1.5px dashed rgba(232,25,44,0.3);background:var(--redl);cursor:pointer;text-align:center;font-size:12px;font-weight:600;color:var(--red);"><i class="fa-solid fa-camera"></i> Bëj foto</button>
        <button type="button" onclick="document.getElementById('te-gallery').click()" style="flex:1;padding:10px;border-radius:var(--r2);border:1.5px dashed rgba(59,130,246,0.3);background:var(--bluel);cursor:pointer;text-align:center;font-size:12px;font-weight:600;color:var(--blue);"><i class="fa-solid fa-image"></i> Nga galeria</button>
      </div>
      <input type="file" id="te-cam" accept="image/*" capture="environment" style="display:none;" onchange="addTerreniEditPhoto(this)">
      <input type="file" id="te-gallery" accept="image/*" multiple style="display:none;" onchange="addTerreniEditPhotos(this)">
      <div id="te-new-photos" style="display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-top:8px;"></div>
    </div>
    <div class="br3">
      <button class="btn cancel" onclick="closeM('m-terreni-edit')">Anulo</button>
      <button class="btn primary" onclick="saveTerreniEdit()">Ruaj ndryshimet</button>
    </div>
  </div>
</div>

<!-- ZOOM -->
<div class="zoom-bg" id="zoom-bg" onclick="closeZoom()">
  <img id="zoom-img" src="">
  <button class="zoom-close" onclick="closeZoom()">✕</button>
</div>

<div class="toast" id="toast"></div>

<script type="module">
import{initializeApp}from"https://www.gstatic.com/firebasejs/11.0.0/firebase-app.js";
import{getFirestore,collection,addDoc,doc,updateDoc,deleteDoc,onSnapshot,query,orderBy,serverTimestamp}from"https://www.gstatic.com/firebasejs/11.0.0/firebase-firestore.js";

const FB={apiKey:"AIzaSyAE2hpDlkfLkIEGDOviPX64PJVY1-kfJIY",authDomain:"cpictures-44339.firebaseapp.com",projectId:"cpictures-44339",storageBucket:"cpictures-44339.firebasestorage.app",messagingSenderId:"1086138474106",appId:"1:1086138474106:web:5835bc5a3a04000c5b65c3"};
const db=getFirestore(initializeApp(FB));

var cu=null,oFlt='all',iFlt='all',cFlt='all',bFlt='all',tFlt='all',hFlt='all';
var aOrdId=null,aTerData=null,photoB64=null,masaN=0,dip=null;
var orders=[],inventory=[],workers=[],clients=[],bizList=[],terrList=[],notifs=[],nc=0;

function G(id){return document.getElementById(id);}
window.G=G;
function toast(msg){var t=G('toast');t.textContent=msg;t.classList.add('show');setTimeout(function(){t.classList.remove('show');},2800);}
function openM(id){G(id).classList.add('open');}
function closeM(id){G(id).classList.remove('open');}
function bgClose(e,id){if(e.target.id===id)closeM(id);}
window.openM=openM;window.closeM=closeM;window.bgClose=bgClose;
function ini(n){return n.split(' ').map(function(w){return w[0];}).join('').substring(0,2).toUpperCase();}
function bcls(s){return s==='Gati'?'green':s==='Në punë'?'amber':s==='Vonuar'?'red':s==='Kryer'?'pur':'blue';}
function today(){return new Date().toISOString().slice(0,10);}
function fmtD(d){if(!d)return'';var p=d.slice(0,10).split('-');return p.length===3?p[2]+'.'+p[1]+'.'+p[0]:d;}

// MORE MENU
function toggleMore(){var m=G('mm'),o=G('mo');var op=m.classList.contains('open');if(op){m.classList.remove('open');o.classList.remove('open');}else{m.classList.add('open');o.classList.add('open');}}
function closeMore(){G('mm').classList.remove('open');G('mo').classList.remove('open');}
window.toggleMore=toggleMore;window.closeMore=closeMore;

// NAV
function go(sid,bid){
  document.querySelectorAll('.sc').forEach(function(s){s.classList.remove('active');});
  document.querySelectorAll('.bi').forEach(function(b){b.classList.remove('active');});
  G(sid).classList.add('active');
  if(bid)G(bid).classList.add('active');
  G('app').querySelector('.sa').scrollTop=0;
  closeMore();
}
window.go=go;
function goNotif(){go('s-notif');nc=0;updBadge();}
window.goNotif=goNotif;

// PWA
window.addEventListener('beforeinstallprompt',function(e){e.preventDefault();dip=e;showInstBanner();});
function showInstBanner(){
  var w=G('inst-wrap');if(!w)return;
  w.innerHTML='<div class="inst-banner" onclick="showInstall()"><i class="fa-solid fa-mobile-screen"></i><div><div class="inst-t">Instalo CPictures si App!</div><div class="inst-s">Shto në ekranin kryesor — funksionon pa internet</div></div></div>';
}
function showInstall(){if(dip){dip.prompt();dip=null;G('inst-wrap').innerHTML='';}else toast('Hap menu browser (⋮) → Add to Home Screen');}
window.showInstall=showInstall;

function sendPN(title,body){
  if(navigator.vibrate)navigator.vibrate([200,100,200]);
  if('Notification' in window&&Notification.permission==='granted'){
    try{new Notification(title,{body:body,icon:'https://img.icons8.com/color/96/camera.png',tag:'cp-'+Date.now()});}catch(e){}
  }
}
function reqNotif(){if('Notification' in window&&Notification.permission==='default')Notification.requestPermission();}

// LOGIN
function doLogin(){
  var pin=G('l-pin').value.trim().toLowerCase();
  if(!pin){G('l-err').textContent='Shkruaj PIN-in!';return;}
  var found=workers.find(function(w){return (w.pin||'').toLowerCase()===pin||w.name.toLowerCase()===pin;});
  if(!found&&(pin==='admin123'||pin==='besnik'))found={name:'Besnik',pin:'admin123',role:'Admin',color:['rgba(232,25,44,0.1)','#E8192C']};
  if(!found){G('l-err').textContent='PIN i gabuar!';return;}
  cu=found;localStorage.setItem('cpu',JSON.stringify(found));showApp();reqNotif();
}
window.doLogin=doLogin;

function doLogout(){cu=null;localStorage.removeItem('cpu');G('app').style.display='none';G('login').classList.add('show');G('l-pin').value='';G('l-err').textContent='';}
window.doLogout=doLogout;

function showApp(){
  G('login').classList.remove('show');G('app').style.display='flex';
  var isAdm=cu&&cu.role==='Admin';
  document.querySelectorAll('.adm').forEach(function(el){el.style.display=isAdm?'':'none';});
  if(isAdm){G('c-fit').style.display='';G('c-mua').style.display='';G('debt-sum').style.display='flex';G('hist-sum').style.display='flex';}
  if(G('add-w-btn'))G('add-w-btn').style.display=isAdm?'flex':'none';
  fillWSel();renderHome();updBadge();
  if(new Date().getDay()===1){
    var up=clients.filter(function(c){return !c.paid&&parseFloat(c.debt||0)>0;});
    if(up.length){var nm=up.slice(0,3).map(function(c){return c.name+' (€'+c.debt+')';}).join(' · ');addN('📅 Obligime javore',nm,'Sistem','#E8192C','Borxh','red');}
  }
}

// LISTENERS
function startL(){
  onSnapshot(query(collection(db,'orders'),orderBy('createdAt','desc')),function(snap){orders=[];snap.forEach(function(d){orders.push(Object.assign({id:d.id},d.data()));});renderHome();renderOrders();renderHistory();});
  onSnapshot(collection(db,'inventory'),function(snap){inventory=[];snap.forEach(function(d){inventory.push(Object.assign({id:d.id},d.data()));});renderInv();});
  onSnapshot(collection(db,'workers'),function(snap){workers=[];snap.forEach(function(d){workers.push(Object.assign({id:d.id},d.data()));});fillWSel();renderWorkers();});
  onSnapshot(collection(db,'clients'),function(snap){clients=[];snap.forEach(function(d){clients.push(Object.assign({id:d.id},d.data()));});renderClients();renderHome();fillDL();});
  onSnapshot(collection(db,'businesses'),function(snap){bizList=[];snap.forEach(function(d){bizList.push(Object.assign({id:d.id},d.data()));});renderBiz();});
  onSnapshot(query(collection(db,'terreni'),orderBy('createdAt','desc')),function(snap){terrList=[];snap.forEach(function(d){terrList.push(Object.assign({id:d.id},d.data()));});renderTerreni();});
  onSnapshot(query(collection(db,'notifications'),orderBy('createdAt','desc')),function(snap){notifs=[];snap.forEach(function(d){notifs.push(Object.assign({id:d.id},d.data()));});nc=notifs.filter(function(n){return !n.read;}).length;updBadge();renderNotifs();});
}

function fillDL(){var dl=G('cl-dl');if(!dl)return;dl.innerHTML='';clients.forEach(function(c){var o=document.createElement('option');o.value=c.name;dl.appendChild(o);});}
function updBadge(){G('nb').textContent=nc;G('nb').style.display=nc>0?'flex':'none';G('nav-dot').style.display=nc>0?'block':'none';}
async function clearNotifs(){for(var i=0;i<notifs.length;i++){try{await deleteDoc(doc(db,'notifications',notifs[i].id));}catch(e){}}nc=0;updBadge();}window.clearNotifs=clearNotifs;
async function addN(text,desc,worker,color,badge,cls){try{await addDoc(collection(db,'notifications'),{text:text,desc:desc,worker:worker,color:color,badge:badge,cls:cls,read:false,createdAt:serverTimestamp()});sendPN(text,desc);}catch(e){}}

function renderHome(){
  var active=orders.filter(function(o){return !o.done;});
  var bx=clients.filter(function(c){return !c.paid&&parseFloat(c.debt||0)>0;}).length;
  G('st-por').textContent=active.length;G('st-bor').textContent=bx;
  if(cu&&cu.role==='Admin'){
    var td=today();
    var fs=orders.filter(function(o){return o.date===td&&o.pay==='paid';}).reduce(function(a,b){return a+parseFloat(b.price||0);},0);
    var m=new Date().getMonth();var y=new Date().getFullYear();
    var fm=orders.filter(function(o){var d=new Date(o.date||'');return d.getMonth()===m&&d.getFullYear()===y&&o.pay==='paid';}).reduce(function(a,b){return a+parseFloat(b.price||0);},0);
    G('st-fit').textContent='€ '+fs.toFixed(2);G('st-mua').textContent='€ '+fm.toFixed(2);
  }
  var l=G('home-list');if(!l)return;l.innerHTML='';
  var show=active.slice(0,5);
  if(!show.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clipboard-check"></i><p>Asnjë porosi aktive</p></div>';return;}
  show.forEach(function(o,i){l.appendChild(mkCard(o,i));});
}

function mkCard(o,idx){
  var cl=bcls(o.status);
  var ic={'green':['#E8FFF5','#00B37A'],'amber':['#FFF8E7','#F59E0B'],'red':['#FFF0F0','#E8192C'],'pur':['#F5F0FF','#8B5CF6'],'blue':['#EFF6FF','#3B82F6']};
  var c=ic[cl]||ic.blue;
  var payB=o.pay==='paid'?'<span class="badge green">Paguar</span>':o.pay==='partial'?'<span class="badge amber">Pjesërisht</span>':'<span class="badge red">Pa paguar</span>';
  var pmB=o.paymethod?'<span class="badge gray" style="margin-left:3px;">'+o.paymethod+'</span>':'';
  var num='#'+(1000+(orders.indexOf(o)>=0?orders.indexOf(o):idx));
  var el=document.createElement('div');el.className='card';
  el.innerHTML='<div class="ci" style="background:'+c[0]+';"><i class="fa-solid fa-file-invoice" style="color:'+c[1]+';font-size:15px;"></i></div>'
    +'<div class="cb"><div class="cn">'+num+'</div><div class="ct">'+(o.client||'')+'</div><div class="cs">'+(o.prod||'')+' · '+fmtD(o.date)+'</div></div>'
    +'<div class="cr"><div class="cp">€ '+parseFloat(o.price||0).toFixed(2)+'</div><div style="margin-top:4px;">'+payB+pmB+'</div><div style="margin-top:3px;"><span class="badge '+cl+'">'+o.status+'</span></div></div>';
  el.onclick=function(){aOrdId=o.id;openM('m-status');};
  return el;
}

function fOrders(f,el){oFlt=f;document.querySelectorAll('#s-orders .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderOrders();}window.fOrders=fOrders;
function renderOrders(){var l=G('orders-list');if(!l)return;l.innerHTML='';var list=orders.filter(function(o){return oFlt==='all'?!o.done:oFlt==='Kryer'?o.done:o.status===oFlt&&!o.done;});if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clipboard-list"></i><p>Asnjë porosi</p></div>';return;}list.forEach(function(o,i){l.appendChild(mkCard(o,i));});}

function fInv(f,el){iFlt=f;document.querySelectorAll('#s-inv .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderInv();}window.fInv=fInv;
function renderInv(){
  var l=G('inv-list');if(!l)return;l.innerHTML='';
  var list=inventory.filter(function(i){return iFlt==='all'||i.cat.includes(iFlt);});
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-box"></i><p>Asnjë material</p></div>';return;}
  list.forEach(function(item){
    var min=parseFloat(item.min)||1;var qty=parseFloat(item.qty)||0;
    var pct=Math.min(100,Math.round((qty/Math.max(min*3,qty,1))*100));
    var col=qty<=min?'#E8192C':qty<=min*2?'#F59E0B':'#00B37A';
    var ibg=qty<=min?'#FFF0F0':qty<=min*2?'#FFF8E7':'#EFF6FF';
    var ic2=qty<=min?'#E8192C':qty<=min*2?'#F59E0B':'#3B82F6';
    var warn=qty<=min?'<div style="font-size:11px;color:#E8192C;margin-top:4px;font-weight:500;"><i class="fa-solid fa-triangle-exclamation"></i> Pothuaj mbaroi!</div>':qty<=min*2?'<div style="font-size:11px;color:#F59E0B;margin-top:4px;">Stok i ulët</div>':'';
    var el=document.createElement('div');el.className='inv';
    el.innerHTML='<div style="display:flex;align-items:center;gap:10px;">'
      +'<div class="ci" style="background:'+ibg+';"><i class="fa-solid fa-box-archive" style="color:'+ic2+';font-size:14px;"></i></div>'
      +'<div style="flex:1;"><div style="display:flex;justify-content:space-between;margin-bottom:6px;"><span style="font-size:14px;font-weight:600;">'+item.name+'</span><span style="font-size:14px;font-weight:700;color:'+col+';font-family:var(--fm);">'+qty+' '+item.unit+'</span></div>'
      +'<div class="pb"><div class="pf" style="width:'+pct+'%;background:'+col+';"></div></div>'
      +(item.unitPrice?'<div style="font-size:11px;color:var(--t2);margin-top:4px;">€'+item.unitPrice+'/'+item.unit+' · '+item.cat+'</div>':'')
      +warn+'</div></div>';
    l.appendChild(el);
  });
}

function renderWorkers(){
  var l=G('workers-list');if(!l)return;l.innerHTML='';
  var cols=[['rgba(232,25,44,0.1)','#E8192C'],['rgba(59,130,246,0.1)','#3B82F6'],['rgba(245,158,11,0.1)','#F59E0B'],['rgba(0,179,122,0.1)','#00B37A'],['rgba(139,92,246,0.1)','#8B5CF6']];
  workers.forEach(function(w,i){
    var c=w.color||cols[i%cols.length];
    var isAdm=cu&&cu.role==='Admin';
    var el=document.createElement('div');el.className='card';
    var rc='<span class="role-chip '+(w.role==='Admin'?'admin':'worker')+'">'+w.role+'</span>';
    var db2=isAdm?'<button onclick="event.stopPropagation();delWorker(\''+w.id+'\')" style="padding:6px 10px;border-radius:8px;background:#FFF0F0;border:none;color:#E8192C;font-size:12px;cursor:pointer;"><i class="fa-solid fa-trash"></i></button>':'';
    el.innerHTML='<div class="av" style="background:'+c[0]+';color:'+c[1]+';">'+ini(w.name)+'</div>'
      +'<div class="cb"><div class="ct">'+w.name+' '+rc+'</div><div class="cs">'+(parseInt(w.done)||0)+' kryer · '+(parseInt(w.orders)||0)+' total'+(w.phone?' · '+w.phone:'')+'</div></div>'+db2;
    l.appendChild(el);
  });
  // Performance chart
  var pc=G('perf-chart');if(!pc)return;pc.innerHTML='';
  if(!workers.length){pc.innerHTML='<div class="empty" style="padding:16px;"><p>Asnjë punëtor</p></div>';return;}
  var clrs=['#E8192C','#3B82F6','#F59E0B','#00B37A','#8B5CF6'];
  var dones=workers.map(function(w){return parseInt(w.done)||0;});
  var maxD=dones.length>0?Math.max.apply(null,dones.concat([1])):1;
  workers.forEach(function(w,i){
    var done=parseInt(w.done)||0;
    var total=parseInt(w.orders)||0;
    var pct=Math.round((done/maxD)*100);
    var pctT=total>0?Math.round((done/total)*100):0;
    var bar=document.createElement('div');bar.style.marginBottom='14px';
    bar.innerHTML='<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;">'
      +'<div style="display:flex;align-items:center;gap:8px;">'
      +'<div style="width:30px;height:30px;border-radius:50%;background:'+clrs[i%clrs.length]+'22;display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;color:'+clrs[i%clrs.length]+';">'+ini(w.name)+'</div>'
      +'<span style="font-size:13px;font-weight:600;">'+w.name.split(' ')[0]+'</span></div>'
      +'<span style="font-size:13px;font-weight:700;font-family:var(--fm);color:'+clrs[i%clrs.length]+';">'+done+' kryer</span></div>'
      +'<div style="height:9px;background:var(--bg);border-radius:5px;overflow:hidden;">'
      +'<div style="height:100%;width:'+pct+'%;background:'+clrs[i%clrs.length]+';border-radius:5px;"></div></div>'
      +'<div style="display:flex;justify-content:space-between;margin-top:3px;">'
      +'<span style="font-size:10px;color:var(--t3);">'+total+' totale</span>'
      +'<span style="font-size:10px;color:var(--t3);">'+pctT+'% i kryer</span></div>';
    pc.appendChild(bar);
  });
}

function fClients(f,el){cFlt=f;document.querySelectorAll('#s-clients .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderClients();}window.fClients=fClients;
function renderClients(){
  var l=G('clients-list');if(!l)return;l.innerHTML='';
  var total=clients.filter(function(c){return !c.paid&&parseFloat(c.debt||0)>0;}).reduce(function(a,b){return a+parseFloat(b.debt||0);},0);
  var td=G('total-debt');if(td)td.textContent='€ '+total.toFixed(2);
  var list=clients.filter(function(c){return cFlt==='unpaid'?(!c.paid&&parseFloat(c.debt||0)>0):cFlt==='paid'?(c.paid||parseFloat(c.debt||0)===0):true;});
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-users"></i><p>Asnjë klient</p></div>';return;}
  list.forEach(function(c){
    var isPaid=c.paid||parseFloat(c.debt||0)===0;
    var debt=parseFloat(c.debt||0);
    var el=document.createElement('div');el.className='cc';
    var payHist='';
    if(c.payments&&c.payments.length){
      var last=c.payments.slice(-2);
      payHist=last.map(function(p){return '<div style="font-size:10px;color:var(--t3);margin-top:2px;">✓ €'+parseFloat(p.amount||0).toFixed(2)+' · '+p.method+' · '+(p.worker||'')+'</div>';}).join('');
    }
    el.innerHTML='<div style="display:flex;align-items:center;gap:10px;margin-bottom:10px;">'
      +'<div class="av" style="background:var(--redl);color:var(--red);">'+ini(c.name)+'</div>'
      +'<div style="flex:1;"><div style="font-size:14px;font-weight:600;">'+c.name+'</div>'
      +(c.note?'<div style="font-size:11px;color:var(--t2);">'+c.note+'</div>':'')
      +(c.phone?'<a href="tel:'+c.phone+'" style="font-size:11px;color:var(--blue);text-decoration:none;" onclick="event.stopPropagation()"><i class="fa-solid fa-phone"></i> '+c.phone+'</a>':'')
      +payHist+'</div>'
      +'<span style="font-size:16px;font-weight:700;font-family:var(--fm);color:'+(isPaid?'var(--green)':'var(--red)')+';">'+(isPaid?'Paguar':'€ '+debt.toFixed(2))+'</span>'
      +'</div>'
      +'<div style="display:flex;gap:8px;">'
      +(!isPaid?'<button onclick="event.stopPropagation();openPayModal(\''+c.id+'\')" style="flex:1;padding:9px 12px;border-radius:var(--r3);border:none;background:var(--red);color:#fff;font-size:13px;font-weight:700;cursor:pointer;box-shadow:0 2px 8px rgba(232,25,44,0.3);">💰 Regjistro pagesën</button>':'')
      +'<button onclick="event.stopPropagation();togglePay(\''+c.id+'\')" style="padding:9px 12px;border-radius:var(--r3);border:none;background:'+(isPaid?'var(--redl)':'var(--greenl)')+';color:'+(isPaid?'var(--red)':'var(--green)')+';font-size:12px;font-weight:600;cursor:pointer;">'+(isPaid?'Pa paguar':'Paguar ✓')+'</button>'
      +'</div>';
    el.onclick=function(){viewClient(c);};
    l.appendChild(el);
  });
}

function viewClient(c){
  G('cd-title').textContent=c.name;
  var isPaid=c.paid||parseFloat(c.debt||0)===0;
  var cOrds=orders.filter(function(o){return o.client===c.name;});
  var ordH=cOrds.length?cOrds.slice(0,5).map(function(o){return '<div style="display:flex;justify-content:space-between;padding:8px 0;border-bottom:1px solid var(--br);"><div><div style="font-size:13px;font-weight:500;">'+o.prod+'</div><div style="font-size:11px;color:var(--t2);">'+fmtD(o.date)+'</div></div><div style="text-align:right;"><div style="font-size:14px;font-weight:700;font-family:var(--fm);">€'+parseFloat(o.price||0).toFixed(2)+'</div><span class="badge '+bcls(o.status)+'">'+o.status+'</span></div></div>';}).join(''):'<div style="font-size:13px;color:var(--t3);padding:10px 0;">Asnjë porosi</div>';
  G('cd-body').innerHTML='<div style="font-size:14px;color:var(--t2);line-height:2;margin-bottom:12px;">'
    +(c.phone?'<div><b style="color:var(--t1);">Tel:</b> <a href="tel:'+c.phone+'" style="color:var(--blue);">'+c.phone+'</a></div>':'')
    +'<div><b style="color:var(--t1);">Borxhi:</b> <span style="color:'+(isPaid?'var(--green)':'var(--red)')+';font-weight:700;">'+(isPaid?'Paguar':'€'+parseFloat(c.debt||0).toFixed(2))+'</span></div>'
    +(c.note?'<div><b style="color:var(--t1);">Shënim:</b> '+c.note+'</div>':'')
    +'</div><div style="font-size:11px;font-weight:700;color:var(--t3);text-transform:uppercase;margin-bottom:6px;">Porositë</div>'+ordH;
  G('cd-edit-btn').onclick=function(){closeM('m-client-detail');editClient(c);};
  openM('m-client-detail');
}window.viewClient=viewClient;

function editClient(c){G('m-client-title').textContent='Edito klientin';G('cl-eid').value=c.id;G('cl-n').value=c.name||'';G('cl-p').value=c.phone||'';G('cl-d').value=c.debt||0;G('cl-note').value=c.note||'';openM('m-client');}
async function saveClient(){
  var n=G('cl-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var debt=parseFloat(G('cl-d').value)||0;var eid=G('cl-eid').value;
  var data={name:n,phone:G('cl-p').value,debt:debt,paid:debt===0,note:G('cl-note').value.trim()};
  try{if(eid){await updateDoc(doc(db,'clients',eid),data);toast('U përditësua!');}else{data.createdAt=serverTimestamp();await addDoc(collection(db,'clients'),data);toast(n+' u shtua!');}closeM('m-client');G('cl-n').value='';G('cl-p').value='';G('cl-d').value='';G('cl-note').value='';G('cl-eid').value='';G('m-client-title').textContent='Shto klient';}catch(e){toast('Gabim: '+e.message);}
}window.saveClient=saveClient;

function openPayModal(id){
  var c=clients.find(function(x){return x.id===id;});if(!c)return;
  G('pay-cid').value=id;G('pay-cname').value=c.name;G('pay-debt').value='€ '+parseFloat(c.debt||0).toFixed(2)+' borxh';G('pay-amt').value=parseFloat(c.debt||0).toFixed(2);
  var s=G('pay-wrkr');s.innerHTML='';
  if(cu){var o=document.createElement('option');o.value=cu.name;o.textContent=cu.name+' (unë)';s.appendChild(o);}
  workers.forEach(function(w){if(cu&&w.name===cu.name)return;var o=document.createElement('option');o.value=w.name;o.textContent=w.name;s.appendChild(o);});
  openM('m-payment');
}window.openPayModal=openPayModal;

async function confirmPayment(){
  var id=G('pay-cid').value;var c=clients.find(function(x){return x.id===id;});if(!c)return;
  var amt=parseFloat(G('pay-amt').value)||0;if(amt<=0){toast('Shkruaj shumën!');return;}
  var meth=G('pay-meth').value;var wrkr=G('pay-wrkr').value||cu.name;var note=G('pay-note').value.trim();
  var newDebt=Math.max(0,parseFloat(c.debt||0)-amt);var isPaid=newDebt<=0;
  var pymt={amount:amt,method:meth,worker:wrkr,note:note,date:today()};
  var pymts=(c.payments||[]).concat([pymt]);
  try{
    await updateDoc(doc(db,'clients',id),{debt:newDebt,paid:isPaid,payments:pymts});
    if(isPaid){
      var cOrds=orders.filter(function(o){return o.client===c.name&&!o.done&&o.pay!=='paid';});
      for(var i=0;i<cOrds.length;i++){await updateDoc(doc(db,'orders',cOrds[i].id),{pay:'paid',paymethod:meth,done:true,status:'Kryer'});}
    }
    await addN('💰 Pagesa e pranuar — '+c.name,'€'+amt.toFixed(2)+' · '+meth+' · Pranoi: '+wrkr+(note?' · '+note:''),wrkr,'#00B37A','Paguar','green');
    closeM('m-payment');G('pay-amt').value='';G('pay-note').value='';
    toast(isPaid?c.name+' — borxhi u shlye plotësisht ✓':c.name+' — €'+amt.toFixed(2)+' u regjistrua!');
  }catch(e){toast('Gabim: '+e.message);}
}window.confirmPayment=confirmPayment;

async function togglePay(id){
  var c=clients.find(function(x){return x.id===id;});if(!c)return;
  var np=!c.paid;
  try{await updateDoc(doc(db,'clients',id),{paid:np,debt:np?0:parseFloat(c.debt||0)});toast(c.name+' — '+(np?'paguar!':'pa paguar'));}catch(e){toast('Gabim!');}
}window.togglePay=togglePay;

function fBiz(f,el){bFlt=f;document.querySelectorAll('#s-biz .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderBiz();}window.fBiz=fBiz;
function renderBiz(){
  var l=G('biz-list');if(!l)return;l.innerHTML='';
  var list=bizList.filter(function(b){return bFlt==='unpaid'?(!b.paid&&parseFloat(b.debt||0)>0):bFlt==='paid'?(b.paid||parseFloat(b.debt||0)===0):true;});
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-building"></i><p>Asnjë biznes</p></div>';return;}
  list.forEach(function(b){
    var bOrds=orders.filter(function(o){return o.client===b.name;});
    var tv=bOrds.reduce(function(a,o){return a+parseFloat(o.price||0);},0);
    var isPaid=b.paid||parseFloat(b.debt||0)===0;
    var el=document.createElement('div');el.className='card';el.style.flexDirection='column';el.style.alignItems='stretch';el.style.gap='0';
    el.innerHTML='<div style="display:flex;align-items:center;gap:10px;margin-bottom:10px;">'
      +'<div style="width:44px;height:44px;border-radius:12px;background:var(--redl);display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:800;color:var(--red);">'+ini(b.name)+'</div>'
      +'<div style="flex:1;"><div style="font-size:15px;font-weight:700;">'+b.name+'</div><div style="font-size:12px;color:var(--t2);">'+(b.con||'')+(b.p?' · '+b.p:'')+'</div></div>'
      +'<span style="font-size:15px;font-weight:700;font-family:var(--fm);color:'+(isPaid?'var(--green)':'var(--red)')+';">'+(isPaid?'Paguar':'€'+parseFloat(b.debt||0).toFixed(0))+'</span></div>'
      +'<div class="bz"><div class="bs"><div class="bv" style="color:var(--blue);">'+bOrds.length+'</div><div class="bl">Porosi</div></div>'
      +'<div class="bs"><div class="bv" style="color:var(--green);">€'+tv.toFixed(0)+'</div><div class="bl">Totali</div></div>'
      +'<div class="bs"><div class="bv" style="color:var(--red);">€'+parseFloat(b.debt||0).toFixed(0)+'</div><div class="bl">Borxh</div></div></div>';
    el.onclick=function(){viewBiz(b);};
    l.appendChild(el);
  });
}

function viewBiz(b){
  G('bd-title').textContent=b.name;
  var bOrds=orders.filter(function(o){return o.client===b.name;});
  var ordH=bOrds.slice(0,5).map(function(o){return '<div style="display:flex;justify-content:space-between;padding:7px 0;border-bottom:1px solid var(--br);"><span style="font-size:13px;">'+o.prod+'</span><span style="font-size:13px;font-family:var(--fm);">€'+parseFloat(o.price||0).toFixed(2)+' <span class="badge '+bcls(o.status)+'">'+o.status+'</span></span></div>';}).join('');
  G('bd-body').innerHTML='<div style="font-size:13px;color:var(--t2);line-height:2;margin-bottom:10px;">'+(b.con?'<div><b style="color:var(--t1);">Kontakti:</b> '+b.con+'</div>':'')+(b.p?'<div><b style="color:var(--t1);">Tel:</b> <a href="tel:'+b.p+'" style="color:var(--blue);">'+b.p+'</a></div>':'')+(b.addr?'<div><b style="color:var(--t1);">Adresa:</b> '+b.addr+'</div>':'')+'<div><b style="color:var(--t1);">Borxhi:</b> <span style="color:var(--red);font-weight:700;">€'+parseFloat(b.debt||0).toFixed(2)+'</span></div></div>'+ordH;
  G('bd-pay-btn').onclick=async function(){try{await updateDoc(doc(db,'businesses',b.id),{paid:true,debt:0});await addN('Pagesa e kryer',b.name,'Admin','#00B37A','Paguar','green');closeM('m-biz-detail');toast(b.name+' — paguar!');}catch(e){toast('Gabim!');}};
  openM('m-biz-detail');
}
async function addBiz(){
  var n=G('b-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var debt=parseFloat(G('b-d').value)||0;
  try{await addDoc(collection(db,'businesses'),{name:n,con:G('b-con').value.trim(),p:G('b-p').value,addr:G('b-addr').value.trim(),debt:debt,paid:debt===0,createdAt:serverTimestamp()});closeM('m-biz');G('b-n').value='';G('b-con').value='';G('b-p').value='';G('b-addr').value='';G('b-d').value='';toast(n+' u shtua!');}catch(e){toast('Gabim: '+e.message);}
}window.addBiz=addBiz;

// MASA
function addMasaRow(){masaN++;var id='mr'+masaN;var row=document.createElement('div');row.className='mr';row.id=id;row.innerHTML='<span style="font-size:11px;color:var(--t2);width:22px;flex-shrink:0;">#'+masaN+'</span><input class="mi2" type="number" placeholder="Gj. cm" step="0.1" oninput="calcM(\''+id+'\')"><span style="color:var(--t3);font-size:14px;flex-shrink:0;">×</span><input class="mi2" type="number" placeholder="Lart. cm" step="0.1" oninput="calcM(\''+id+'\')"><span style="font-size:11px;color:var(--red);font-weight:700;width:52px;text-align:right;font-family:var(--fm);flex-shrink:0;" id="res'+id+'">—</span><button style="background:none;border:none;color:var(--red);cursor:pointer;font-size:13px;padding:2px;" onclick="document.getElementById(\''+id+'\').remove()"><i class="fa-solid fa-times"></i></button>';G('masa-rows').appendChild(row);}
window.addMasaRow=addMasaRow;
function calcM(id){var row=G(id);if(!row)return;var inp=row.querySelectorAll('input');var w=parseFloat(inp[0].value)||0;var h=parseFloat(inp[1].value)||0;G('res'+id).textContent=w>0&&h>0?(w*h/10000).toFixed(2)+' m²':'—';}window.calcM=calcM;
function getMasat(){var rows=G('masa-rows').querySelectorAll('.mr');var m=[];rows.forEach(function(row){var inp=row.querySelectorAll('input');var w=parseFloat(inp[0].value)||0;var h=parseFloat(inp[1].value)||0;if(w>0||h>0)m.push({w:w,h:h,area:w>0&&h>0?(w*h/10000).toFixed(2):0});});return m;}

function addCustomType(){var val=prompt('Shkruaj llojin e ri:');if(val&&val.trim()){var dl=G('t-type-list');var opt=document.createElement('option');opt.value=val.trim();dl.appendChild(opt);G('t-type').value=val.trim();toast('Lloji u shtua!');}}
window.addCustomType=addCustomType;

function fTerreni(f,el){tFlt=f;document.querySelectorAll('#s-terreni .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderTerreni();}window.fTerreni=fTerreni;
function renderTerreni(){
  var l=G('terreni-list');if(!l)return;l.innerHTML='';
  var list=terrList.filter(function(t){return tFlt==='all'||t.status===tFlt;});
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-ruler-combined"></i><p>Asnjë matje</p></div>';return;}
  list.forEach(function(t){
    var cl=t.status==='Konfirmuar'?'green':t.status==='Kryer'?'pur':'amber';
    var masat=t.masat||[];
    var mH=masat.length?masat.map(function(m,i){return '<div class="tmr"><span style="font-size:12px;color:var(--t2);">#'+(i+1)+' — '+m.w+' × '+m.h+' cm</span><span style="font-size:12px;font-weight:700;color:var(--red);">'+m.area+' m²</span></div>';}).join(''):'<span style="font-size:12px;color:var(--t3);">Pa masa</span>';
    var el=document.createElement('div');el.className='tc';
    el.innerHTML='<div class="th"><div class="ci" style="background:var(--redl);"><i class="fa-solid fa-ruler-combined" style="color:var(--red);font-size:14px;"></i></div>'
      +'<div style="flex:1;min-width:0;"><div style="font-size:14px;font-weight:600;">'+t.client+'</div><div style="font-size:12px;color:var(--t2);">'+(t.type||'')+' · '+(t.worker||'')+'</div>'
      +(t.clientPhone?'<div style="font-size:11px;color:var(--blue);"><i class="fa-solid fa-phone"></i> '+t.clientPhone+'</div>':'')
      +'</div><span class="badge '+cl+'">'+t.status+'</span></div>'
      +'<div class="tbody"><div class="tm">'+mH+'</div>'
      +(t.address||t.mapsLink?'<div style="font-size:11px;color:var(--t2);margin-bottom:6px;">'+(t.address?'<i class="fa-solid fa-location-dot" style="color:var(--red);margin-right:4px;"></i>'+t.address+' ':'' )+(t.mapsLink?'<a href="'+t.mapsLink+'" target="_blank" style="color:var(--blue);text-decoration:none;" onclick="event.stopPropagation()"><i class="fa-solid fa-map-location-dot"></i> Maps</a>':'')+'</div>':'')
      +(function(){
  if(t.photos&&t.photos.length){
    var imgs=t.photos.slice(0,4).map(function(src){return '<img src="'+src+'" style="width:100%;height:80px;object-fit:cover;border-radius:var(--r3);cursor:zoom-in;" onclick="event.stopPropagation();openZoom(this.src)">';}).join('');
    var extra=t.photos.length>4?'<div style="background:var(--redl);border-radius:var(--r3);height:80px;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;color:var(--red);">+'+(t.photos.length-4)+'</div>':'';
    return '<div style="display:grid;grid-template-columns:1fr 1fr;gap:6px;margin-bottom:6px;">'+imgs+extra+'</div>';
  }
  if(t.photo)return '<img class="tph" src="'+t.photo+'" onclick="event.stopPropagation();openZoom(this.src)">';
  return '';
})()
      +'</div>';
    el.onclick=function(){aTerData=t;viewTerreni(t);};
    l.appendChild(el);
  });
}

function viewTerreni(t){
  G('tv-title').textContent=t.client+' — '+(t.type||'');
  var masat=t.masat||[];
  G('tv-body').innerHTML='<div style="font-size:13px;color:var(--t2);line-height:1.9;">'
    +(t.clientPhone?'<div><b style="color:var(--t1);">Tel. Klientit:</b> <a href="tel:'+t.clientPhone+'" style="color:var(--blue);">'+t.clientPhone+'</a></div>':'')
    +(t.address?'<div><b style="color:var(--t1);">Adresa:</b> '+t.address+'</div>':'')
    +(t.mapsLink?'<div><a href="'+t.mapsLink+'" target="_blank" style="color:var(--blue);">📍 Hap në Google Maps</a></div>':'')
    +'<div><b style="color:var(--t1);">Lloji:</b> '+t.type+'</div><div><b style="color:var(--t1);">Punëtori:</b> '+t.worker+'</div></div>'
    +(masat.length?'<div style="font-size:11px;font-weight:700;color:var(--t3);text-transform:uppercase;margin:10px 0 6px;">Masat</div>'+masat.map(function(m,i){return '<div style="display:flex;justify-content:space-between;padding:6px 0;border-bottom:1px solid var(--br);"><span style="font-size:13px;color:var(--t2);">#'+(i+1)+' — '+m.w+' × '+m.h+' cm</span><span style="font-size:13px;font-weight:700;color:var(--red);">'+m.area+' m²</span></div>';}).join(''):'')
    +(t.notes?'<div style="margin-top:8px;font-size:12px;color:var(--t2);">'+t.notes+'</div>':'')
    +(function(){
  if(t.photos&&t.photos.length){
    return '<div style="display:grid;grid-template-columns:1fr 1fr;gap:6px;margin-top:10px;">'+t.photos.map(function(src){return '<img src="'+src+'" style="width:100%;height:100px;object-fit:cover;border-radius:8px;cursor:zoom-in;" onclick="openZoom(this.src)">';}).join('')+'</div>';
  }
  if(t.photo)return '<img src="'+t.photo+'" style="width:100%;border-radius:12px;margin-top:12px;max-height:240px;object-fit:cover;cursor:zoom-in;" onclick="openZoom(this.src)">';
  return '';
})();
  var sb=G('tv-status');sb.innerHTML='';
  if(t.status!=='Konfirmuar'){var b1=document.createElement('button');b1.className='sopt';b1.style.cssText='color:#00B37A;border-color:rgba(0,179,122,0.3);';b1.innerHTML='<i class="fa-solid fa-check-circle"></i> Konfirmo — Bëj porosi';b1.onclick=function(){updTStatus(t.id,'Konfirmuar');closeM('m-terreni-view');};sb.appendChild(b1);}
  if(t.status!=='Kryer'){var b2=document.createElement('button');b2.className='sopt';b2.style.cssText='color:#8B5CF6;border-color:rgba(139,92,246,0.3);background:rgba(139,92,246,0.06);';b2.innerHTML='<i class="fa-solid fa-circle-check"></i> U krye';b2.onclick=function(){updTStatus(t.id,'Kryer');closeM('m-terreni-view');};sb.appendChild(b2);}
  openM('m-terreni-view');
}window.viewTerreni=viewTerreni;

async function updTStatus(id,s){try{await updateDoc(doc(db,'terreni',id),{status:s});await addN('Terreni: '+s,'Statusi u ndryshua',cu.name,s==='Konfirmuar'?'#00B37A':'#8B5CF6',s,s==='Konfirmuar'?'green':'pur');toast('U ndryshua!');}catch(e){toast('Gabim!');}}

function editTerreniAsOrder(){
  if(!aTerData)return;
  var t=aTerData;closeM('m-terreni-view');
  var o=orders.find(function(x){return x.fromTerreni&&x.client===t.client&&!x.done;});
  if(o){aOrdId=o.id;openM('m-status');}else toast('Porosia aktive nuk u gjet');
}window.editTerreniAsOrder=editTerreniAsOrder;

// PHOTO
function prevPhoto(input){if(!input.files||!input.files[0])return;var r=new FileReader();r.onload=function(e){var img2=new Image();img2.onload=function(){var canvas=document.createElement('canvas');var MAX=600;var w=img2.width;var h=img2.height;if(w>h){if(w>MAX){h=Math.round(h*MAX/w);w=MAX;}}else{if(h>MAX){w=Math.round(w*MAX/h);h=MAX;}}canvas.width=w;canvas.height=h;canvas.getContext('2d').drawImage(img2,0,0,w,h);var q=0.65;var res=canvas.toDataURL('image/jpeg',q);while(res.length>600000&&q>0.2){q-=0.1;res=canvas.toDataURL('image/jpeg',q);}photoB64=res;G('t-img').src=res;G('t-preview').style.display='block';G('t-ps').textContent=Math.round(res.length*0.75/1024)+' KB';};img2.src=e.target.result;};r.readAsDataURL(input.files[0]);}
window.prevPhoto=prevPhoto;
function removePhoto(){photoB64=null;G('t-preview').style.display='none';G('t-cam').value='';G('t-gallery').value='';}window.removePhoto=removePhoto;

// ZOOM
function openZoom(src){G('zoom-img').src=src;G('zoom-bg').classList.add('open');}
function closeZoom(){G('zoom-bg').classList.remove('open');}
window.openZoom=openZoom;window.closeZoom=closeZoom;

async function addTerreni(){
  var c=G('t-c').value.trim();if(!c){toast('Shkruaj klientin!');return;}
  var masat=getMasat();var worker=G('t-worker')?G('t-worker').value:cu.name;
  var data={client:c,clientPhone:G('t-phone').value.trim(),address:G('t-addr').value.trim(),mapsLink:G('t-maps').value.trim(),type:G('t-type').value,masat:masat,qty:parseInt(G('t-qty').value)||1,notes:G('t-notes').value.trim(),worker:worker,status:'Në pritje',createdAt:serverTimestamp()};
  if(tPhotos.length>0)data.photos=tPhotos.slice();
  toast('Duke dërguar...');
  try{
    var areaTotal=masat.reduce(function(a,m){return a+parseFloat(m.area||0);},0);
    await addDoc(collection(db,'terreni'),data);
    await addDoc(collection(db,'orders'),{client:c,prod:(G('t-type').value)+' (Terren)',qty:masat.length?areaTotal.toFixed(2)+' m²':(G('t-qty').value+' copë'),price:0,worker:worker,status:'Në punë',pay:'unpaid',date:today(),done:false,fromTerreni:true,createdAt:serverTimestamp()});
    await addN('📍 Matje e re — '+c,(G('t-type').value)+(masat.length?' · '+areaTotal.toFixed(2)+' m²':''),worker,'#E8192C','Terren','red');
    closeM('m-terreni');
    G('t-c').value='';G('t-phone').value='';G('t-addr').value='';G('t-maps').value='';G('t-type').value='';G('t-qty').value='1';G('t-notes').value='';
    G('masa-rows').innerHTML='';masaN=0;G('t-photos-grid').innerHTML='';tPhotos=[];
    if(G('t-photo-count'))G('t-photo-count').textContent='';
    addMasaRow();toast('✓ U dërgua dhe u shtua te Porositë!');
  }catch(e){if(e.message&&e.message.indexOf('longer than')>=0)toast('Foto shumë e madhe!');else toast('Gabim: '+e.message);}
}window.addTerreni=addTerreni;

function fHistory(f,el){hFlt=f;document.querySelectorAll('#s-history .fc').forEach(function(c){c.classList.remove('active');});el.classList.add('active');renderHistory();}window.fHistory=fHistory;
function renderHistory(){
  var l=G('history-list');if(!l)return;l.innerHTML='';
  var from=G('h-from')?G('h-from').value:'';var to=G('h-to')?G('h-to').value:'';
  var list=orders.filter(function(o){var inD=(!from||o.date>=from)&&(!to||o.date<=to);return hFlt==='all'?inD:(inD&&o.status===hFlt);});
  var total=list.reduce(function(a,b){return a+parseFloat(b.price||0);},0);
  var ht=G('hist-total');if(ht)ht.textContent='€ '+total.toFixed(2);
  if(!list.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-clock-rotate-left"></i><p>Asnjë porosi</p></div>';return;}
  list.forEach(function(o,i){l.appendChild(mkCard(o,i));});
}

function renderNotifs(){
  var l=G('notif-list');if(!l)return;l.innerHTML='';
  if(!notifs.length){l.innerHTML='<div class="empty"><i class="fa-solid fa-bell-slash"></i><p>Asnjë njoftim</p></div>';return;}
  notifs.slice(0,40).forEach(function(n){var el=document.createElement('div');el.className='ni';el.innerHTML='<div class="np" style="background:'+n.color+';"></div><div style="flex:1;"><div style="font-size:13px;font-weight:600;color:var(--t1);">'+n.text+' <span class="badge '+n.cls+'">'+n.badge+'</span></div><div style="font-size:12px;color:var(--t2);margin-top:2px;">'+n.desc+'</div><div style="font-size:10px;color:var(--t3);margin-top:1px;">'+n.worker+'</div></div>';l.appendChild(el);});
}

function fillWSel(){
  ['o-w','t-worker','pay-wrkr'].forEach(function(sid){
    var s=G(sid);if(!s)return;s.innerHTML='';
    if(cu){var o=document.createElement('option');o.value=cu.name;o.textContent=cu.name+' (unë)';s.appendChild(o);}
    workers.forEach(function(w){if(cu&&w.name===cu.name)return;var o=document.createElement('option');o.value=w.name;o.textContent=w.name;s.appendChild(o);});
  });
}

function openNewOrder(){G('m-order-title').textContent='Porosi e re';G('o-eid').value='';G('o-c').value='';G('o-p').value='';G('o-q').value='';G('o-pr').value='';G('o-pay').value='unpaid';G('o-pm').value='';G('o-due').value=today();G('o-sbtn').textContent='Ruaj';openM('m-order');}
window.openNewOrder=openNewOrder;

async function saveOrder(){
  var c=G('o-c').value.trim();if(!c){toast('Shkruaj klientin!');return;}
  var prod=G('o-p').value.trim();if(!prod){toast('Shkruaj produktin!');return;}
  var price=parseFloat(G('o-pr').value)||0;var pay=G('o-pay').value;var pm=G('o-pm').value;
  var worker=G('o-w').value||cu.name;var due=G('o-due').value||today();var eid=G('o-eid').value;
  var data={client:c,prod:prod,qty:G('o-q').value||'1',price:price,worker:worker,status:'Në punë',pay:pay,paymethod:pm,date:due,done:false};
  try{
    if(eid){await updateDoc(doc(db,'orders',eid),data);await addN('Porosia u editua',prod+' — '+c,worker,'#3B82F6','Edituar','blue');toast('U përditësua!');}
    else{
      data.createdAt=serverTimestamp();await addDoc(collection(db,'orders'),data);
      if(pay==='unpaid'||pay==='partial'){var cl=clients.find(function(x){return x.name===c;});if(!cl){await addDoc(collection(db,'clients'),{name:c,phone:'',debt:price,paid:false,createdAt:serverTimestamp()});}else{await updateDoc(doc(db,'clients',cl.id),{debt:parseFloat(cl.debt||0)+price,paid:false});}}
      var wObj=workers.find(function(w){return w.name===worker;});if(wObj)await updateDoc(doc(db,'workers',wObj.id),{orders:(parseInt(wObj.orders)||0)+1});
      await addN('Porosi e re',prod+' — '+c,worker,'#E8192C','E re','red');toast('Porosia u shtua!');
    }
    closeM('m-order');G('o-c').value='';G('o-p').value='';G('o-q').value='';G('o-pr').value='';G('o-eid').value='';G('m-order-title').textContent='Porosi e re';G('o-sbtn').textContent='Ruaj';
  }catch(e){toast('Gabim: '+e.message);}
}window.saveOrder=saveOrder;

function editActiveOrder(){var o=orders.find(function(x){return x.id===aOrdId;});if(!o)return;closeM('m-status');G('m-order-title').textContent='Edito porosinë';G('o-eid').value=o.id;G('o-c').value=o.client||'';G('o-p').value=o.prod||'';G('o-q').value=o.qty||'';G('o-pr').value=o.price||0;G('o-pay').value=o.pay||'unpaid';G('o-pm').value=o.paymethod||'';G('o-due').value=o.date||'';G('o-sbtn').textContent='Përditëso';openM('m-order');}window.editActiveOrder=editActiveOrder;

async function setStatus(status,cls){
  if(!aOrdId){closeM('m-status');return;}
  var o=orders.find(function(x){return x.id===aOrdId;});if(!o){closeM('m-status');return;}
  var isDone=status==='Kryer';
  try{
    await updateDoc(doc(db,'orders',aOrdId),{status:status,done:isDone});
    if(isDone){var wObj=workers.find(function(w){return w.name===o.worker;});if(wObj)await updateDoc(doc(db,'workers',wObj.id),{done:(parseInt(wObj.done)||0)+1});}
    var col=status==='Gati'?'#00B37A':status==='Vonuar'?'#E8192C':status==='Kryer'?'#8B5CF6':'#F59E0B';
    var msg=status==='Gati'?'Porosia u krye':status==='Kryer'?'U realizua ✓':status==='Vonuar'?'Porosi e vonuar':'Vazhdon';
    await addN(msg,o.prod+' — '+o.client,cu.name,col,status,cls);
    toast(isDone?'Kaloi në historik!':'Statusi u ndryshua!');
  }catch(e){toast('Gabim: '+e.message);}
  closeM('m-status');
}window.setStatus=setStatus;

async function addInv(){
  var n=G('p-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var ut=G('p-ut').value;var unit=ut==='tjetër'?(G('p-uc').value.trim()||'njësi'):ut;
  var qty=parseFloat(G('p-q').value)||0;var min=parseFloat(G('p-m').value)||1;var up=parseFloat(G('p-price').value)||0;
  try{await addDoc(collection(db,'inventory'),{name:n,cat:G('p-c').value,qty:qty,unit:unit,unitPrice:up,min:min,createdAt:serverTimestamp()});if(qty<=min)await addN('Stoku i ulët',n+' — '+qty+' '+unit,'Sistem','#F59E0B','Alarm','amber');closeM('m-inv');G('p-n').value='';G('p-q').value='';G('p-m').value='';G('p-price').value='';toast('U shtua!');}catch(e){toast('Gabim: '+e.message);}
}window.addInv=addInv;

async function addWorker(){
  var n=G('w-n').value.trim();if(!n){toast('Shkruaj emrin!');return;}
  var pin=G('w-pin').value.trim();if(!pin){toast('Shkruaj PIN-in!');return;}
  var cols=[['rgba(232,25,44,0.1)','#E8192C'],['rgba(59,130,246,0.1)','#3B82F6'],['rgba(245,158,11,0.1)','#F59E0B'],['rgba(0,179,122,0.1)','#00B37A'],['rgba(139,92,246,0.1)','#8B5CF6']];
  var c=cols[workers.length%cols.length];
  try{await addDoc(collection(db,'workers'),{name:n,pin:pin,role:G('w-r').value,phone:G('w-p').value,orders:0,done:0,color:c,createdAt:serverTimestamp()});closeM('m-worker');G('w-n').value='';G('w-pin').value='';G('w-p').value='';toast(n+' u shtua! PIN: '+pin);}catch(e){toast('Gabim: '+e.message);}
}window.addWorker=addWorker;

async function delWorker(id){if(!confirm('A jeni i sigurt?'))return;try{await deleteDoc(doc(db,'workers',id));toast('U largua!');}catch(e){toast('Gabim!');}}window.delWorker=delWorker;
function toggleUnit(){G('unit-cw').style.display=G('p-ut').value==='tjetër'?'block':'none';}window.toggleUnit=toggleUnit;

// INIT
G('ld').style.display='flex';
startL();
var saved=localStorage.getItem('cpu');
if(saved){try{cu=JSON.parse(saved);}catch(e){cu=null;}}
setTimeout(function(){
  G('ld').style.display='none';
  if(cu){G('app').style.display='flex';showApp();}
  else G('login').classList.add('show');
},1800);
var t2=new Date();var f2=new Date(t2.getFullYear(),t2.getMonth(),1);
if(G('h-from'))G('h-from').value=f2.toISOString().slice(0,10);
if(G('h-to'))G('h-to').value=t2.toISOString().slice(0,10);

// MULTI PHOTO SYSTEM
var tPhotos = []; // array of base64 strings for terreni
var tePhotos = []; // for terreni edit - existing photos
var teNewPhotos = []; // for terreni edit - new photos

function compressImg(file, cb) {
  var r = new FileReader();
  r.onload = function(e) {
    var img2 = new Image();
    img2.onload = function() {
      var canvas = document.createElement('canvas');
      var MAX = 600;
      var w = img2.width, h = img2.height;
      if (w > h) { if (w > MAX) { h = Math.round(h*MAX/w); w = MAX; } }
      else { if (h > MAX) { w = Math.round(w*MAX/h); h = MAX; } }
      canvas.width = w; canvas.height = h;
      canvas.getContext('2d').drawImage(img2, 0, 0, w, h);
      var q = 0.65, res = canvas.toDataURL('image/jpeg', q);
      while (res.length > 500000 && q > 0.2) { q -= 0.1; res = canvas.toDataURL('image/jpeg', q); }
      cb(res);
    };
    img2.src = e.target.result;
  };
  r.readAsDataURL(file);
}

function renderPhotoGrid() {
  var grid = G('t-photos-grid');
  var count = G('t-photo-count');
  if (!grid) return;
  grid.innerHTML = '';
  tPhotos.forEach(function(src, i) {
    var wrap = document.createElement('div');
    wrap.style.cssText = 'position:relative;border-radius:var(--r3);overflow:hidden;';
    var img = document.createElement('img');
    img.src = src;
    img.style.cssText = 'width:100%;height:100px;object-fit:cover;cursor:zoom-in;display:block;';
    img.onclick = function(){openZoom(src);};
    var btn = document.createElement('button');
    btn.style.cssText = 'position:absolute;top:4px;right:4px;background:rgba(232,25,44,0.85);border:none;color:#fff;width:24px;height:24px;border-radius:50%;font-size:12px;cursor:pointer;display:flex;align-items:center;justify-content:center;';
    btn.innerHTML = '<i class="fa-solid fa-times"></i>';
    btn.onclick = function(){removePhotoAt(i);};
    wrap.appendChild(img);wrap.appendChild(btn);
    grid.appendChild(wrap);
  });
  if (count) count.textContent = tPhotos.length > 0 ? tPhotos.length + '/8 foto të shtuara' : '';
}

function addPhoto(input) {
  if (!input.files || !input.files[0]) return;
  if (tPhotos.length >= 8) { toast('Maksimumi 8 foto!'); return; }
  compressImg(input.files[0], function(src) {
    tPhotos.push(src);
    renderPhotoGrid();
    input.value = '';
  });
}
window.addPhoto = addPhoto;

function addPhotos(input) {
  if (!input.files || !input.files.length) return;
  var files = Array.from(input.files).slice(0, 8 - tPhotos.length);
  var done = 0;
  files.forEach(function(file) {
    compressImg(file, function(src) {
      if (tPhotos.length < 8) tPhotos.push(src);
      done++;
      if (done === files.length) renderPhotoGrid();
    });
  });
  input.value = '';
}
window.addPhotos = addPhotos;

function removePhotoAt(i) {
  tPhotos.splice(i, 1);
  renderPhotoGrid();
}
window.removePhotoAt = removePhotoAt;

// TERRENI EDIT PHOTOS
function renderTeEditPhotos() {
  var eg = G('te-existing-photos');
  if (eg) {
    eg.innerHTML = '';
    tePhotos.forEach(function(src, i) {
      var wrap = document.createElement('div');
      wrap.style.cssText = 'position:relative;border-radius:var(--r3);overflow:hidden;';
      var img=document.createElement('img');img.src=src;img.style.cssText='width:100%;height:90px;object-fit:cover;cursor:zoom-in;display:block;';img.onclick=function(){openZoom(src);};
    var btn=document.createElement('button');btn.style.cssText='position:absolute;top:4px;right:4px;background:rgba(232,25,44,0.85);border:none;color:#fff;width:24px;height:24px;border-radius:50%;font-size:12px;cursor:pointer;display:flex;align-items:center;justify-content:center;';btn.innerHTML='<i class="fa-solid fa-times"></i>';btn.onclick=function(){removeExistingPhoto(i);};
    wrap.appendChild(img);wrap.appendChild(btn);
    eg.appendChild(wrap);
    });
  }
  var ng = G('te-new-photos');
  if (ng) {
    ng.innerHTML = '';
    teNewPhotos.forEach(function(src, i) {
      var wrap = document.createElement('div');
      wrap.style.cssText = 'position:relative;border-radius:var(--r3);overflow:hidden;';
      var img2=document.createElement('img');img2.src=src;img2.style.cssText='width:100%;height:90px;object-fit:cover;cursor:zoom-in;display:block;';img2.onclick=function(){openZoom(src);};
    var btn2=document.createElement('button');btn2.style.cssText='position:absolute;top:4px;right:4px;background:rgba(232,25,44,0.85);border:none;color:#fff;width:24px;height:24px;border-radius:50%;font-size:12px;cursor:pointer;display:flex;align-items:center;justify-content:center;';btn2.innerHTML='<i class="fa-solid fa-times"></i>';btn2.onclick=function(){removeNewPhoto(i);};
    wrap.appendChild(img2);wrap.appendChild(btn2);
    ng.appendChild(wrap);
    });
  }
}

function removeExistingPhoto(i) { tePhotos.splice(i, 1); renderTeEditPhotos(); }
window.removeExistingPhoto = removeExistingPhoto;
function removeNewPhoto(i) { teNewPhotos.splice(i, 1); renderTeEditPhotos(); }
window.removeNewPhoto = removeNewPhoto;

function addTerreniEditPhoto(input) {
  if (!input.files || !input.files[0]) return;
  var total = tePhotos.length + teNewPhotos.length;
  if (total >= 8) { toast('Maksimumi 8 foto!'); return; }
  compressImg(input.files[0], function(src) { teNewPhotos.push(src); renderTeEditPhotos(); input.value = ''; });
}
window.addTerreniEditPhoto = addTerreniEditPhoto;

function addTerreniEditPhotos(input) {
  if (!input.files || !input.files.length) return;
  var total = tePhotos.length + teNewPhotos.length;
  var files = Array.from(input.files).slice(0, 8 - total);
  var done = 0;
  files.forEach(function(file) {
    compressImg(file, function(src) {
      if (tePhotos.length + teNewPhotos.length < 8) teNewPhotos.push(src);
      done++;
      if (done === files.length) renderTeEditPhotos();
    });
  });
  input.value = '';
}
window.addTerreniEditPhotos = addTerreniEditPhotos;

// OPEN TERRENI EDIT
function openTerreniEdit() {
  if (!aTerData) return;
  var t = aTerData;
  G('te-id').value = t.id;
  G('te-c').value = t.client || '';
  G('te-phone').value = t.clientPhone || '';
  G('te-addr').value = t.address || '';
  G('te-maps').value = t.mapsLink || '';
  G('te-type').value = t.type || '';
  G('te-notes').value = t.notes || '';
  // Load existing photos
  tePhotos = t.photos ? t.photos.slice() : (t.photo ? [t.photo] : []);
  teNewPhotos = [];
  renderTeEditPhotos();
  closeM('m-terreni-view');
  openM('m-terreni-edit');
}
window.openTerreniEdit = openTerreniEdit;

async function saveTerreniEdit() {
  var id = G('te-id').value;
  if (!id) return;
  var allPhotos = tePhotos.concat(teNewPhotos);
  var data = {
    client: G('te-c').value.trim(),
    clientPhone: G('te-phone').value.trim(),
    address: G('te-addr').value.trim(),
    mapsLink: G('te-maps').value.trim(),
    type: G('te-type').value.trim(),
    notes: G('te-notes').value.trim(),
    photos: allPhotos
  };
  try {
    await updateDoc(doc(db, 'terreni', id), data);
    await addN('Matja u editua', data.client + ' — ' + data.type, cu.name, '#3B82F6', 'Edituar', 'blue');
    closeM('m-terreni-edit');
    toast('Matja u përditësua!');
  } catch(e) { toast('Gabim: ' + e.message); }
}
window.saveTerreniEdit = saveTerreniEdit;

// DELETE ORDER
async function deleteActiveOrder() {
  if (!aOrdId) return;
  var o = orders.find(function(x) { return x.id === aOrdId; });
  if (!o) return;
  if (!confirm('A jeni i sigurt? Kjo veprim nuk kthehet!')) return;
  try {
    await deleteDoc(doc(db, 'orders', aOrdId));
    await addN('Porosia u fshi', (o.prod||'') + ' — ' + (o.client||''), cu.name, '#E8192C', 'Fshirë', 'red');
    closeM('m-status');
    toast('Porosia u fshi!');
  } catch(e) { toast('Gabim: ' + e.message); }
}
window.deleteActiveOrder = deleteActiveOrder;

// PUSH NOTIFICATIONS with vibration
// notifications handled above

// Fix renderTerreni to show multiple photos
async function deleteTerreni(){
  if(!aTerData)return;
  if(!confirm('A jeni i sigurt? Kjo veprim nuk kthehet!'))return;
  try{
    await deleteDoc(doc(db,'terreni',aTerData.id));
    // Also delete matching order if exists
    var o=orders.find(function(x){return x.fromTerreni&&x.client===aTerData.client&&!x.done;});
    if(o)await deleteDoc(doc(db,'orders',o.id));
    closeM('m-terreni-view');
    toast('Matja u fshi!');
    aTerData=null;
  }catch(e){toast('Gabim: '+e.message);}
}
window.deleteTerreni=deleteTerreni;


// CHAT SYSTEM
var chatMessages = [];
var chatUnsub = null;

function startChatListener(){
  if(chatUnsub)return;
  chatUnsub = db.collection('messages').orderBy('createdAt','asc').onSnapshot(function(snap){
    chatMessages = [];
    snap.forEach(function(d){ chatMessages.push(Object.assign({id:d.id}, d.data())); });
    renderChat();
    updateChatDot();
  });
}

function updateChatDot(){
  // Show dot if there are unread messages from others
  var dot = G('chat-dot');
  if(dot && cu){
    var hasNew = chatMessages.filter(function(m){ return m.sender !== cu.name; }).length > 0;
    // Only show if not on chat screen
    var chatScreen = G('s-chat');
    if(chatScreen && chatScreen.classList.contains('active')){
      dot.style.display = 'none';
    } else {
      // check last read
      var lastRead = parseInt(localStorage.getItem('cp_last_read') || '0');
      var hasUnread = chatMessages.some(function(m){
        return m.sender !== (cu?cu.name:'') && m.ts && m.ts > lastRead;
      });
      dot.style.display = hasUnread ? 'block' : 'none';
    }
  }
}

function markChatRead(){
  localStorage.setItem('cp_last_read', Date.now());
  var dot = G('chat-dot');
  if(dot) dot.style.display = 'none';
}

function renderChat(){
  var l = G('chat-messages');
  if(!l) return;
  l.innerHTML = '';
  if(!chatMessages.length){
    l.innerHTML = '<div style="text-align:center;padding:40px 20px;color:var(--t3);font-size:14px;"><i class="fa-solid fa-comments" style="font-size:36px;display:block;margin-bottom:10px;color:#ddd;"></i>Asnjë mesazh ende</div>';
    return;
  }
  var lastDate = '';
  chatMessages.forEach(function(m){
    var isMine = cu && m.sender === cu.name;
    var msgDate = m.ts ? new Date(m.ts).toLocaleDateString('sq-AL') : '';
    if(msgDate && msgDate !== lastDate){
      var sep = document.createElement('div');
      sep.className = 'chat-date-sep';
      sep.textContent = msgDate === new Date().toLocaleDateString('sq-AL') ? 'Sot' : msgDate;
      l.appendChild(sep);
      lastDate = msgDate;
    }
    var wrap = document.createElement('div');
    wrap.className = 'msg-wrap' + (isMine ? ' mine' : '');
    var timeStr = m.ts ? new Date(m.ts).toLocaleTimeString('sq-AL',{hour:'2-digit',minute:'2-digit'}) : '';
    var avatarColor = isMine ? ['rgba(232,25,44,0.1)','#E8192C'] : ['rgba(59,130,246,0.1)','#3B82F6'];
    wrap.innerHTML = '<div class="msg-avatar" style="background:'+avatarColor[0]+';color:'+avatarColor[1]+';display:'+(isMine?'none':'flex')+'">'+ini(m.sender||'?')+'</div>'
      + '<div>'
      + (!isMine ? '<div class="msg-sender">'+m.sender+'</div>' : '')
      + '<div class="msg-bubble '+(isMine?'mine':'other')+'">'+escHtml(m.text)+'</div>'
      + '<div class="msg-meta '+(isMine?'':'other')+'">'+timeStr+'</div>'
      + '</div>';
    l.appendChild(wrap);
  });
  // Scroll to bottom
  l.scrollTop = l.scrollHeight;
}

function escHtml(t){
  return (t||'').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/g,'<br>');
}

async function sendMsg(){
  var inp = G('chat-input');
  if(!inp) return;
  var text = inp.value.trim();
  if(!text || !cu) return;
  inp.value = '';
  inp.style.height = 'auto';
  try{
    await db.collection('messages').add({
      text: text,
      sender: cu.name,
      role: cu.role,
      ts: Date.now(),
      createdAt: firebase.firestore.FieldValue.serverTimestamp()
    });
  }catch(e){ toast('Gabim: ' + e.message); }
}
window.sendMsg = sendMsg;

function chatEnter(e){
  if(e.key === 'Enter' && !e.shiftKey){
    e.preventDefault();
    sendMsg();
  }
}
window.chatEnter = chatEnter;

function autoResize(el){
  el.style.height = 'auto';
  el.style.height = Math.min(el.scrollHeight, 100) + 'px';
}
window.autoResize = autoResize;

G('l-pin').addEventListener('keypress',function(e){if(e.key==='Enter')doLogin();});

// CHAT - open mesazhett link
function openChat(){
  // Mark as read before opening
  localStorage.setItem('cp_last_chat_open', Date.now());
  var chatDot = G('chat-dot');
  if(chatDot) chatDot.style.display = 'none';
  // Open in same tab
  window.open('https://c-pictures.github.io/mesazhett/', '_blank');
}
window.openChat = openChat;

// Check for new messages periodically
function checkNewMessages(){
  var lastOpen = parseInt(localStorage.getItem('cp_last_chat_open') || '0');
  var dot = G('chat-dot');
  if(!dot) return;
  // Simple check - fetch last message timestamp from Firebase
  db.collection('messages').orderBy('ts','desc').limit(1).get().then(function(snap){
    if(!snap.empty){
      var lastMsg = snap.docs[0].data();
      var lastTs = lastMsg.ts || 0;
      var senderName = lastMsg.sender || '';
      // Show dot if message is newer than last open and not from current user
      if(lastTs > lastOpen && senderName !== (cu ? cu.name : '')){
        dot.style.display = 'block';
      }
    }
  }).catch(function(){});
}

// Check every 30 seconds
setInterval(checkNewMessages, 30000);

// Check on app load
setTimeout(checkNewMessages, 3000);

// PWA install prompt
var dip = null;
window.addEventListener('beforeinstallprompt', function(e){
  e.preventDefault();
  dip = e;
  var banner = G('inst-wrap');
  if(banner){
    banner.innerHTML = '<div class="inst-banner" onclick="doInstall()" style="cursor:pointer;">'
      + '<div style="width:40px;height:40px;border-radius:10px;background:#fff;display:flex;align-items:center;justify-content:center;flex-shrink:0;">'
      + '<span style="font-size:22px;font-weight:900;color:#E8192C;">C</span></div>'
      + '<div style="flex:1;"><div class="inst-t">Instalo CPictures si App!</div>'
      + '<div class="inst-s">Shto në ekranin kryesor me ikonë C</div></div>'
      + '<i class="fa-solid fa-chevron-right" style="color:rgba(255,255,255,0.8);font-size:12px;"></i></div>';
  }
});

function doInstall(){
  if(dip){
    dip.prompt();
    dip.userChoice.then(function(){dip=null;var b=G('inst-wrap');if(b)b.innerHTML='';});
  } else {
    toast('Hap menunë e browser-it (⋮) → "Add to Home Screen"');
  }
}
window.doInstall = doInstall;

// Patch go() to handle chat screen
var _origGo = go;
go = function(sid, bid){
  _origGo(sid, bid);
  if(sid === 's-chat'){
    startChatListener();
    markChatRead();
    setTimeout(function(){
      var l = G('chat-messages');
      if(l) l.scrollTop = l.scrollHeight;
    }, 150);
  }
};
window.go = go;

// Start chat listener on login
var _origShowApp = showApp;
showApp = function(){
  _origShowApp();
  startChatListener();
};
window.showApp = showApp;
addMasaRow();
</script>
</body>
</html>

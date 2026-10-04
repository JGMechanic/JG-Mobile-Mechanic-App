const C='jg-v361';
const APP_SHELL=['./','./index.html','./logo.png','./manifest.json'];

self.addEventListener('install',e=>{
  self.skipWaiting();
  e.waitUntil(caches.open(C).then(c=>c.addAll(APP_SHELL)));
});
self.addEventListener('activate',e=>{
  e.waitUntil(Promise.all([
    caches.keys().then(keys=>Promise.all(keys.filter(k=>k!==C).map(k=>caches.delete(k)))),
    self.clients.claim()
  ]));
});
self.addEventListener('fetch',e=>{
  e.respondWith(fetch(e.request).catch(()=>caches.match(e.request)));
});

importScripts('https://www.gstatic.com/firebasejs/12.19.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/12.19.0/firebase-messaging-compat.js');
firebase.initializeApp({
  apiKey:'AIzaSyAzK1oA4VgeNLx84eoNpHjUVIAccPJxU90',
  authDomain:'jg-mobile-mechanic.firebaseapp.com',
  projectId:'jg-mobile-mechanic',
  storageBucket:'jg-mobile-mechanic.firebasestorage.app',
  messagingSenderId:'707409362105',
  appId:'1:707409362105:web:05e00c0075ff99b0186f68'
});
const messaging=firebase.messaging();
messaging.onBackgroundMessage(payload=>{
  const n=payload.notification||{};
  return self.registration.showNotification(n.title||'JG Mobile Mechanic',{
    body:n.body||payload.data?.body||'You have a new update.',
    icon:'logo.png',badge:'logo.png',
    data:{url:(payload.data&&payload.data.url)||'https://app.jgmechanic.co.uk'}
  });
});
self.addEventListener('notificationclick',e=>{
  e.notification.close();
  const url=e.notification.data?.url||'https://app.jgmechanic.co.uk';
  e.waitUntil(clients.matchAll({type:'window',includeUncontrolled:true}).then(cs=>{
    for(const c of cs){if('focus' in c){c.navigate(url);return c.focus();}}
    return clients.openWindow(url);
  }));
});

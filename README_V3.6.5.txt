JG Mobile Mechanic Cloud Edition V3.6.5

Notification compatibility test:
- Removed manual navigator.serviceWorker.register() calls from the page.
- Deprecated Firebase getToken() is allowed to discover /firebase-messaging-sw.js at the domain root itself.
- Existing Firebase config, VAPID key, Supabase integration and database schema are unchanged.
- No SQL upgrade required.

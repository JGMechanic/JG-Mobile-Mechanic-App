JG Mobile Mechanic - Cloud Edition V3.6.2

Notification registration update:
- Uses Firebase's current Web Messaging register() + onRegistered() flow.
- Stores the Firebase Installation ID (FID) in the existing push_tokens.token field.
- Uses firebase-messaging-sw.js as the single main service worker.
- Keeps sw.js only as a compatibility shim for older cached installs.
- No new Supabase SQL is required.

Upload/replace in GitHub repo root:
- index.html
- firebase-messaging-sw.js
- sw.js
- README_V3.6.2.txt

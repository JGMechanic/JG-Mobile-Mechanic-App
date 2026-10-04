JG Mobile Mechanic Cloud Edition V3.6.3

Notification diagnostic build based on the uploaded V3.6.2 files.
- Replaces the failing FID register()/onRegistered path with the still-supported FCM registration-token getToken() path.
- Passes the explicit firebase-messaging-sw.js ServiceWorkerRegistration and the existing VAPID public key.
- Stores the returned token in the existing push_tokens table as platform web-token.
- No SQL/database change required from V3.6.2.

This is a compatibility workaround while the newer FID registration endpoint is returning 401 UNAUTHENTICATED for this Firebase project.

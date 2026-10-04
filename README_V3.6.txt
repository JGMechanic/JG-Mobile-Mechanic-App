JG Mobile Mechanic V3.6

Adds Firebase Cloud Messaging registration for web/PWA notifications.

SETUP
1. Run upgrade_v3_6.sql once in Supabase SQL Editor.
2. Upload all V3.6 files to the JG-Mobile-Mechanic-App GitHub repository.
3. Open https://app.jgmechanic.co.uk and sign in.
4. Press Notifications and allow browser notifications.

IMPORTANT
This build registers devices securely in Supabase and can receive FCM notifications. Automatic server-side sending (new customer request / job status changes) requires the next server-side notification function. Never put a Firebase service-account private key in index.html or GitHub.

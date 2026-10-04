JG Mobile Mechanic V3.6.1

Changes from V3.6:
- Updated visible version label to Cloud Edition V3.6.1.
- Updated Firebase Web SDK from 10.14.1 to 12.19.0.
- Uses one service worker (sw.js) for both the PWA cache and Firebase Messaging.
  This avoids two service workers competing for the same site scope.
- Notification token registration now passes the main sw.js registration to FCM.
- Existing Supabase data, customer requests, jobs, invoices and V3.6 database schema are unchanged.

No new SQL upgrade is required for V3.6.1.

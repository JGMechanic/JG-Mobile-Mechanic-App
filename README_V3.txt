JG MOBILE MECHANIC V3

IMPORTANT BEFORE USING THE NEW V3 FEATURES:
1. Open Supabase > SQL Editor > New query.
2. Open upgrade_v3.sql from this ZIP, copy all of it, paste it into Supabase and click Run.
3. You should see "Success. No rows returned".
4. Then open index.html and sign in as mechanic.

V3 adds:
- Edit/delete customers, vehicles and jobs
- Invoice print / Save as PDF
- Payment method tracking
- MOT/service reminders (60-day view)
- Job photo uploads to private Supabase Storage
- Customer self-registration
- Existing customer records automatically link by matching email when customer registers
- Customer portal remains protected by Row Level Security

Customer setup:
- First create the customer in the mechanic app using the same email address the customer will use.
- Customer chooses Customer Login, enters their email/password and clicks Customer: Create Account.
- If email confirmation is enabled in Supabase, they confirm the email, then sign in.
- Their existing customer record is linked automatically by matching email.

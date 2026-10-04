JG MOBILE MECHANIC V3.1

1. In Supabase open SQL Editor > New query.
2. Open upgrade_v3_1.sql in Notepad, copy all, paste into Supabase and Run.
3. You should see: Success. No rows returned.
4. Open index.html and sign in as mechanic as normal.
5. Customer registration now asks for name, mobile, email, password, registration, make, model, mileage and vehicle issue. VIN is not requested.
6. Customer requests appear under Customer Requests on the mechanic dashboard and can be converted into a New Job.

Note: If Supabase email confirmation is enabled, a new customer may need to confirm their email before first login. V3.1 remembers the pending request in that browser and completes it after the first successful login.

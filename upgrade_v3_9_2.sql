-- JG Mobile Mechanic V3.9.2
-- Service intervals are now mileage-based in the app.

alter table public.vehicles
add column if not exists service_due_mileage integer;

-- JG Mobile Mechanic V3.4 upgrade
-- Run once in Supabase SQL Editor.

alter table public.customer_requests
add column if not exists service_type text;

update public.customer_requests
set service_type = 'Repair / Problem'
where service_type is null;

alter table public.customer_requests
alter column service_type set default 'Repair / Problem';

-- JG Mobile Mechanic V3.8
-- Allow authenticated customers to view photos only for jobs that belong to them.
-- Mechanics can view all job photos.

alter table storage.objects enable row level security;

drop policy if exists "Customers can view own job photos" on storage.objects;
create policy "Customers can view own job photos"
on storage.objects for select
to authenticated
using (
  bucket_id = 'job-photos'
  and exists (
    select 1
    from public.jobs j
    join public.customers c on c.id = j.customer_id
    where j.id = nullif(split_part(storage.objects.name, '/', 1), '')::bigint
      and c.user_id = auth.uid()
  )
);

drop policy if exists "Mechanic can view all job photos" on storage.objects;
create policy "Mechanic can view all job photos"
on storage.objects for select
to authenticated
using (
  bucket_id = 'job-photos'
  and public.is_mechanic()
);

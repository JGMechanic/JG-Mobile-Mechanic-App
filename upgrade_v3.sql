-- JG Mobile Mechanic V3 upgrade
-- Run once in Supabase SQL Editor.

alter table public.invoices add column if not exists payment_method text;

-- Create customer profile automatically when a new Auth user signs up.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, full_name, role)
  values (new.id, coalesce(new.raw_user_meta_data->>'full_name', split_part(new.email,'@',1)), 'customer')
  on conflict (id) do nothing;

  -- If mechanic already created a customer with the same email, link it.
  update public.customers
  set user_id = new.id
  where user_id is null and lower(email) = lower(new.email);
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();

-- Allow customer self-registration to create/read/update their own profile.
drop policy if exists "Users can insert own profile" on public.profiles;
create policy "Users can insert own profile"
on public.profiles for insert to authenticated
with check (id = auth.uid() and role = 'customer');

-- Vehicle/job photo storage bucket.
insert into storage.buckets (id, name, public)
values ('job-photos','job-photos',false)
on conflict (id) do nothing;

drop policy if exists "Mechanic manage job photos" on storage.objects;
create policy "Mechanic manage job photos"
on storage.objects for all to authenticated
using (bucket_id='job-photos' and public.is_mechanic())
with check (bucket_id='job-photos' and public.is_mechanic());

drop policy if exists "Customers view own job photos" on storage.objects;
create policy "Customers view own job photos"
on storage.objects for select to authenticated
using (
  bucket_id='job-photos' and exists (
    select 1 from public.jobs j
    join public.customers c on c.id=j.customer_id
    where c.user_id=auth.uid()
      and (storage.foldername(name))[1]=j.id::text
  )
);

-- JG Mobile Mechanic V3.8.1
-- Allow a logged-in customer to add a vehicle only to their own customer record.

drop policy if exists "Customers can add own vehicles" on public.vehicles;
create policy "Customers can add own vehicles"
on public.vehicles for insert
to authenticated
with check (
  exists (
    select 1 from public.customers c
    where c.id = vehicles.customer_id
      and c.user_id = auth.uid()
  )
);

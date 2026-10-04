-- JG Mobile Mechanic V3.3 - Job workflow status
alter table public.jobs
  add column if not exists job_status text not null default 'Request Received';

alter table public.jobs drop constraint if exists jobs_job_status_check;
alter table public.jobs add constraint jobs_job_status_check
  check (job_status in ('Request Received','Booked','In Progress','Waiting for Parts','Completed','Collected'));

update public.jobs
set job_status = 'Request Received'
where job_status is null or job_status = '';

-- Geek POS Restaurant Test R4 — Delivery Customers
-- Run this once in the Supabase SQL Editor for the same project used by Geek POS.

create table if not exists public.pos_customers (
  store_id text not null,
  customer_id bigint not null,
  name text not null,
  phone text not null,
  normalized_phone text,
  address text,
  zone text,
  order_count integer not null default 0,
  total_spent numeric(18,2) not null default 0,
  last_order_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (store_id, customer_id)
);

create index if not exists idx_pos_customers_phone
  on public.pos_customers (store_id, normalized_phone);

create index if not exists idx_pos_customers_name
  on public.pos_customers (store_id, name);

alter table public.pos_customers enable row level security;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname='public' and tablename='pos_customers'
      and policyname='authenticated read customers'
  ) then
    create policy "authenticated read customers"
      on public.pos_customers for select
      to authenticated using (true);
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname='public' and tablename='pos_customers'
      and policyname='authenticated write customers'
  ) then
    create policy "authenticated write customers"
      on public.pos_customers for insert
      to authenticated with check (true);
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname='public' and tablename='pos_customers'
      and policyname='authenticated update customers'
  ) then
    create policy "authenticated update customers"
      on public.pos_customers for update
      to authenticated using (true) with check (true);
  end if;
end $$;

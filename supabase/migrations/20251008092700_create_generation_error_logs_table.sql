-- Migration: Create generation_error_logs table
-- Purpose: Track errors during AI generation attempts for debugging and monitoring
-- Affected tables: generation_error_logs
-- Dependencies: Supabase Auth users table

-- Create generation_error_logs table
create table public.generation_error_logs (
  id bigserial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  model varchar not null,
  source_text_hash varchar not null,
  source_text_length integer not null check (source_text_length between 1000 and 10000),
  error_code varchar(100) not null,
  error_message text not null,
  created_at timestamptz not null default now()
);

-- Enable Row Level Security
alter table public.generation_error_logs enable row level security;

-- Create RLS policy for authenticated users to select their own error logs
create policy "Users can select their own error logs"
  on public.generation_error_logs
  for select
  to authenticated
  using (auth.uid() = user_id);

-- Create RLS policy for authenticated users to insert their own error logs
create policy "Users can insert their own error logs"
  on public.generation_error_logs
  for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Note: No update or delete policies as error logs should be immutable for audit purposes

-- Add comments explaining the table structure and purpose
comment on table public.generation_error_logs is 'Stores error logs from failed AI generation attempts for debugging and monitoring';
comment on column public.generation_error_logs.model is 'AI model that failed during generation';
comment on column public.generation_error_logs.source_text_hash is 'Hash of the source text that caused the error';
comment on column public.generation_error_logs.source_text_length is 'Character length of source text that caused error (must be between 1000-10000)';
comment on column public.generation_error_logs.error_code is 'Standardized error code for categorization';
comment on column public.generation_error_logs.error_message is 'Detailed error message for debugging purposes';

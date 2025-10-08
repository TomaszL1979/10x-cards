-- Migration: Create generations table
-- Purpose: Track AI generation sessions and their metadata
-- Affected tables: generations
-- Dependencies: Supabase Auth users table

-- Create generations table
create table public.generations (
  id bigserial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  model varchar not null,
  generated_count integer not null,
  accepted_unedited_count integer,
  accepted_edited_count integer,
  source_text_hash varchar not null,
  source_text_length integer not null check (source_text_length between 1000 and 10000),
  generation_duration integer not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Enable Row Level Security
alter table public.generations enable row level security;

-- Create RLS policy for authenticated users to select their own generations
create policy "Users can select their own generations"
  on public.generations
  for select
  to authenticated
  using (auth.uid() = user_id);

-- Create RLS policy for authenticated users to insert their own generations
create policy "Users can insert their own generations"
  on public.generations
  for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Create RLS policy for authenticated users to update their own generations
create policy "Users can update their own generations"
  on public.generations
  for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Create RLS policy for authenticated users to delete their own generations
create policy "Users can delete their own generations"
  on public.generations
  for delete
  to authenticated
  using (auth.uid() = user_id);

-- Add comments explaining the table structure and purpose
comment on table public.generations is 'Tracks AI generation sessions with metadata about source text and results';
comment on column public.generations.model is 'AI model used for flashcard generation';
comment on column public.generations.generated_count is 'Total number of flashcards generated in this session';
comment on column public.generations.accepted_unedited_count is 'Number of AI-generated flashcards accepted without editing';
comment on column public.generations.accepted_edited_count is 'Number of AI-generated flashcards accepted after editing';
comment on column public.generations.source_text_hash is 'Hash of the source text to prevent duplicate processing';
comment on column public.generations.source_text_length is 'Character length of source text (must be between 1000-10000)';
comment on column public.generations.generation_duration is 'Time taken for AI generation in seconds';

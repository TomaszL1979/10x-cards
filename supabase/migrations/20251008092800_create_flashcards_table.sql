-- Migration: Create flashcards table
-- Purpose: Store user-generated flashcards with AI generation tracking
-- Affected tables: flashcards
-- Dependencies: Supabase Auth users table, generations table

-- Create flashcards table
create table public.flashcards (
  id bigserial primary key,
  front varchar(200) not null,
  back varchar(500) not null,
  source varchar not null check (source in ('ai-full', 'ai-edited', 'manual')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  generation_id bigint references public.generations(id) on delete set null,
  user_id uuid not null references auth.users(id) on delete cascade
);

-- Enable Row Level Security
alter table public.flashcards enable row level security;

-- Create RLS policy for authenticated users to select their own flashcards
create policy "Users can select their own flashcards"
  on public.flashcards
  for select
  to authenticated
  using (auth.uid() = user_id);

-- Create RLS policy for authenticated users to insert their own flashcards
create policy "Users can insert their own flashcards"
  on public.flashcards
  for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Create RLS policy for authenticated users to update their own flashcards
create policy "Users can update their own flashcards"
  on public.flashcards
  for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Create RLS policy for authenticated users to delete their own flashcards
create policy "Users can delete their own flashcards"
  on public.flashcards
  for delete
  to authenticated
  using (auth.uid() = user_id);

-- Add comment explaining the table structure and purpose
comment on table public.flashcards is 'Stores user-generated flashcards with tracking of AI generation source';
comment on column public.flashcards.source is 'Tracks how the flashcard was created: ai-full (unedited AI), ai-edited (edited AI), manual (user created)';
comment on column public.flashcards.generation_id is 'Optional reference to the AI generation session that created this flashcard';

-- Migration: Disable all RLS policies
-- Purpose: Remove all Row Level Security policies from flashcards, generations and generation_error_logs tables
-- Affected tables: flashcards, generations, generation_error_logs
-- Dependencies: All previous migrations that created RLS policies

-- Drop all RLS policies from generations table
drop policy if exists "Users can select their own generations" on public.generations;
drop policy if exists "Users can insert their own generations" on public.generations;
drop policy if exists "Users can update their own generations" on public.generations;
drop policy if exists "Users can delete their own generations" on public.generations;

-- Drop all RLS policies from generation_error_logs table
drop policy if exists "Users can select their own error logs" on public.generation_error_logs;
drop policy if exists "Users can insert their own error logs" on public.generation_error_logs;

-- Drop all RLS policies from flashcards table
drop policy if exists "Users can select their own flashcards" on public.flashcards;
drop policy if exists "Users can insert their own flashcards" on public.flashcards;
drop policy if exists "Users can update their own flashcards" on public.flashcards;
drop policy if exists "Users can delete their own flashcards" on public.flashcards;

-- Disable Row Level Security on all tables
alter table public.generations disable row level security;
alter table public.generation_error_logs disable row level security;
alter table public.flashcards disable row level security;

-- Add comment explaining the migration purpose
comment on table public.generations is 'Tracks AI generation sessions with metadata about source text and results (RLS disabled)';
comment on table public.generation_error_logs is 'Stores error logs from failed AI generation attempts for debugging and monitoring (RLS disabled)';
comment on table public.flashcards is 'Stores user-generated flashcards with tracking of AI generation source (RLS disabled)';


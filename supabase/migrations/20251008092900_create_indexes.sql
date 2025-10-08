-- Migration: Create database indexes
-- Purpose: Add indexes for optimal query performance across all tables
-- Affected tables: flashcards, generations, generation_error_logs
-- Dependencies: All table creation migrations

-- Index on user_id in flashcards table for efficient user-based queries
create index idx_flashcards_user_id 
  on public.flashcards (user_id);

-- Index on generation_id in flashcards table for efficient generation-based queries
create index idx_flashcards_generation_id 
  on public.flashcards (generation_id);

-- Index on user_id in generations table for efficient user-based queries
create index idx_generations_user_id 
  on public.generations (user_id);

-- Index on user_id in generation_error_logs table for efficient user-based queries
create index idx_generation_error_logs_user_id 
  on public.generation_error_logs (user_id);

-- Additional composite index on flashcards for user queries ordered by creation date
create index idx_flashcards_user_created 
  on public.flashcards (user_id, created_at desc);

-- Additional composite index on generations for user queries ordered by creation date
create index idx_generations_user_created 
  on public.generations (user_id, created_at desc);

-- Index on source_text_hash in generations for duplicate detection
create index idx_generations_source_hash 
  on public.generations (source_text_hash);

-- Add comments explaining index purposes
comment on index idx_flashcards_user_id is 'Optimizes queries filtering flashcards by user_id';
comment on index idx_flashcards_generation_id is 'Optimizes queries joining flashcards with generations';
comment on index idx_generations_user_id is 'Optimizes queries filtering generations by user_id';
comment on index idx_generation_error_logs_user_id is 'Optimizes queries filtering error logs by user_id';
comment on index idx_flashcards_user_created is 'Optimizes user flashcard lists ordered by creation date';
comment on index idx_generations_user_created is 'Optimizes user generation history ordered by creation date';
comment on index idx_generations_source_hash is 'Optimizes duplicate source text detection';

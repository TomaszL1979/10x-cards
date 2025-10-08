-- Migration: Create triggers for automatic timestamp updates
-- Purpose: Automatically update updated_at columns when records are modified
-- Affected tables: flashcards, generations
-- Dependencies: All table creation migrations

-- Create function to update updated_at timestamp
create or replace function public.handle_updated_at()
returns trigger
language plpgsql
security definer
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- Create trigger for flashcards table
create trigger trigger_flashcards_updated_at
  before update on public.flashcards
  for each row
  execute function public.handle_updated_at();

-- Create trigger for generations table
create trigger trigger_generations_updated_at
  before update on public.generations
  for each row
  execute function public.handle_updated_at();

-- Add comments explaining the trigger functionality
comment on function public.handle_updated_at() is 'Trigger function that automatically sets updated_at to current timestamp on record updates';
comment on trigger trigger_flashcards_updated_at on public.flashcards is 'Automatically updates the updated_at column when flashcard records are modified';
comment on trigger trigger_generations_updated_at on public.generations is 'Automatically updates the updated_at column when generation records are modified';

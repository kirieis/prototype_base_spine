-- SpendWise: supabase/expenses.sql
-- Run this in Supabase SQL Editor to set up the database

-- 1. Create the expenses table
CREATE TABLE IF NOT EXISTS expenses (
  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id     uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL DEFAULT auth.uid(),
  amount      numeric NOT NULL CHECK (amount > 0),
  category    text NOT NULL CHECK (category IN ('Food', 'Transport', 'Shopping', 'Bills', 'Other')),
  spent_on    date NOT NULL,
  note        text DEFAULT '' CHECK (note IS NULL OR length(note) <= 100),
  created_at  timestamptz DEFAULT now() NOT NULL
);

-- 2. Enable Row Level Security
ALTER TABLE expenses ENABLE ROW LEVEL SECURITY;

-- 3. RLS Policies
-- Allow logged-in user to SELECT only their own rows
CREATE POLICY "Users can view own expenses"
  ON expenses FOR SELECT
  USING (auth.uid() = user_id);

-- Allow logged-in user to INSERT only rows where user_id = their uid
CREATE POLICY "Users can insert own expenses"
  ON expenses FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Allow logged-in user to DELETE only their own rows
CREATE POLICY "Users can delete own expenses"
  ON expenses FOR DELETE
  USING (auth.uid() = user_id);

-- Allow logged-in user to UPDATE only their own rows
CREATE POLICY "Users can update own expenses"
  ON expenses FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

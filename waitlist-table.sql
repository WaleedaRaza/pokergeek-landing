-- ============================================
-- WAITLIST TABLE FOR SUPABASE
-- Run this in your Supabase SQL Editor
-- ============================================

-- Create the waitlist table
CREATE TABLE IF NOT EXISTS waitlist (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  source TEXT DEFAULT 'website',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  notes TEXT
);

-- Create index for faster email lookups
CREATE INDEX IF NOT EXISTS idx_waitlist_email ON waitlist(email);

-- Enable Row Level Security
ALTER TABLE waitlist ENABLE ROW LEVEL SECURITY;

-- Policy: Allow anyone to INSERT (for signups)
CREATE POLICY "Allow public inserts" ON waitlist
  FOR INSERT
  WITH CHECK (true);

-- Policy: Only authenticated users can SELECT (for admin)
-- You can modify this based on your needs
CREATE POLICY "Allow authenticated reads" ON waitlist
  FOR SELECT
  USING (auth.role() = 'authenticated');

-- Grant insert permission to anon role (for public signups)
GRANT INSERT ON waitlist TO anon;

-- Optional: Create a view for easy admin access
CREATE OR REPLACE VIEW waitlist_stats AS
SELECT 
  COUNT(*) as total_signups,
  COUNT(DISTINCT source) as unique_sources,
  MIN(created_at) as first_signup,
  MAX(created_at) as latest_signup
FROM waitlist;

-- ============================================
-- AFTER RUNNING THIS:
-- 1. Go to your Supabase project settings
-- 2. Copy your Project URL and anon key
-- 3. Paste them into index.html where indicated
-- ============================================


-- Run this SQL in your Supabase SQL Editor to create the inventory table

-- Create the inventory table
CREATE TABLE IF NOT EXISTS inventory (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    qty_in NUMERIC DEFAULT 0,
    qty_out NUMERIC DEFAULT 0,
    category TEXT DEFAULT 'General',
    icon TEXT,
    archived_category TEXT,
    archived_date TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security (optional - allows public read/write)
ALTER TABLE inventory ENABLE ROW LEVEL SECURITY;

-- Create policy for anonymous access (if using anon key)
CREATE POLICY "Allow public access" ON inventory
    FOR ALL
    TO anon
    USING (true)
    WITH CHECK (true);

-- Or if using authenticated users only:
-- CREATE POLICY "Allow authenticated access" ON inventory
--     FOR ALL
--     TO authenticated
--     USING (true)
--     WITH CHECK (true);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_inventory_category ON inventory(category);
CREATE INDEX IF NOT EXISTS idx_inventory_name ON inventory(name);


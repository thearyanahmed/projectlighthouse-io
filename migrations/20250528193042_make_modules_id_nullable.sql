-- Add migration script here
ALTER TABLE lessons ALTER COLUMN module_id DROP NOT NULL;

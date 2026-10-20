ALTER TABLE actors_companies.company_visit
    ADD COLUMN IF NOT EXISTS first_visit_late BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE actors_companies.company_visit
    ALTER COLUMN visit_number TYPE INTEGER
    USING visit_number::INTEGER;

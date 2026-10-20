ALTER TABLE actors_companies.company_visit
    ALTER COLUMN visit_number TYPE SMALLINT
    USING visit_number::SMALLINT;

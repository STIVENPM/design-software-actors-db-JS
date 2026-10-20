DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint c
        JOIN pg_class t ON t.oid = c.conrelid
        JOIN pg_namespace n ON n.oid = t.relnamespace
        WHERE c.contype = 'p'
          AND n.nspname = 'actors_parameterization'
          AND t.relname = 'status_category'
    ) THEN
        ALTER TABLE actors_parameterization.status_category
        ADD CONSTRAINT pk_status_category PRIMARY KEY (id);
    END IF;
END $$;

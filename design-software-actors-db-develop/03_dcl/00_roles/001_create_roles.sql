-- Roles de aplicacion (least-privilege) para el dominio actors
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='actors_reader') THEN CREATE ROLE actors_reader NOLOGIN; END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='actors_writer') THEN CREATE ROLE actors_writer NOLOGIN; END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='actors_admin')  THEN CREATE ROLE actors_admin  NOLOGIN; END IF;
END $$;

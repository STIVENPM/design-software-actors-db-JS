-- Refinamiento (2026-08-13): workflow de excepcion del instructor (estado + soporte documental + revisor).
-- Changeset NUEVO (refinamiento-actors-exception-970); solo ADD COLUMN + CHECK.
ALTER TABLE actors_instructors.instructor_availability_exception ADD COLUMN IF NOT EXISTS status              VARCHAR(12) NOT NULL DEFAULT 'APPROVED';
ALTER TABLE actors_instructors.instructor_availability_exception ADD COLUMN IF NOT EXISTS support_document_id UUID;
ALTER TABLE actors_instructors.instructor_availability_exception ADD COLUMN IF NOT EXISTS reviewed_by         UUID;
ALTER TABLE actors_instructors.instructor_availability_exception ADD COLUMN IF NOT EXISTS reviewed_at         TIMESTAMPTZ;
ALTER TABLE actors_instructors.instructor_availability_exception ADD COLUMN IF NOT EXISTS decision_reason     TEXT;
ALTER TABLE actors_instructors.instructor_availability_exception DROP CONSTRAINT IF EXISTS ck_instructor_exception_status;
ALTER TABLE actors_instructors.instructor_availability_exception ADD  CONSTRAINT ck_instructor_exception_status CHECK (status IN ('PENDING','APPROVED','REJECTED','CANCELLED'));

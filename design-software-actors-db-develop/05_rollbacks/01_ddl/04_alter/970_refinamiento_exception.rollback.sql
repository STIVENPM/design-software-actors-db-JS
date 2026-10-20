-- Rollback espejo de refinamiento-actors-exception-970.
ALTER TABLE actors_instructors.instructor_availability_exception DROP CONSTRAINT IF EXISTS ck_instructor_exception_status;
ALTER TABLE actors_instructors.instructor_availability_exception DROP COLUMN IF EXISTS decision_reason;
ALTER TABLE actors_instructors.instructor_availability_exception DROP COLUMN IF EXISTS reviewed_at;
ALTER TABLE actors_instructors.instructor_availability_exception DROP COLUMN IF EXISTS reviewed_by;
ALTER TABLE actors_instructors.instructor_availability_exception DROP COLUMN IF EXISTS support_document_id;
ALTER TABLE actors_instructors.instructor_availability_exception DROP COLUMN IF EXISTS status;

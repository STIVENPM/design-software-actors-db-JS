CREATE INDEX IF NOT EXISTS ix_instructor_is_active
ON actors_instructors.instructor (is_active)
WHERE is_active = true;

CREATE INDEX IF NOT EXISTS ix_instructor_last_name_first_name
ON actors_instructors.instructor (last_name, first_name);

CREATE UNIQUE INDEX IF NOT EXISTS uq_instructor_contract_current
ON actors_instructors.instructor_contract (instructor_id)
WHERE is_current = true AND deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS ix_instructor_contract_instructor_id
ON actors_instructors.instructor_contract (instructor_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_competency_assignment_active
ON actors_instructors.competency_assignment (instructor_id, competency_id)
WHERE is_active = true AND deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS ix_competency_assignment_instructor_id
ON actors_instructors.competency_assignment (instructor_id);

CREATE INDEX IF NOT EXISTS ix_competency_assignment_competency_id_active
ON actors_instructors.competency_assignment (competency_id)
WHERE is_active = true;

CREATE INDEX IF NOT EXISTS ix_instructor_availability_exception_instructor_dates
ON actors_instructors.instructor_availability_exception (instructor_id, start_datetime, end_datetime);

CREATE INDEX IF NOT EXISTS ix_learner_last_name_first_name
ON actors_learners.learner (last_name, first_name);

CREATE UNIQUE INDEX IF NOT EXISTS uq_learner_ficha_enrollment_current
ON actors_learners.learner_ficha_enrollment (learner_id)
WHERE is_current = true AND deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS ix_learner_ficha_enrollment_enrollment_status_id
ON actors_learners.learner_ficha_enrollment (enrollment_status_id);

CREATE INDEX IF NOT EXISTS ix_learner_ficha_enrollment_ficha_id
ON actors_learners.learner_ficha_enrollment (ficha_id);

CREATE INDEX IF NOT EXISTS ix_learner_ficha_enrollment_learner_id_enrollment_date
ON actors_learners.learner_ficha_enrollment (learner_id, enrollment_date);

CREATE INDEX IF NOT EXISTS ix_status_transition_to_status_id
ON actors_parameterization.status_transition (to_status_id);

CREATE INDEX IF NOT EXISTS ix_productive_stage_learner_id
ON actors_companies.productive_stage (learner_id);

CREATE INDEX IF NOT EXISTS ix_productive_stage_company_id
ON actors_companies.productive_stage (company_id);

CREATE INDEX IF NOT EXISTS ix_productive_stage_supervisor_instructor_id
ON actors_companies.productive_stage (supervisor_instructor_id);

CREATE INDEX IF NOT EXISTS ix_productive_stage_status_id
ON actors_companies.productive_stage (status_id);

CREATE INDEX IF NOT EXISTS ix_company_visit_productive_stage_id
ON actors_companies.company_visit (productive_stage_id);

CREATE INDEX IF NOT EXISTS ix_company_visit_instructor_id_visit_date
ON actors_companies.company_visit (instructor_id, visit_date);

CREATE INDEX IF NOT EXISTS ix_actor_improvement_plan_instructor_id_status_id
ON actors_tracking.actor_improvement_plan (instructor_id, status_id);

CREATE INDEX IF NOT EXISTS ix_actor_improvement_plan_learner_id_status_id
ON actors_tracking.actor_improvement_plan (learner_id, status_id);

CREATE INDEX IF NOT EXISTS ix_actor_improvement_plan_status_due_date
ON actors_tracking.actor_improvement_plan (status_id, due_date);

CREATE INDEX IF NOT EXISTS ix_actor_improvement_plan_status_id
ON actors_tracking.actor_improvement_plan (status_id);

CREATE INDEX IF NOT EXISTS ix_activity_log_instructor_id_recorded_at
ON actors_tracking.activity_log (instructor_id, recorded_at)
WHERE instructor_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS ix_activity_log_learner_id_recorded_at
ON actors_tracking.activity_log (learner_id, recorded_at)
WHERE learner_id IS NOT NULL;

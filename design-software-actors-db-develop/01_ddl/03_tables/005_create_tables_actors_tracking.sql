CREATE TABLE IF NOT EXISTS actors_tracking.actor_improvement_plan (
    id UUID NOT NULL,
    instructor_id UUID,
    learner_id UUID,
    origin VARCHAR(20) NOT NULL,
    origin_reference_id UUID,
    description TEXT NOT NULL,
    specific_goals TEXT NOT NULL,
    due_date DATE NOT NULL,
    status_id UUID NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_by UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0,
    completed_at TIMESTAMPTZ,
    CONSTRAINT ck_actor_improvement_plan_actor CHECK ((instructor_id IS NOT NULL) <> (learner_id IS NOT NULL)),
    CONSTRAINT ck_actor_improvement_plan_origin CHECK (origin IN ('COMPANY_VISIT','PERFORMANCE_REVIEW','TRACKING_SESSION','DISCIPLINARY'))
);

CREATE TABLE IF NOT EXISTS actors_tracking.activity_log (
    id UUID NOT NULL,
    instructor_id UUID,
    learner_id UUID,
    event_type VARCHAR(60) NOT NULL,
    description TEXT NOT NULL,
    previous_value TEXT,
    new_value TEXT,
    recorded_by UUID,
    recorded_at TIMESTAMPTZ NOT NULL,
    CONSTRAINT ck_activity_log_actor CHECK ((instructor_id IS NOT NULL) <> (learner_id IS NOT NULL))
);

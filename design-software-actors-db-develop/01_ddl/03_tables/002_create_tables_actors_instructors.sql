CREATE TABLE IF NOT EXISTS actors_instructors.instructor (
    id UUID NOT NULL,
    user_id UUID NOT NULL,
    document_type VARCHAR(2) NOT NULL,
    document_number VARCHAR(20) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    default_max_hours_per_week DECIMAL(4,1) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL,
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0,
    CONSTRAINT ck_instructor_document_type CHECK (document_type IN ('CC','CE','PA','PE')),
    CONSTRAINT ck_instructor_default_max_hours_per_week CHECK (default_max_hours_per_week >= 0)
);

CREATE TABLE IF NOT EXISTS actors_instructors.instructor_area (
    id UUID NOT NULL,
    instructor_id UUID NOT NULL,
    area_name VARCHAR(100) NOT NULL,
    is_primary BOOLEAN NOT NULL DEFAULT false,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL,
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS actors_instructors.instructor_contract (
    id UUID NOT NULL,
    instructor_id UUID NOT NULL,
    contract_type VARCHAR(12) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    training_center_id UUID NOT NULL,
    weekly_hour_limit DECIMAL(4,1),
    is_current BOOLEAN NOT NULL DEFAULT false,
    notes TEXT,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL,
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0,
    CONSTRAINT ck_instructor_contract_contract_type CHECK (contract_type IN ('STAFF','CONTRACTOR','HOURLY')),
    CONSTRAINT ck_instructor_contract_weekly_hour_limit CHECK (weekly_hour_limit IS NULL OR weekly_hour_limit >= 0),
    CONSTRAINT ck_instructor_contract_dates CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE IF NOT EXISTS actors_instructors.competency_assignment (
    id UUID NOT NULL,
    instructor_id UUID NOT NULL,
    competency_id UUID NOT NULL,
    certified_at DATE NOT NULL,
    certification_entity VARCHAR(200),
    requires_review BOOLEAN NOT NULL DEFAULT false,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL,
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS actors_instructors.instructor_availability_exception (
    id UUID NOT NULL,
    instructor_id UUID NOT NULL,
    exception_type VARCHAR(20) NOT NULL,
    start_datetime TIMESTAMPTZ NOT NULL,
    end_datetime TIMESTAMPTZ NOT NULL,
    description TEXT,
    approved_by UUID,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL,
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    updated_by UUID NOT NULL,
    deleted_at TIMESTAMPTZ,
    deleted_by UUID,
    row_version INT NOT NULL DEFAULT 0,
    CONSTRAINT ck_instructor_availability_exception_type CHECK (exception_type IN ('SICK_LEAVE','VACATION','COMMISSION','PERSONAL_LEAVE','TRAINING','OTHER')),
    CONSTRAINT ck_instructor_availability_exception_dates CHECK (end_datetime > start_datetime)
);

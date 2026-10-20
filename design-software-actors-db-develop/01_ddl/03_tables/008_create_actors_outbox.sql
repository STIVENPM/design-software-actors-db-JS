CREATE TABLE actors_tracking.outbox_event (
    event_id UUID PRIMARY KEY,
    event_type VARCHAR(120) NOT NULL,
    aggregate_id UUID NOT NULL,
    topic VARCHAR(120) NOT NULL,
    envelope JSONB NOT NULL,
    status VARCHAR(16) NOT NULL DEFAULT 'PENDING',
    attempts INTEGER NOT NULL DEFAULT 0,
    available_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    lease_until TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    published_at TIMESTAMPTZ,
    last_error VARCHAR(1000),
    CONSTRAINT ck_outbox_status CHECK (status IN ('PENDING', 'SENDING', 'PUBLISHED', 'DEAD')),
    CONSTRAINT ck_outbox_attempts CHECK (attempts >= 0)
);
CREATE INDEX ix_outbox_ready ON actors_tracking.outbox_event (available_at, created_at)
    WHERE status = 'PENDING';
CREATE INDEX ix_outbox_lease ON actors_tracking.outbox_event (lease_until)
    WHERE status = 'SENDING';

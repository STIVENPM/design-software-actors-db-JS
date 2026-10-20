CREATE TABLE IF NOT EXISTS actors_tracking.iam_processed_event (
    event_id UUID NOT NULL,
    user_id UUID NOT NULL,
    event_type VARCHAR(60) NOT NULL,
    processed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT pk_iam_processed_event PRIMARY KEY (event_id)
);

CREATE INDEX IF NOT EXISTS ix_iam_processed_event_user_id
ON actors_tracking.iam_processed_event (user_id);

CREATE INDEX IF NOT EXISTS ix_iam_processed_event_processed_at
ON actors_tracking.iam_processed_event (processed_at);

GRANT SELECT ON actors_tracking.outbox_event TO actors_reader;
GRANT SELECT, INSERT, UPDATE ON actors_tracking.outbox_event TO actors_writer;
GRANT ALL PRIVILEGES ON actors_tracking.outbox_event TO actors_admin;

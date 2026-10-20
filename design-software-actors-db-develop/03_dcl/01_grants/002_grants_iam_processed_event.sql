GRANT SELECT ON actors_tracking.iam_processed_event TO actors_reader;
GRANT SELECT, INSERT ON actors_tracking.iam_processed_event TO actors_writer;
REVOKE UPDATE, DELETE ON actors_tracking.iam_processed_event FROM actors_writer;
GRANT ALL PRIVILEGES ON actors_tracking.iam_processed_event TO actors_admin;

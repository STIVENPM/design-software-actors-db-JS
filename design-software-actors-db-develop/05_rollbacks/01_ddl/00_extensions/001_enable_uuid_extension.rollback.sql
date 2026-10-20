-- Rollback: deshabilita la extensión uuid-ossp habilitada en 01_ddl/00_extensions/001_enable_uuid_extension.sql
DROP EXTENSION IF EXISTS "uuid-ossp";

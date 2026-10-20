-- Quality polish v2: elimina columna transitiva (3NF) status_transition.status_category_id
-- (derivable de from_status_id -> status -> status_category). Elimina su FK e indice en cascada.
ALTER TABLE actors_parameterization.status_transition DROP COLUMN IF EXISTS status_category_id;

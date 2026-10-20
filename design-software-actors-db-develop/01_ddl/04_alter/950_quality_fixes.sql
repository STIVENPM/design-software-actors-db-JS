-- Quality fixes (v2.0.0): id DEFAULT gen_random_uuid() e indices de FK faltantes
ALTER TABLE actors_companies.company ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_companies.company_visit ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_companies.productive_stage ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_instructors.competency_assignment ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_instructors.instructor ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_instructors.instructor_area ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_instructors.instructor_availability_exception ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_instructors.instructor_contract ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_learners.learner ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_learners.learner_ficha_enrollment ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_parameterization.status ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_parameterization.status_category ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_parameterization.status_transition ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_tracking.activity_log ALTER COLUMN id SET DEFAULT gen_random_uuid();
ALTER TABLE actors_tracking.actor_improvement_plan ALTER COLUMN id SET DEFAULT gen_random_uuid();

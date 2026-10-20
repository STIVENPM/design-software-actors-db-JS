ALTER TABLE actors_parameterization.status
ADD CONSTRAINT pk_status
PRIMARY KEY (id);

ALTER TABLE actors_parameterization.status_transition
ADD CONSTRAINT pk_status_transition
PRIMARY KEY (id);

ALTER TABLE actors_instructors.instructor
ADD CONSTRAINT pk_instructor
PRIMARY KEY (id);

ALTER TABLE actors_instructors.instructor_area
ADD CONSTRAINT pk_instructor_area
PRIMARY KEY (id);

ALTER TABLE actors_instructors.instructor_contract
ADD CONSTRAINT pk_instructor_contract
PRIMARY KEY (id);

ALTER TABLE actors_instructors.competency_assignment
ADD CONSTRAINT pk_competency_assignment
PRIMARY KEY (id);

ALTER TABLE actors_instructors.instructor_availability_exception
ADD CONSTRAINT pk_instructor_availability_exception
PRIMARY KEY (id);

ALTER TABLE actors_learners.learner
ADD CONSTRAINT pk_learner
PRIMARY KEY (id);

ALTER TABLE actors_learners.learner_ficha_enrollment
ADD CONSTRAINT pk_learner_ficha_enrollment
PRIMARY KEY (id);

ALTER TABLE actors_companies.company
ADD CONSTRAINT pk_company
PRIMARY KEY (id);

ALTER TABLE actors_companies.productive_stage
ADD CONSTRAINT pk_productive_stage
PRIMARY KEY (id);

ALTER TABLE actors_companies.company_visit
ADD CONSTRAINT pk_company_visit
PRIMARY KEY (id);

ALTER TABLE actors_tracking.actor_improvement_plan
ADD CONSTRAINT pk_actor_improvement_plan
PRIMARY KEY (id);

ALTER TABLE actors_tracking.activity_log
ADD CONSTRAINT pk_activity_log
PRIMARY KEY (id);

ALTER TABLE actors_parameterization.status_category
ADD CONSTRAINT uq_status_category_code
UNIQUE (code);

ALTER TABLE actors_parameterization.status
ADD CONSTRAINT uq_status_status_category_id_code
UNIQUE (status_category_id, code);

ALTER TABLE actors_parameterization.status_transition
ADD CONSTRAINT uq_status_transition_from_status_id_to_status_id
UNIQUE (from_status_id, to_status_id);

ALTER TABLE actors_instructors.instructor
ADD CONSTRAINT uq_instructor_user_id
UNIQUE (user_id);

ALTER TABLE actors_instructors.instructor
ADD CONSTRAINT uq_instructor_document_number
UNIQUE (document_number);

ALTER TABLE actors_instructors.instructor_area
ADD CONSTRAINT uq_instructor_area_instructor_id_area_name
UNIQUE (instructor_id, area_name);

ALTER TABLE actors_learners.learner
ADD CONSTRAINT uq_learner_user_id
UNIQUE (user_id);

ALTER TABLE actors_learners.learner
ADD CONSTRAINT uq_learner_document_number
UNIQUE (document_number);

ALTER TABLE actors_learners.learner_ficha_enrollment
ADD CONSTRAINT uq_learner_ficha_enrollment_learner_id_ficha_id
UNIQUE (learner_id, ficha_id);

ALTER TABLE actors_companies.company
ADD CONSTRAINT uq_company_nit
UNIQUE (nit);

ALTER TABLE actors_parameterization.status
ADD CONSTRAINT fk_status_status_category
FOREIGN KEY (status_category_id)
REFERENCES actors_parameterization.status_category(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_parameterization.status_transition
ADD CONSTRAINT fk_status_transition_status_category
FOREIGN KEY (status_category_id)
REFERENCES actors_parameterization.status_category(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_parameterization.status_transition
ADD CONSTRAINT fk_status_transition_from_status
FOREIGN KEY (from_status_id)
REFERENCES actors_parameterization.status(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_parameterization.status_transition
ADD CONSTRAINT fk_status_transition_to_status
FOREIGN KEY (to_status_id)
REFERENCES actors_parameterization.status(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_instructors.instructor_area
ADD CONSTRAINT fk_instructor_area_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_instructors.instructor_contract
ADD CONSTRAINT fk_instructor_contract_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_instructors.competency_assignment
ADD CONSTRAINT fk_competency_assignment_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_instructors.instructor_availability_exception
ADD CONSTRAINT fk_instructor_availability_exception_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_learners.learner_ficha_enrollment
ADD CONSTRAINT fk_learner_ficha_enrollment_learner
FOREIGN KEY (learner_id)
REFERENCES actors_learners.learner(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_learners.learner_ficha_enrollment
ADD CONSTRAINT fk_learner_ficha_enrollment_enrollment_status
FOREIGN KEY (enrollment_status_id)
REFERENCES actors_parameterization.status(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_companies.productive_stage
ADD CONSTRAINT fk_productive_stage_learner
FOREIGN KEY (learner_id)
REFERENCES actors_learners.learner(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_companies.productive_stage
ADD CONSTRAINT fk_productive_stage_company
FOREIGN KEY (company_id)
REFERENCES actors_companies.company(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_companies.productive_stage
ADD CONSTRAINT fk_productive_stage_supervisor_instructor
FOREIGN KEY (supervisor_instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_companies.productive_stage
ADD CONSTRAINT fk_productive_stage_status
FOREIGN KEY (status_id)
REFERENCES actors_parameterization.status(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_companies.company_visit
ADD CONSTRAINT fk_company_visit_productive_stage
FOREIGN KEY (productive_stage_id)
REFERENCES actors_companies.productive_stage(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_companies.company_visit
ADD CONSTRAINT fk_company_visit_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_tracking.actor_improvement_plan
ADD CONSTRAINT fk_actor_improvement_plan_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_tracking.actor_improvement_plan
ADD CONSTRAINT fk_actor_improvement_plan_learner
FOREIGN KEY (learner_id)
REFERENCES actors_learners.learner(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE actors_tracking.actor_improvement_plan
ADD CONSTRAINT fk_actor_improvement_plan_status
FOREIGN KEY (status_id)
REFERENCES actors_parameterization.status(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE actors_tracking.activity_log
ADD CONSTRAINT fk_activity_log_instructor
FOREIGN KEY (instructor_id)
REFERENCES actors_instructors.instructor(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE actors_tracking.activity_log
ADD CONSTRAINT fk_activity_log_learner
FOREIGN KEY (learner_id)
REFERENCES actors_learners.learner(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

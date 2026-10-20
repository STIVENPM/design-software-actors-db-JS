-- Local/integration fixture for HU-ACT-019.
-- The local database currently exposes only the legacy three-column status table.
-- Reuse its existing category instead of inventing a second category.
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='actors_parameterization' AND table_name='status_category' AND column_name='name') THEN
    INSERT INTO actors_parameterization.status_category
      (id, code, name, description, applies_to_entity, created_at, created_by, updated_at, updated_by)
    VALUES ('d5000000-0000-0000-0000-000000000001','LEARNER_ENROLLMENT_STATUS','Learner enrollment status','HU-ACT-019 fixture','LEARNER_FICHA_ENROLLMENT',now(),'d1000000-0000-0000-0000-000000000001',now(),'d1000000-0000-0000-0000-000000000001')
    ON CONFLICT (id) DO NOTHING;
  ELSE
    INSERT INTO actors_parameterization.status_category (id, code)
    VALUES ('d5000000-0000-0000-0000-000000000001','LEARNER_ENROLLMENT_STATUS');
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='actors_parameterization' AND table_name='status' AND column_name='name') THEN
    INSERT INTO actors_parameterization.status
      (id, status_category_id, code, name, description, is_initial, is_terminal, display_order, is_active, created_at, created_by, updated_at, updated_by)
    VALUES ('d6000000-0000-0000-0000-000000000001','d5000000-0000-0000-0000-000000000001','ACTIVE','Active','HU-ACT-019 fixture',true,false,1,true,now(),'d1000000-0000-0000-0000-000000000001',now(),'d1000000-0000-0000-0000-000000000001')
    ON CONFLICT (id) DO NOTHING;
  ELSE
    INSERT INTO actors_parameterization.status (id, code, status_category_id)
    VALUES ('d6000000-0000-0000-0000-000000000001','ACTIVE','d5000000-0000-0000-0000-000000000001');
  END IF;
END $$;

INSERT INTO actors_learners.learner
 (id, user_id, document_type, document_number, first_name, last_name, email, is_active, created_at, created_by, updated_at, updated_by)
VALUES ('d2000000-0000-0000-0000-000000000001','d1000000-0000-0000-0000-000000000001','CC','HUACT0190001','HU','Learner','hu-iam-017-learner@example.test',true,now(),'d1000000-0000-0000-0000-000000000001',now(),'d1000000-0000-0000-0000-000000000001')
;
INSERT INTO actors_learners.learner_ficha_enrollment
 (id, learner_id, ficha_id, enrollment_status_id, stage, enrollment_date, is_current, created_at, created_by, updated_at, updated_by, is_active)
VALUES ('d4000000-0000-0000-0000-000000000001','d2000000-0000-0000-0000-000000000001','d3000000-0000-0000-0000-000000000001','d6000000-0000-0000-0000-000000000001','INDUCTION',CURRENT_DATE,true,now(),'d1000000-0000-0000-0000-000000000001',now(),'d1000000-0000-0000-0000-000000000001',true)
;

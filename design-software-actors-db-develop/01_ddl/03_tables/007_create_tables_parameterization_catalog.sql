CREATE SCHEMA IF NOT EXISTS parameterization;

CREATE TABLE IF NOT EXISTS parameterization.catalog (
    id UUID NOT NULL,
    code VARCHAR(100) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    CONSTRAINT pk_parameterization_catalog PRIMARY KEY (id),
    CONSTRAINT uq_parameterization_catalog_code UNIQUE (code)
);

CREATE TABLE IF NOT EXISTS parameterization.catalog_detail (
    id UUID NOT NULL,
    catalog_id UUID NOT NULL,
    code VARCHAR(100) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    display_order INTEGER,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    CONSTRAINT pk_parameterization_catalog_detail PRIMARY KEY (id),
    CONSTRAINT fk_parameterization_catalog_detail_catalog
        FOREIGN KEY (catalog_id) REFERENCES parameterization.catalog (id),
    CONSTRAINT uq_parameterization_catalog_detail_code UNIQUE (catalog_id, code)
);

-- ddl.sql
-- This script creates host_info and host_usage tables if they don't exist

-- Create host_info table
CREATE TABLE IF NOT EXISTS public.host_info
(
    id               SERIAL PRIMARY KEY,
    hostname         VARCHAR NOT NULL UNIQUE,
    cpu_number       INT2 NOT NULL,
    cpu_architecture VARCHAR NOT NULL,
    cpu_model        VARCHAR NOT NULL,
    cpu_mhz          FLOAT8 NOT NULL,
    l2_cache         INT4 NOT NULL,
    "timestamp"      TIMESTAMP,
    total_mem        INT4
);

-- Create host_usage table
CREATE TABLE IF NOT EXISTS public.host_usage
(
    "timestamp"    TIMESTAMP NOT NULL,
    host_id        INT NOT NULL,
    memory_free    INT4 NOT NULL,
    cpu_idle       INT2 NOT NULL,
    cpu_kernel     INT2 NOT NULL,
    disk_io        INT4 NOT NULL,
    disk_available INT4 NOT NULL,
    CONSTRAINT host_usage_host_info_fk FOREIGN KEY (host_id)
        REFERENCES public.host_info(id)
);

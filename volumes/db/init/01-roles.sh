#!/bin/bash
# Supabase Self-Hosted: Idempotent Role Initialization
set -e
PW="${POSTGRES_PASSWORD:-changeme}"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<EOSQL

DO \$\$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'authenticator') THEN
    EXECUTE format('CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD %L', '${PW}');
  ELSE
    EXECUTE format('ALTER ROLE authenticator PASSWORD %L', '${PW}');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    EXECUTE format('CREATE ROLE supabase_auth_admin NOINHERIT CREATEROLE LOGIN PASSWORD %L', '${PW}');
  ELSE
    EXECUTE format('ALTER ROLE supabase_auth_admin PASSWORD %L', '${PW}');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_storage_admin') THEN
    EXECUTE format('CREATE ROLE supabase_storage_admin NOINHERIT CREATEROLE LOGIN PASSWORD %L', '${PW}');
  ELSE
    EXECUTE format('ALTER ROLE supabase_storage_admin PASSWORD %L', '${PW}');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_admin') THEN
    EXECUTE format('CREATE ROLE supabase_admin NOINHERIT CREATEROLE LOGIN PASSWORD %L', '${PW}');
  ELSE
    EXECUTE format('ALTER ROLE supabase_admin PASSWORD %L', '${PW}');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'anon') THEN
    CREATE ROLE anon NOLOGIN NOINHERIT;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'authenticated') THEN
    CREATE ROLE authenticated NOLOGIN NOINHERIT;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'service_role') THEN
    CREATE ROLE service_role NOLOGIN NOINHERIT BYPASSRLS;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_replication_admin') THEN
    EXECUTE format('CREATE ROLE supabase_replication_admin LOGIN REPLICATION PASSWORD %L', '${PW}');
  ELSE
    EXECUTE format('ALTER ROLE supabase_replication_admin PASSWORD %L', '${PW}');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_read_only_user') THEN
    CREATE ROLE supabase_read_only_user NOLOGIN NOINHERIT;
  END IF;

  GRANT anon TO authenticator;
  GRANT authenticated TO authenticator;
  GRANT service_role TO authenticator;
  GRANT supabase_admin TO authenticator;
END \$\$;

EOSQL

echo "Supabase roles initialized with POSTGRES_PASSWORD"
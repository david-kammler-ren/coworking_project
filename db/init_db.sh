export DB_PASSWORD=MVOgd5QRiHzobi6j
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U david -d coworking_db -p 5433 < 1_create_tables.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U david -d coworking_db -p 5433 < 2_seed_users.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U david -d coworking_db -p 5433 < 3_seed_tokens.sql

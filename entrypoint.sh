#!/bin/sh -l

DB_HOST=${DB_HOST:-"localhost"}
DB_PORT=${DB_PORT:-5432}
DB_USER=${DB_USER:-"postgres"}
DB_PASSWORD=${DB_PASSWORD:-"postgres"}

echo "Checking PostgreSQL liveness at $DB_HOST:$DB_PORT..."

# Perform a liveness check by attempting to connect
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c '\q'

if [ $? -eq 0 ]; then
  echo "PostgreSQL is alive!"
else
  echo "Failed to connect to PostgreSQL."
  exit 1
fi

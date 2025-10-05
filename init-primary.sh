#!/bin/bash
set -e
echo "Configuring primary (pg1)..."

cat >> /var/lib/postgresql/data/postgresql.conf <<EOF
wal_level = replica
max_wal_senders = 10
wal_keep_size = 64
listen_addresses = '*'
EOF

cat >> /var/lib/postgresql/data/pg_hba.conf <<EOF
host replication replicator all md5
host all all all md5
EOF

psql -U postgres -c "CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replica123';"
echo "Primary setup complete."
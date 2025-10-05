#!/bin/bash
set -e
echo "Configuring replica..."
sleep 10
rm -rf /var/lib/postgresql/data/*

PGPASSWORD=replica123 pg_basebackup -h pg1 -D /var/lib/postgresql/data -U replicator -Fp -Xs -P -R

echo "Replica setup complete."

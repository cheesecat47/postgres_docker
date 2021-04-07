#!/bin/bash
cd "$(dirname "$0")" || exit

CONFIG_PATH=".config"
mkdir -p $CONFIG_PATH

# PostgreSQL Configuration

PG_PASSWORD_PATH="$CONFIG_PATH/PG_PASSWORD"
touch $PG_PASSWORD_PATH
chmod 644 $PG_PASSWORD_PATH

read -p "Input PostgreSQL password >> " -r PG_PASSWORD
echo "$PG_PASSWORD" > $PG_PASSWORD_PATH

# pgAdmin Configurations

PGADMIN_EMAIL_PATH="$CONFIG_PATH/PGADMIN_EMAIL"
touch $PGADMIN_EMAIL_PATH
chmod 644 $PGADMIN_EMAIL_PATH

read -p "Input pgAdmin e-mail >> " -r PGADMIN_EMAIL
echo "$PGADMIN_EMAIL" > $PGADMIN_EMAIL_PATH

PGADMIN_PASSWORD_PATH="$CONFIG_PATH/PGADMIN_PASSWORD"
touch $PGADMIN_PASSWORD_PATH
chmod 644 $PGADMIN_PASSWORD_PATH

read -p "Input pgAdmin password >> " -r PGADMIN_PASSWORD
echo "$PGADMIN_PASSWORD" > $PGADMIN_PASSWORD_PATH

echo "Done!"
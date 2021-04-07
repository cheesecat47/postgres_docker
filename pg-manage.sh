#!/bin/bash
cd "$(dirname "$0")" || exit

CONFIG_PATH=".config"
mkdir -p $CONFIG_PATH

# Get PostgreSQL Configuration

PG_PASSWORD_PATH="$CONFIG_PATH/PG_PASSWORD"
PG_PASSWORD="$(cat $PG_PASSWORD_PATH)"

# Get pgAdmin Configurations

PGADMIN_EMAIL_PATH="$CONFIG_PATH/PGADMIN_EMAIL"
PGADMIN_EMAIL="$(cat $PGADMIN_EMAIL_PATH)"

PGADMIN_PASSWORD_PATH="$CONFIG_PATH/PGADMIN_PASSWORD"
PGADMIN_PASSWORD="$(cat $PGADMIN_PASSWORD_PATH)"

usage() {
    echo "Usage:"
    echo "  ./pg-manage.sh -up"
    echo "  ./pg-manage.sh -down"
} 

DKCP_FILE_PATH="./postgres/docker-compose.yml"
if [ $# -eq 1 ]; then
    case $1 in
        -up)
            PG_PASSWORD=$PG_PASSWORD PGADMIN_EMAIL=$PGADMIN_EMAIL PGADMIN_PASSWORD=$PGADMIN_PASSWORD \
                docker-compose -f $DKCP_FILE_PATH up -d
            ;;
        -down)
            PG_PASSWORD=$PG_PASSWORD PGADMIN_EMAIL=$PGADMIN_EMAIL PGADMIN_PASSWORD=$PGADMIN_PASSWORD \
                docker-compose -f $DKCP_FILE_PATH down
            ;;
        *)
            usage
            ;;
    esac
else
    usage
fi

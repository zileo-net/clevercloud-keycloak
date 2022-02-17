#!/bin/bash

# If the hostname is not defined, we remove the strict hostname feature.
# For production, you must define KC_HOSTNAME variable
if [[ -z "${KC_HOSTNAME}" ]]; then
	KC_HOSTNAME_STRICT="false"
fi

# Check if a postgres or mysql addon is linked to this application, in order to get the URI of database
if [[ -z "${POSTGRESQL_ADDON_HOST}" ]]; then
	KC_DB_URL="jdbc:${POSTGRESQL_ADDON_HOST}"
fi

if [[ -z "${MYSQL_ADDON_HOST}" ]]; then
	KC_DB_URL="jdbc:${MYSQL_ADDON_HOST}"
fi


keycloak/bin/kc.sh start --proxy edge

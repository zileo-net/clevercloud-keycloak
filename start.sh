#!/bin/bash

# If the hostname is not defined, we remove the strict hostname feature.
# For production, you must define KC_HOSTNAME variable
if [[ -z "${KC_HOSTNAME}" ]]; then
	KC_HOSTNAME_STRICT="false"
fi

# Check if a postgres or mysql addon is linked to this application, in order to get the URI of database
if [[ -n "${POSTGRESQL_ADDON_URI}" ]]; then
	export KC_DB_URL="jdbc:postgresql://${POSTGRESQL_ADDON_HOST}:${POSTGRESQL_ADDON_PORT}/${POSTGRESQL_ADDON_DB}"
	export KC_DB_USERNAME="${POSTGRESQL_ADDON_USER}"
	export KC_DB_PASSWORD="${POSTGRESQL_ADDON_PASSWORD}"
fi

if [[ -n "${MYSQL_ADDON_URI}" ]]; then
	export KC_DB_URL="jdbc:mysql://${MYSQL_ADDON_HOST}:${MYSQL_ADDON_PORT}/${MYSQL_ADDON_DB}"
	export KC_DB_USERNAME="${MYSQL_ADDON_USER}"
	export KC_DB_PASSWORD="${MYSQL_ADDON_PASSWORD}"
fi

keycloak/bin/kc.sh start --proxy edge

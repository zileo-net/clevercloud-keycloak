hostname="${KEYCLOAK_HOSTNAME}"

if [[ -z "$hostname" ]]; then
	hostname="${APP_ID}.cleverapps.io"
fi

keycloak/bin/kc.sh start --hostname $hostname --db-url 'jdbc:postgresql://${POSTGRESQL_ADDON_HOST}:${POSTGRESQL_ADDON_PORT}/${POSTGRESQL_ADDON_DB}' --db-username ${POSTGRESQL_ADDON_USER} --db-password ${POSTGRESQL_ADDON_PASSWORD} --proxy edge
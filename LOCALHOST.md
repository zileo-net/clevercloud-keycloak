## Local execution ##

If you want to try the different script locally, start by creating a fresh local PG database:

```sql
CREATE DATABASE keycloak;
CREATE USER keycloak WITH ENCRYPTED PASSWORD 'kcpwd';
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
```

Then set up some local environment variables:

```
export KEYCLOAK_VERSION='17.0.0'
export KEYCLOAK_METRICS=false
export POSTGRESQL_ADDON_HOST=localhost
export POSTGRESQL_ADDON_PORT=5432
export POSTGRESQL_ADDON_DB=keycloak
export POSTGRESQL_ADDON_USER=keycloak
export POSTGRESQL_ADDON_PASSWORD=kcpwd
export KEYCLOAK_HOSTNAME='localhost:8080'
```

Then you can use the `./build.sh` and `./start.sh` scripts. Pay attention it starts you keycloack in prod mode (not in dev mode). You can also use `./createFirstAdmin.sh` the first time you start the server.
# CleverCloud Keycloak template

This project allows you to deploy a Keycloak server on CleverCloud without using any container.

## Deployment instructions

1. Fork this project
1. Create a __Java + JAR__ application based on a fork of this repository
1. Link the application to a PostgreSQL or MySQL add-on. If not, it will use a local DB
1. Copy the following environment variable in expert mode :

```
KC_FEATURES=token-exchange
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=password
KC_METRICS_ENABLED=true
KC_HTTP_PORT=8080
CC_JAR_PATH=./keycloak/lib/quarkus-run.jar
KC_DB_POOL_INITIAL_SIZE=1
KC_DB_POOL_MIN_SIZE=1
KC_DB_POOL_MAX_SIZE=5
CC_JAVA_VERSION="11"
CC_METRICS_PROMETHEUS_PORT=8080
CC_PRE_BUILD_HOOK="./build.sh"
CC_RUN_COMMAND="./start.sh"
KEYCLOAK_VERSION="17.0.0"
```

First of all, adapt the `KC_DB_POOL_INITIAL_SIZE`, `KC_DB_POOL_MIN_SIZE`, `KC_DB_POOL_MAX_SIZE` variables according to the database plan you choose. By default, it's been configured for the DEV plan (limited to 5 connections).

Define your initial admin account with `KEYCLOAK_ADMIN`and `KEYCLOAK_ADMIN_PASSWORD`

On the first run, Keycloak will build a runable JAR with the optional features, the database driver, and the metrics subsystem.

Although the application will boot this way, it will be usable with the default `*.cleverapps.io`. Define `KC_HOSTNAME`variable with your own domain name. If this var is not define, Keycloak will disallow "STRICT_HOSTNAME" feature.

## FYI

The __Java + JAR__ is used to get a dedicated Java runtime, but we do not use any Keycloak JAR to start the server. We use the dedicated Keycloak shell script for starting the server. But as that Runtime first check for the definition and the existence of a JAR file, so we use the `CC_JAR_PATH`to the quarkus jar.

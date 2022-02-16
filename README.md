# CleverCloud Keycloak template

This project allows you to deploy a Keycloak server on CleverCloud without using any container.

## Deployment instructions

1. Fork this project
1. Create a __Java + JAR__ application based on a fork of this repository
1. Link the application to a PostgreSQL add-on
1. Copy the following environment variable in expert mode :

```
CC_DISABLE_METRICS="true"
CC_JAVA_VERSION="17"
CC_PRE_BUILD_HOOK="./build.sh"
CC_RUN_COMMAND="./start.sh"
CC_RUN_SUCCEEDED_HOOK="./createFirstAdmin.sh"
KEYCLOAK_VERSION="17.0.0"
KEYCLOAK_HOSTNAME=""
KEYCLOAK_METRICS="false"
PORT="8080"
```

On the first run, Keycloak will initialize its database, and a shell script will create your initial
admin access (as it can only be done locally) : `admin` / `clever`. Once it has been set up, don't forget to change those credentials, then you can remove the `CC_RUN_SUCCEEDED_HOOK` environment variable.

Although the application will boot this way, it will not be usable with the default `*.cleverapps.io` (only the server home page will be available). You need to set up your own domain name in the application configuration (on CleverCloud) and the change the `KEYCLOAK_HOSTNAME` environment variable.

## FYI

The __Java + JAR__ is used to get a dedicated Java runtime, but we do not use any Keycloak JAR to start the server. We use the dedicated Keycloak shell script for starting the server. But as that Runtime first check for the definition and the existence of a JAR file, an empty one has been set up in the `clevercloud` folder.
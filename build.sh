#!/usr/bin/env bash

if [[ -z "${KEYCLOAK_VERSION}" ]]; then
  echo "No KEYCLOAK_VERSION environment variable set"
  exit 1
fi

wget -q https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.zip
unzip keycloak-${KEYCLOAK_VERSION}.zip
mv keycloak-${KEYCLOAK_VERSION} keycloak
rm keycloak-${KEYCLOAK_VERSION}.zip

ls keycloak
echo "Keycloak ${KEYCLOAK_VERSION} downloaded successfuly"

#keycloak/bin/kc.sh build
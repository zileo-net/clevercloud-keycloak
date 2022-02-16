#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${KEYCLOAK_VERSION}" ]]; then
  echo "No KEYCLOAK_VERSION environment variable set"
  exit 1
fi

wget https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.zip
unzip keycloak-${KEYCLOAK_VERSION}.zip
mv keycloak-${KEYCLOAK_VERSION} keycloak

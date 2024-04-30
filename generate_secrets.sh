#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -e

SECRETS_ROOT="${SECRETS_ROOT:-./authelia/secrets}"

JWT_SECRET_FILE="${SECRETS_ROOT}/JWT_TOKEN"
SESSION_SECRET_FILE="${SECRETS_ROOT}/SESSION_SECRET"
OIDC_KEY="${SECRETS_ROOT}/oidc.key"

if ! [ -e "${JWT_SECRET_FILE}" ]; then openssl rand -hex 64 > "${JWT_SECRET_FILE}" ; fi
if ! [ -e "${SESSION_SECRET_FILE}" ]; then openssl rand -hex 64 > "${SESSION_SECRET_FILE}" ; fi
if ! [ -e "${OIDC_KEY}" ]; then openssl genrsa -out "${OIDC_KEY}" 3072 ; fi

echo "Secrets generated."
#!/usr/bin/env bash
# -*- coding: utf-8 -*-
set -e

if ! (which docker && (docker --help > /dev/null 2>&1)) ; then echo "Docker is not present in your PATH, please install or fix your PATH"; exit 1; fi

if ! docker ps > /dev/null 2>&1; then 
    echo "Docker cannot be run by the current user. Ensure you have that the docker service is started and that ${USER} is part of the docker group."; 
    exit 1; 
fi

docker network create oidc;
docker network create postgres;
docker network create https_portal;
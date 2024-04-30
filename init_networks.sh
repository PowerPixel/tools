#!/usr/bin/env bash
# -*- coding: utf-8 -*-
set -e

create_docker_network() {
    if ! docker network inspect $1 > /dev/null 2>&1; then
        docker network create $1 > /dev/null 2>&1;
    else
        echo "Network $1 already exists, skipping creation";
    fi
}

if ! (which docker > /dev/null 2>&1 && (docker --help > /dev/null 2>&1)) ; then echo "Docker is not present in your PATH, please install or fix your PATH"; exit 1; fi

if ! docker ps > /dev/null 2>&1; then 
    echo "Docker cannot be run by the current user. Ensure you have that the docker service is started and that ${USER} is part of the docker group."; 
    exit 1; 
fi

create_docker_network oidc;
create_docker_network postgres;
create_docker_network https_portal;
create_docker_network redis;
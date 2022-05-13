#!/bin/sh

# The uid and gid shouldn't be set during build time as we don't know who the user is.
REAL_UID= REAL_GID= docker-compose build
REAL_UID=$(id -u) REAL_GID=$(id -g) docker-compose run x11-in-docker

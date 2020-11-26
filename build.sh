#!/bin/bash

# --no-cache
# builder_uid=`id -ru`
# --build-arg BUILDER_UID=$builder_uid
docker build -t mpi .


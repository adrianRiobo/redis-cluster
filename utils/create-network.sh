#!/bin/bash

docker network create -d overlay --subnet=10.5.0.0/16 --attachable redis-net


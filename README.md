# redis-cluster-docker

[![Docker Pulls](https://img.shields.io/docker/pulls/adrianriobo/redis-cluster.svg?style=flat-square)]()

## What does this solution provide

This is an implementation of a redis cluster in a dockerized environment. This project aims to solve some limitations with redis cluster in docker swarm environment

Limitations due to:

* [Swarm overaly networks does not allow to fix ips](https://github.com/moby/moby/issues/29816) 
* [Redis cluster does not work with hostnames, so Ips are needed](https://github.com/antirez/redis/pull/2323) 

To avoid this issues and the needed for fixed Ips in the cluster. The containers will check its IPs and comunicate it with other nodes in the cluster.

This is a first approach to a real scalable architecture. 

All nodes are fixed in the compose and scale up need some manual intervention. In future work, I will evolve to automate all the cluster management.

## Current images

This project will generate two images:

* [adrianriobo/redis-cluster](https://hub.docker.com/r/adrianriobo/redis-cluster/) 
* [adrianriobo/redis-cluster-initializer](https://hub.docker.com/r/adrianriobo/redis-cluster-initializer/) 

## Versions

Actual versions for redis are:

* 4.0.2

## Utils

[This project](https://github.com/adrianRiobo/redis-cluster) provide utils to manage the cluster:

* **/utils/create-network.sh** Create an overlay network for redis cluster. Expand or use with your solution network

* **/utils/run-redis.sh** Create redis stack, default network redis-net. Expand or use with your solution network

* **/utils/initialize-cluster.sh** Launch after redis nodes are up. Helper container to create cluster, default network redis-net. Expand or use with your solution network






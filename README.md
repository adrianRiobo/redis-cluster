# redis-cluster-docker

[![Docker Pulls](https://img.shields.io/docker/pulls/adrianriobo/redis-cluster.svg?style=flat-square)]()

This is an implementation of a redis cluster in a dockerized environment.

At the moment there are some limitations due to:

* Swarm overaly networks does not allow to fix ips. https://github.com/moby/moby/issues/29816 
* Redis cluster does not work with hostnames, so Ips are needed. https://github.com/antirez/redis/pull/2323

To avoid this issues and the needed for fixed Ips in the cluster. The containers will check its IPs and comunicate it with other nodes in the cluster.

This is a first approach to a real scalable architecture. 

All nodes are fixed in the compose and scale up need some manual intervention. In future work, I will evolve to automate all the cluster management.

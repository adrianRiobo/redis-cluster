# redis-cluster-docker
This is an implementation of a redis cluster in a dockerized environment.

At the moment there are some limitations due to:

* Swarm overaly networks does not allow to fix ips. https://github.com/moby/moby/issues/29816 
* Redis cluster does not work with hostnames, so Ips are needed. https://github.com/antirez/redis/pull/2323

If there is any issue realted with any container in the cluster, It will change the IP, so we need some mechanism to set the new IP in the cluster.

This is a first approach to a real scalable architecture. All nodes are fixed in the compose and scale up need some manual intervention. In future work, I will try to automate all the cluster management.

#!/bin/sh

echo 'yes' | redis-trib.rb create --replicas 1 IP_NODE1:6379 IP_NODE2:6379 IP_NODE3:6379 IP_NODE4:6379 IP_NODE5:6379 IP_NODE6:6379

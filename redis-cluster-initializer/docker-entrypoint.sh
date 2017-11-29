#!/bin/sh

cp /usr/local/bin/create_cluster.sh.tpl /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE1/$(ping -n redis-node1 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE2/$(ping -n redis-node2 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE3/$(ping -n redis-node3 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE4/$(ping -n redis-node4 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE5/$(ping -n redis-node5 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

sed -i "s/\IP_NODE6/$(ping -n redis-node6 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")/g" /usr/local/bin/create_cluster.sh

chmod +x /usr/local/bin/create_cluster.sh

exec "$@"



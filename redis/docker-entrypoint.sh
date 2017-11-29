#!/bin/sh

set -e

isServerUp() {

  #Wait for server is up
  while ! redis-cli -h $1 -p 6379 ping | grep PONG > /dev/null;
    do
      echo "Server $1 is starting up"
      sleep 5;
  done

  echo "Server $1 is Up"
}

getIp() {

  ipNode=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
  echo $ipNode

}

getIpByPing() {

  ipNode=$(ping -c1 -n $1 | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")
  echo $ipNode

}

updateClusterConfig() {

  #Get my Ip
  myIp=$(getIp)
  echo "my Ip is $myIp"

  for i in 1 2 3 4 5 6
  do
    node_name=redis-node$i
    if [ $node_name != $NODE_NAME ];
    then
      nodeIp=$(getIpByPing $node_name)
      if [ $nodeIp != "" ];
      then
        echo "$node_name ip is $nodeIp"
        echo "Updating my ip in $node_name"
        redis-cli -h $nodeIp -p 6379 cluster meet $myIp 6379
        echo "updating $nodeIp from $node_name in my config"
        redis-cli cluster meet $nodeIp 6379
      fi
    fi
  done

  echo "Updating my own ip $myIp"
  redis-cli cluster meet $myIp 6379

}

checkAndUpdateConfigIfNeeded() {

  #Wait for own node server
  isServerUp localhost

  #Check if node was restarted
  if [ -f /data/dump.rdb ];
  then
    updateClusterConfig
  fi

}

checkAndUpdateConfigIfNeeded &

exec "$@"







#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-volumes.yaml
sleep 5s
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-service.yaml
sleep 20s
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-petset.yaml

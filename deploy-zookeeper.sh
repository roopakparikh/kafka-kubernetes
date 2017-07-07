#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
NAMESPACE="kafka"
$KUBECMD --namespace $NAMESPACE create -f ./docker-zookeeper/kube/zookeeper-service.yaml
sleep 20s
$KUBECMD --namespace $NAMESPACE create -f ./docker-zookeeper/kube/zookeeper-petset.yaml

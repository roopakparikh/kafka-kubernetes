#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
NAMESPACE="kafka"
$KUBECMD --namespace $NAMESPACE delete -f ./docker-zookeeper/kube/zookeeper-service.yaml
$KUBECMD --namespace $NAMESPACE delete -f ./docker-zookeeper/kube/zookeeper-petset.yaml
$KUBECMD --namespace $NAMESPACE delete pvc/data-zookeeper-0
$KUBECMD --namespace $NAMESPACE delete pvc/data-zookeeper-1
$KUBECMD --namespace $NAMESPACE delete pvc/data-zookeeper-2

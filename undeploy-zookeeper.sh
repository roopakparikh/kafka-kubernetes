#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD delete -f ./docker-zookeeper/kube/zookeeper-volumes.yaml
$KUBECMD delete -f ./docker-zookeeper/kube/zookeeper-service.yaml
$KUBECMD delete -f ./docker-zookeeper/kube/zookeeper-petset.yaml
$KUBECMD delete pod/zookeeper-0
$KUBECMD delete pod/zookeeper-1
$KUBECMD delete pod/zookeeper-2
$KUBECMD delete pvc/data-zookeeper-0
$KUBECMD delete pvc/data-zookeeper-1
$KUBECMD delete pvc/data-zookeeper-2

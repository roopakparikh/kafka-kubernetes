#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig --namespace kafka"
$KUBECMD delete -f ./v2/zookeeper.yaml
$KUBECMD delete pvc/data-zookeeper-0
$KUBECMD delete pvc/data-zookeeper-1
$KUBECMD delete pvc/data-zookeeper-2

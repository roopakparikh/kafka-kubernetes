#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
NAMESPACE="kafka"
$KUBECMD --namespace $NAMESPACE create -f ./v2/zookeeper.yaml
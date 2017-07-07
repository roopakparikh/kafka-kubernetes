#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD create -f ./sc.yml
sleep 5s
$KUBECMD create -f ./kafka.namespace.yml
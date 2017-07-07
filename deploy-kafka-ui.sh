#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig --namespace kafka "
$KUBECMD create -f ./docker-kafka-ui/
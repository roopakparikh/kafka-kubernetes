#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig --namespace kafka "
$KUBECMD delete -f ./docker-kafka-ui/

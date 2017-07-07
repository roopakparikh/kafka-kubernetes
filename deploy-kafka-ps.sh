#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig --namespace kafka "
$KUBECMD create -f ./docker-kafka/kube/kafka-service.yaml
sleep 20s
$KUBECMD create -f ./docker-kafka/kube/kafka-petset.yaml

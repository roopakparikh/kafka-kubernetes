#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD create -f ./docker-kafka/kube/kafka-volumes.yaml
sleep 5s
$KUBECMD create -f ./docker-kafka/kube/kafka-service.yaml
sleep 20s
$KUBECMD create -f ./docker-kafka/kube/kafka-petset.yaml

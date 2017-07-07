#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig --namespace kafka"
$KUBECMD delete -f ./docker-kafka/kube/kafka-service.yaml
$KUBECMD delete -f ./docker-kafka/kube/kafka-petset.yaml
$KUBECMD delete pvc/data-kafka-0
$KUBECMD delete pvc/data-kafka-1
$KUBECMD delete pvc/data-kafka-2

#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD delete -f ./docker-kafka/kube/kafka-volumes.yaml
$KUBECMD delete -f ./docker-kafka/kube/kafka-service.yaml
$KUBECMD delete -f ./docker-kafka/kube/kafka-petset.yaml
$KUBECMD delete pod/kafka-0
$KUBECMD delete pod/kafka-1
$KUBECMD delete pod/kafka-2
$KUBECMD delete pvc/data-kafka-0
$KUBECMD delete pvc/data-kafka-1
$KUBECMD delete pvc/data-kafka-2

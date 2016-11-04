#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-volumes.yaml
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-service.yaml
$KUBECMD create -f ./docker-zookeeper/kube/zookeeper-petset.yaml
$KUBECMD create -f ./docker-kafka/kube/kafka-volumes.yaml
$KUBECMD create -f ./docker-kafka/kube/kafka-service.yaml
$KUBECMD create -f ./docker-kafka/kube/kafka-petset.yaml

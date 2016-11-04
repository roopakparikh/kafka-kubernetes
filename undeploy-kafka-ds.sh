#!/bin/bash
KUBECMD="kubectl --kubeconfig=./kubeconfig "
$KUBECMD delete svc/kafka
$KUBECMD delete ds/kafka

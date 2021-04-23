#!/bin/sh
CLUSTER_NAME=$(kubectl config current-context) && echo "CLUSTER_NAME=$CLUSTER_NAME"
sed -i '' "s/clustername: .*/clustername: \"$CLUSTER_NAME\"/g" hook-configmap.yml
kubectl apply -f .
kubectl rollout restart daemonset container-lifecycle-hook -n container-lifecycle-hook

#!/bin/bash

# Defining Variables for namespace 
NAMESPACE=mongo


# Create Namespace 
echo -e "\n\n[Mongo-Setup] Creating mongo namespace!\n\n"

if kubectl get namespace "$NAMESPACE" >/dev/null 2>&1; 
then
    echo -e "\n\n[Mongo-Setup] Namespace '$NAMESPACE' already exists.\n\n"
else
    kubectl create namespace "$NAMESPACE"
    echo -e "\n\n[Mongo-Setup] Namespace '$NAMESPACE' created.\n\n"
fi



# Deploy the mainfest filr for statefulset,ConfigMap,Secret
echo -e " \n\n[Mongo-Setup]  Deploying mongodb statefulset and all required dependencies\n\n"
kubectl apply -f statefulset/

sleep 60;

POD_STATUS=$(kubectl get pods -n mongo | grep "\mongo-0\|\mongo-1\|\mongo-2" | awk {'print $3'} | sort -u )

if [ "$POD_STATUS" = "Running" ]
then
     echo -e "\n\n[Mongo-Setup] Statefulset Deployed successfully and Pods are running.........\n\n"
else
     echo -e "\n\n[Mongo-Setup] Please describe the pod\n\n"
fi 
exit
  



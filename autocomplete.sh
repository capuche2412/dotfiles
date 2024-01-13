#!/bin/bash

commands=("kubectl" "helm" "minikube" "ytt")

for cmd in "${commands[@]}"; do
    if command -v "$cmd" &> /dev/null ; then
        echo "Add completion for $cmd"
        $cmd completion bash
    else
        echo "$cmd not found"
    fi
done

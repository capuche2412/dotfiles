#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script requires root privileges. Please run it as root or with sudo."
  exit 1
else
  echo "Running installer script"
fi

commands=("kubectl" "helm" "minikube" "ytt")

for cmd in "${commands[@]}"; do
    if command -v "$cmd" &> /dev/null ; then
        echo "Add completion for $cmd"
        $cmd completion bash >/etc/bash_completion.d/$cmd
    else
        echo "$cmd not found"
    fi
done

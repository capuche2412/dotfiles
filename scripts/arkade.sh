#!/bin/bash
## Install bin through arkade

curl -sLS https://get.arkade.dev | sudo sh

arkade get fzf helm kind kubectl kubectx kubens krew k9s 
kubectl krew install deprecations krew node-shell rbac-tool resource-capacity

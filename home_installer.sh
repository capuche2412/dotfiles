#!/bin/bash

if [ "$EUID" -ne 0]; then
  echo "This script requires root privileges. Please run it as root or with sudo."
  exit 1
else
  echo "Running installer script"
fi


## Copy dotfiles
files=$(find . -name 'dot_*')

for file in $files
do
  new_filename=$(echo "$file" | sed 's/dot_/.\/./')
  cp "$file" "../$new_filename"
done

## Install bin through arkade

curl -sLS https://get.arkade.dev | sudo sh

arkade get fzf helm kind kubectl kubectx kubens krew k9s 
kubectl krew install deprecations krew node-shell rbac-tool resource-capacity

./autocomplete.sh
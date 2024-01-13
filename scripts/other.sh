#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script requires root privileges. Please run it as root or with sudo."
  exit 1
else
  echo "Running installer script"
fi

curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly
#!/bin/bash

# The function renames the file from `target` to `target.backup` 
# only if the file exists and if it's not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "$target : backup $target to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "Create symlink from $link to $file"
    ln -s $file $link
  fi
}

## Find dotfiles
files=$(find . -name 'dot_*' | sed 's/^\.\///')
echo "Files found :"
echo "$files"

echo "Creating symlinks..."
for name in $files; do
  if [ ! -d "$name" ]; then
    new_name=$(echo "$name" | sed 's/dot_//')
    target="$HOME/.$new_name"
    backup $target
    symlink $PWD/$name $target
  fi
done
echo "Symlinks created"

echo "Running arkade.sh"
./scripts/arkade.sh
echo "Running autocomplete.sh"
sudo ./scripts/autocomplete.sh
echo "Running apt.sh"
sudo ./scripts/apt.sh
echo "Running other.sh"
sudo ./scripts/apt.sh

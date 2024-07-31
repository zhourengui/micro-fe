#!/bin/bash

if [ ! -d "packages" ]; then
  echo "Creating packages directory..."
  mkdir packages
fi

while IFS= read -r repo; do
  repo_name=$(basename "$repo" .git)
  target_dir="packages/$repo_name"

  if [ -d "$target_dir" ]; then
    echo "Skipping $repo_name (already exists)"
  else
    echo "Cloning $repo..."
    git clone --depth 1 "$repo" "$target_dir"
  fi
done < repos.txt

echo "Clone completed."
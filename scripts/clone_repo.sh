#!/bin/bash

if [ ! -d "packages" ]; then
  echo "Creating packages directory..."
  mkdir packages
fi

DOT="$(cd "$(dirname "$0")"; cd ../; pwd)"

while IFS= read -r repo; do
  repo_name=$(basename "$repo" .git)
  target_dir="packages/$repo_name"

  if [ -d "$target_dir" ]; then
    echo "Skipping $repo_name (already exists)"
  else
    echo "Cloning $repo..."
    git clone --depth 1 "$repo" "$target_dir"

    if [ $? -ne 0 ]; then
      echo "Failed to clone $repo"
    fi
  fi
done < $DOT/scripts/repos.txt

echo "Clone completed."
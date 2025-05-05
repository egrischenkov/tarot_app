#!/bin/bash
set -e

test_dirs=()
while IFS= read -r dir; do
  if [ -d "$dir/test" ]; then
    test_dirs+=("$dir")
  fi
done < <(find . -type f -name "pubspec.yaml" -exec dirname {} \;)

if [ ${#test_dirs[@]} -gt 0 ]; then
  fvm flutter test "${test_dirs[@]}" --no-pub
else
  echo "No directories with pubspec.yaml and a test/ folder found."
fi
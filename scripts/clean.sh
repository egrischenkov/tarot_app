#!/bin/bash
# Clean the main Flutter project
fvm flutter clean

# Clean each package
for dir in packages/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    pushd $dir || exit
    fvm flutter clean
    popd || exit
  fi
done

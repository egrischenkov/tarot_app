#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run build_runner in current directory
build_in_current_directory() {
  fvm dart run build_runner build --delete-conflicting-outputs
}

# Get workspace dependencies
fvm flutter pub get

build_in_current_directory


for dir in packages/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    if grep -q build_runner "$dir/pubspec.yaml"; then
      pushd "$dir" || exit
      build_in_current_directory
      popd || exit
    fi
  fi
done

sh "$(dirname "$0")"/dart_format.sh

exit
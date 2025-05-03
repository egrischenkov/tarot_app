#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

fvm dart run build_runner build --delete-conflicting-outputs

exit
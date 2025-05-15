#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev' or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=tarot-band-dev \
      --out=lib/core/firebase/options/firebase_options_dev.g.dart \
      --ios-bundle-id=ru.tarot.app.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=ru.tarot.app.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=tarot-band-prod \
      --out=lib/core/firebase/options/firebase_options_prod.g.dart \
      --ios-bundle-id=ru.tarot.app.prod \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=ru.tarot.app.prod \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev' or 'prod'."
    exit 1
    ;;
esac
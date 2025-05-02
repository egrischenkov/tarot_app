#!/bin/bash

cd ios
pod deintegrate
rm -rf build
rm -rf Pods
rm -rf ios/Runner.xcworkspace
rm -rf Podfile.lock
rm -rf .symlinks
rm -Rf Flutter/Flutter.framework
rm -Rf Flutter/Flutter.podspec
pod cache clean --all
cd ..
fvm flutter pub get
cd ios/
pod install --repo-update
cd ..
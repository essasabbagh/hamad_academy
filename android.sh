#!/bin/bash

# Exit on any error
set -e

# inc version and build number , format code , fix lint issues
sh inc.sh

# Configuration
FIREBASE_APP_ID="1:37921:android:bff4"

# Build school flavor
DEBUG_DIR="build/debug-info"
mkdir -p $DEBUG_DIR

echo "Building..."
fvm flutter build appbundle \
  --release \
  --obfuscate \
  --split-debug-info=$DEBUG_DIR

echo "✅ Flutter builds completed."

echo "Uploading symbols..."
firebase crashlytics:symbols:upload \
  --app=$FIREBASE_APP_ID \
  build/app/intermediates/merged_native_libs/release/mergeReleaseNativeLibs/out/lib

echo "🚀 Native symbols uploaded to Firebase Crashlytics."

# Deploy to Play Store and handle git operations
cd android && fastlane deploy
cd .. && sh git_push.sh

echo "✅ All done! Your app is deployed to the Play Store and git operations are completed."
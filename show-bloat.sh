#!/bin/bash

echo "🔍 Scanning for non-Apple background services..."

for dir in \
  ~/Library/LaunchAgents \
  /Library/LaunchAgents \
  /Library/LaunchDaemons \
  /System/Library/LaunchAgents \
  /System/Library/LaunchDaemons; do

  echo "📂 Directory: $dir"
  find "$dir" -type f -name "*.plist" 2>/dev/null | grep -v "com.apple"
done

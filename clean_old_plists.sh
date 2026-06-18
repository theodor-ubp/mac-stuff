#!/bin/bash

echo "Scanning for .plist.old files..."

# Locations to scan
TARGETS=(
  "$HOME/Library/LaunchAgents"
  "/Library/LaunchAgents"
  "/Library/LaunchDaemons"
)

FOUND=()

# Scan all targets
for DIR in "${TARGETS[@]}"; do
  if [ -d "$DIR" ]; then
    while IFS= read -r -d '' FILE; do
      FOUND+=("$FILE")
    done < <(find "$DIR" -type f -name "*.plist.old" -print0)
  fi
done

# No files found
if [ ${#FOUND[@]} -eq 0 ]; then
  echo "No .plist.old files found. System is tidy."
  exit 0
fi

# List found files
echo "Found ${#FOUND[@]} .plist.old file(s):"
for i in "${!FOUND[@]}"; do
  printf "%2d. %s\n" "$((i+1))" "${FOUND[$i]}"
done

# Ask for deletion
read -p "Delete all listed .plist.old files? [y/N]: " ANSWER
if [[ "$ANSWER" =~ ^[Yy]$ ]]; then
  for FILE in "${FOUND[@]}"; do
    rm -f "$FILE"
  done
  echo "All .plist.old files deleted."
else
  echo "Aborted. No files deleted."
fi


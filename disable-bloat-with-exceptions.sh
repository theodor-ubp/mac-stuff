#!/bin/zsh

EXCLUDE_LIST=("aldente" "anydesk" "Digi Storage" "scroll-reverser" "microsoft")

PLIST_DIRS=(
  "$HOME/Library/LaunchAgents"
  "/Library/LaunchAgents"
  "/Library/LaunchDaemons"
)

for dir in "${PLIST_DIRS[@]}"; do
  echo "Checking: $dir"
  if [ -d "$dir" ]; then
    for plist in "$dir"/*.plist; do
      skip=false
      for keyword in "${EXCLUDE_LIST[@]}"; do
        if [[ "$plist" == *"$keyword"* ]]; then
          skip=true
          break
        fi
      done

      if [ "$skip" = false ]; then
        label=$(defaults read "${plist}" Label 2>/dev/null)
        if [ -n "$label" ]; then
          echo "Unloading: $label"
          sudo launchctl bootout system "$plist" 2>/dev/null
          launchctl bootout gui/$(id -u) "$plist" 2>/dev/null
        fi

        echo "Renaming: $plist → $plist.old"
        sudo mv "$plist" "$plist.old"
      else
        echo "Skipped: $plist"
      fi
    done
  fi
done

echo "Done. Only essential services remain."

# macOS Utility Scripts

A curated set of personal shell scripts created for macOS (tested on Apple Silicon).  
These scripts help automate system cleanup, uninstall routines, orphaned file scans, and various other diagnostic tasks.

All scripts are lightweight, portable, and written for terminal users who value control and clarity.

---

## Available Scripts

| Script                                    | Description                                                                              |
|-------------------------------------------|------------------------------------------------------------------------------------------|
| `show-bloat.sh`                           | Scans for non-Apple bloat .plists                                                        |
| `disable-bloat-with-exceptions.sh`        | adds .old suffix on bloat plists (whitelist can be edited, some examples are present)    |
| `clean_old_plists.sh`                     | Deletes all .old plists                                                                  |

---

## Requirements

- macOS Catalina 10.15 or newer
- Terminal access
- Basic permissions for `sudo` when needed

---

## Usage

1. Clone the repo:
   ```bash
   git clone https://github.com/theodor-ubp/mac-stuff.git
   cd macos-utils


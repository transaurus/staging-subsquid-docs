#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for subsquid/docs
# Runs on existing source tree (no clone). Installs deps and builds.

# --- Node version ---
# Docusaurus 3.3.2 requires Node 20+
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -f "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm use 20
fi

# --- Package manager: npm ---
# --- Install dependencies ---
npm install --legacy-peer-deps

# --- Build ---
npm run build

echo "[DONE] Build complete."

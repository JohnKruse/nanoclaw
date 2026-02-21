#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "ERROR: missing 'upstream' remote"
  exit 1
fi
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "ERROR: missing 'origin' remote"
  exit 1
fi

echo "[sync] Fetching upstream..."
git fetch upstream

echo "[sync] Ensuring local main exists..."
git checkout main

echo "[sync] Fast-forwarding local main from origin/main when possible..."
git pull --ff-only origin main || true

echo "[sync] Merging upstream/main into local main..."
git merge --no-edit upstream/main

echo "[sync] Pushing main to origin..."
git push origin main

echo "[sync] Done."

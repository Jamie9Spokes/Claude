#!/usr/bin/env bash
# Session start hook: install and configure latest Python
# Only runs in remote (web) sessions
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install Python 3.13 and set as default
if command -v python3.13 &>/dev/null; then
  sudo update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.13 1 2>/dev/null || true
  sudo update-alternatives --set python3 /usr/bin/python3.13 2>/dev/null || true
fi

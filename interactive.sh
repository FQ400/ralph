#!/bin/bash
set -e

RALPH_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$RALPH_DIR/.." && pwd)"
SANDBOX_NAME="${SANDBOX_NAME:-ralph-$(basename "$REPO_ROOT")}"

docker sandbox run "$SANDBOX_NAME" -- --model claude-opus-4-6 --add-dir "$RALPH_DIR"

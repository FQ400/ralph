#!/bin/bash
set -e

trap 'echo "Interrupted, exiting."; exit 130' INT

RALPH_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$RALPH_DIR/.." && pwd)"
SANDBOX_NAME="${SANDBOX_NAME:-ralph-$(basename "$REPO_ROOT")}"
ITERATIONS=${1:-50}

for ((i=1; i<=$ITERATIONS; i++)); do
  echo "=== Ralph iteration $i/$ITERATIONS ==="

  result=$(docker sandbox run "$SANDBOX_NAME" -- --model claude-opus-4-6 --add-dir "$RALPH_DIR" -p "$(cat "$RALPH_DIR/PROMPT.md")")

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "All issues done, exiting."
    exit 0
  fi
done

#!/bin/bash
# Pre-commit hook: runs promptfoo eval on staged changes
# Install: cp scripts/pre-commit-eval.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
#
# This provides automated eval gating — commits are blocked if evals fail.
# Remove or modify this hook if you want manual-only eval control.

set -e

echo "Running aigod eval gate..."

# Check if promptfoo is installed
if ! npx promptfoo --version > /dev/null 2>&1; then
    echo "Warning: promptfoo not installed. Skipping eval gate."
    echo "Run 'npm install' to enable automated eval gating."
    exit 0
fi

# Run evals
npx promptfoo eval -c evals/promptfooconfig.yaml --no-progress-bar

RESULT=$?

if [ $RESULT -ne 0 ]; then
    echo ""
    echo "Eval gate FAILED. Commit blocked."
    echo "Run 'npm run eval:view' to see details."
    exit 1
fi

echo "Eval gate passed."
exit 0

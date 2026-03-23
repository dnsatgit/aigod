#!/bin/bash
# aigod setup script
# Run: npm run setup (or bash scripts/setup.sh)

set -e

echo "================================"
echo "  aigod — Setup"
echo "================================"
echo ""

# Check dependencies
echo "Checking dependencies..."

if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is required. Install from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "ERROR: Node.js 18+ required. Current: $(node -v)"
    exit 1
fi

echo "  Node.js $(node -v) — OK"

if ! command -v git &> /dev/null; then
    echo "ERROR: Git is required."
    exit 1
fi

echo "  Git $(git --version | cut -d' ' -f3) — OK"

# Install dependencies
echo ""
echo "Installing dependencies..."
npm install

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo ""
    echo "Initializing git repository..."
    git init
    git add -A
    git commit -m "Initial aigod framework setup"
fi

# Create domain docs directory if it doesn't exist
mkdir -p docs/domain

echo ""
echo "================================"
echo "  Setup complete!"
echo "================================"
echo ""
echo "Next steps:"
echo "  1. Add your domain specs to docs/domain/"
echo "  2. Configure roles in roles/index.yaml"
echo "  3. Customize evals in evals/assertions/domain.yaml"
echo "  4. Seed memory in memory/"
echo "  5. See CUSTOMIZE.md for the full guide"
echo ""
echo "Then open this project with Claude Code and start working."
echo ""

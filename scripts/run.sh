#!/bin/bash

# zyBooks C++ Labs - Run Script
# Usage: ./scripts/run.sh [LAB_NAME]
# Or: LAB=lab01 ./scripts/run.sh

set -e

# Get the lab name from argument or environment variable
LAB_NAME=${1:-${LAB:-lab01}}

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running lab: ${LAB_NAME}${NC}"

# Change to the project root directory
cd "$(dirname "$0")/.."

# Build if needed
if [ ! -f "build/${LAB_NAME}/app" ]; then
    echo -e "${YELLOW}App not found, building first...${NC}"
    make LAB="$LAB_NAME"
fi

# Run the lab
make run LAB="$LAB_NAME"

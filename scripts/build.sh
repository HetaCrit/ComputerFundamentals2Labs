#!/bin/bash

# zyBooks C++ Labs - Build Script
# Usage: ./scripts/build.sh [LAB_NAME]
# Or: LAB=lab01 ./scripts/build.sh

set -e

# Get the lab name from argument or environment variable
LAB_NAME=${1:-${LAB:-lab01}}

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building lab: ${LAB_NAME}${NC}"

# Change to the project root directory
cd "$(dirname "$0")/.."

# Build the specified lab
make LAB="$LAB_NAME"

echo -e "${GREEN}✓ Build completed successfully!${NC}"
echo -e "${BLUE}Output: build/${LAB_NAME}/app${NC}"

# zyBooks C++ Labs Makefile
# Usage: make LAB=lab01 [target]
# Default target: build

# Configuration
CXX ?= g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra -Wpedantic
LAB ?= lab01
BUILD_DIR = build/$(LAB)
APP = $(BUILD_DIR)/app
# Auto-detect lab location in nested structure
SOURCE := $(shell find labs -name "$(LAB)" -type d | head -1)/main.cpp

# Colors for output
GREEN = \033[0;32m
YELLOW = \033[1;33m
RED = \033[0;31m
BLUE = \033[0;34m
NC = \033[0m # No Color

# Default target
.PHONY: all build run clean clean-all test help
all: build

# Build the current lab
build: $(APP)

$(APP): $(SOURCE) | $(BUILD_DIR)
	@echo "$(BLUE)Building $(LAB)...$(NC)"
	@echo "$(GREEN)✓$(NC) Compiling $(SOURCE) -> $(APP)"
	@$(CXX) $(CXXFLAGS) -o $(APP) $(SOURCE)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# Run the current lab
run: build
	@echo "$(BLUE)Running $(LAB)...$(NC)"
	@if [ -f $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt ]; then \
		echo "$(YELLOW)< piping input.txt$(NC)"; \
		./$(APP) < $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt | tee $(shell find labs -name "$(LAB)" -type d | head -1)/output.txt; \
		echo "$(GREEN)✓$(NC) Output also saved to $(shell find labs -name "$(LAB)" -type d | head -1)/output.txt"; \
	else \
		echo "$(GREEN)✓$(NC) Running $(APP)"; \
		./$(APP); \
	fi

# Run the current lab with manual input
manual: build
	@echo "$(BLUE)Running $(LAB) with manual input...$(NC)"
	@echo "$(GREEN)✓$(NC) Enter your input below:";
	./$(APP)

# Test the current lab
test: build
	@echo "$(BLUE)Testing $(LAB)...$(NC)"
	@if [ -f $(shell find labs -name "$(LAB)" -type d | head -1)/expected.txt ]; then \
		echo "$(YELLOW)Running with input.txt and comparing to expected.txt$(NC)"; \
		if [ -f $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt ]; then \
			./$(APP) < $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt > /tmp/actual_output.txt; \
		else \
			./$(APP) > /tmp/actual_output.txt; \
		fi; \
		   if diff -b /tmp/actual_output.txt $(shell find labs -name "$(LAB)" -type d | head -1)/expected.txt > /dev/null; then \
			   echo "$(GREEN)✓ Test passed!$(NC)"; \
		   else \
			   echo "$(RED)✗ Test failed!$(NC)"; \
			   echo "$(YELLOW)Expected:$(NC)"; \
			   cat $(shell find labs -name "$(LAB)" -type d | head -1)/expected.txt; \
			   echo "$(YELLOW)Actual:$(NC)"; \
			   cat /tmp/actual_output.txt; \
			   echo "$(YELLOW)Difference:$(NC)"; \
			   diff -b --side-by-side $(shell find labs -name "$(LAB)" -type d | head -1)/expected.txt /tmp/actual_output.txt; \
		   fi; \
		rm -f /tmp/actual_output.txt; \
	else \
		echo "$(YELLOW)No expected.txt found. Run 'make run LAB=$(LAB)' to test manually.$(NC)"; \
	fi

# Generate output.txt file for the current lab
output: build
	@echo "$(BLUE)Generating output.txt for $(LAB)...$(NC)"
	@if [ -f $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt ]; then \
		echo "$(YELLOW)< piping input.txt to output.txt$(NC)"; \
		./$(APP) < $(shell find labs -name "$(LAB)" -type d | head -1)/input.txt > $(shell find labs -name "$(LAB)" -type d | head -1)/output.txt; \
	else \
		echo "$(YELLOW)No input.txt found. Manual input will be required.$(NC)"; \
		./$(APP) > $(shell find labs -name "$(LAB)" -type d | head -1)/output.txt; \
	fi; \
	echo "$(GREEN)✓$(NC) Output saved to $(shell find labs -name "$(LAB)" -type d | head -1)/output.txt"

# Clean current lab build
clean:
	@echo "$(BLUE)Cleaning $(LAB)...$(NC)"
	@rm -rf $(BUILD_DIR)
	@echo "$(GREEN)✓$(NC) Cleaned $(BUILD_DIR)"

# Clean all builds
clean-all:
	@echo "$(BLUE)Cleaning all builds...$(NC)"
	@rm -rf build/
	@echo "$(GREEN)✓$(NC) Cleaned all builds"

# Help
help:
	@echo "$(BLUE)zyBooks C++ Labs Makefile$(NC)"
	@echo ""
	@echo "$(YELLOW)Usage:$(NC) make LAB=<lab_name> [target]"
	@echo ""
	@echo "$(YELLOW)Targets:$(NC)"
	@echo "  build      - Build the current lab (default)"
	@echo "  run        - Build and run the current lab (auto-creates output.txt if input.txt exists)"
	@echo "  manual     - Build and run the current lab with manual input"
	@echo "  test       - Test the current lab against expected.txt"
	@echo "  output     - Generate output.txt file for the current lab"
	@echo "  clean      - Clean the current lab build"
	@echo "  clean-all  - Clean all builds"
	@echo "  help       - Show this help"
	@echo ""
	@echo "$(YELLOW)Examples:$(NC)"
	@echo "  make LAB=lab01        # Build lab01"
	@echo "  make run LAB=lab01    # Build and run lab01"
	@echo "  make test LAB=lab01   # Test lab01"
	@echo "  make clean LAB=lab01  # Clean lab01"
	@echo ""
	@echo "$(YELLOW)Current LAB:$(NC) $(LAB)"

# Error checking
$(SOURCE):
	@echo "$(RED)Error: Source file $(SOURCE) not found!$(NC)"
	@echo "$(YELLOW)Make sure you're in the right directory or set LAB correctly.$(NC)"
	@echo "$(YELLOW)Available labs:$(NC)"
	@ls -1 labs/ | grep -E '^lab[0-9]+$' 2>/dev/null || echo "$(RED)No labs found in labs/ directory$(NC)"
	@exit 1

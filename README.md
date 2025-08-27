# 🚀 zyBooks C++ Labs DevContainer

A complete development environment for Computer Fundamentals 2 C++ labs, featuring modern tooling, automated testing, and a streamlined workflow.

## 📋 Table of Contents
- [Overview](#overview)
- [Quick Start](#quick-start)
- [System Architecture](#system-architecture)
- [Lab Structure](#lab-structure)
- [Usage Guide](#usage-guide)
- [Development Workflow](#development-workflow)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

This devcontainer provides a professional-grade C++ development environment specifically designed for zyBooks Computer Fundamentals 2 labs. It includes:

- **Modern C++ Toolchain** (GCC 12, C++17)
- **Automated Build System** with Makefiles
- **Integrated Testing** against expected outputs
- **VS Code Integration** with C++ extensions
- **Git Integration** for version control
- **System Monitoring** tools (btop, zsh)

## 🚀 Quick Start

### Prerequisites
- [Docker](https://docker.com) installed
- [VS Code](https://code.visualstudio.com) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Setup Steps
1. **Clone this repository:**
   ```bash
   git clone https://github.com/HetaCrit/ComputerFundamentals2Labs.git
   cd ComputerFundamentals2Labs
   ```

2. **Open in VS Code:**
   ```bash
   code .
   ```

3. **Open in DevContainer:**
   - Press `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
   - Wait for container build (first time: ~2-3 minutes)

4. **Verify Setup:**
   ```bash
   make help
   ```

## 🏗️ System Architecture

### Core Components

#### 1. **DevContainer Configuration** (`.devcontainer/`)
- **Base Image**: `mcr.microsoft.com/devcontainers/cpp:ubuntu`
- **C++ Compiler**: GCC 12 with C++17 support
- **Extensions**: C++ tools, CMake, Makefile tools, GitLens
- **Post-install**: clang-format, gdb debugger

#### 2. **Build System** (`Makefile`)
- **Multi-lab Support**: Build any lab with `LAB=labname`
- **Automated Testing**: Compare output against expected results
- **Color-coded Output**: Visual feedback for build status
- **Dependency Management**: Automatic directory creation

#### 3. **Lab Structure** (`labs/`)
```
labs/
├── lab5/                    # Lab 5 series (500-level labs)
│   ├── lab515/             # Completed lab (file reading)
│   ├── lab517/             # Current working lab
│   ├── lab519/             # Template for future lab
│   ├── lab520/             # Template for future lab
│   ├── lab522/             # Template for future lab
│   ├── lab525/             # Template for future lab
│   ├── lab526/             # Template for future lab
│   └── lab527/             # Template for future lab
├── lab6/                    # Lab 6 series (600-level labs)
│   ├── lab625/             # Advanced lab template
│   ├── lab627/             # Advanced lab template
│   └── lab630/             # Advanced lab template
└── lab7/                    # Lab 7 series (700-level labs)
    └── lab735/             # Demo lab (shows template system)
```

#### 4. **VS Code Integration** (`.vscode/`)
- **Tasks**: Build, run, test, clean labs
- **Debugging**: Integrated GDB debugger
- **Terminal**: Zsh and btop integration
- **Settings**: C++17, auto-formatting, file associations

#### 5. **Utility Scripts** (`scripts/`)
- `build.sh` - Command-line lab building
- `run.sh` - Command-line lab execution
- `test.sh` - Command-line lab testing

#### 6. **Common Libraries** (`common/`)
- `fast_io.hpp` - Fast I/O utilities for labs

## 🧪 Lab Structure

### Nested Organization System

The labs are organized in a nested directory structure for better organization and scalability:

- **`lab5/`** - Contains all 5 chapter labs
- **`lab6/`** - Contains all 6 chapter labs
- **`lab7/`** - Contains all 7 chapter labs

This structure allows you to:
- **Organize labs by major version numbers**
- **Create new lab series easily** (lab8, lab9, etc.)
- **Use any existing lab as a template** for new labs
- **Maintain compatibility** with VS Code tasks and build system

### Individual Lab Structure

Each lab contains:
```
labXXX/
├── main.cpp         # C++ source code
├── input.txt        # Test input data
├── expected.txt     # Expected output
└── Makefile         # Lab-specific build config
```

## 📖 Usage Guide

### VS Code Tasks (Recommended)

1. **Press `Ctrl+Shift+P`** → "Tasks: Run Task"
2. **Choose your task:**
   - **Build Current Lab** - Compile the lab
   - **Run Current Lab** - Build and execute
   - **Test Current Lab** - Run automated tests
   - **Clean Current Lab** - Remove build files
   - **Launch Zsh Terminal** - Enhanced shell
   - **Launch Btop System Monitor** - System resources

3. **Enter lab name** when prompted (e.g., `lab517`)

### Command Line Usage

```bash
# Build a specific lab
make LAB=lab517

# Run a lab with input.txt
make run LAB=lab517

# Test a lab against expected output
make test LAB=lab517

# Clean build files
make clean LAB=lab517

# Clean all builds
make clean-all

# Show help
make help
```

### Script Usage

```bash
# Build using scripts
./scripts/build.sh lab517

# Run using scripts
./scripts/run.sh lab517

# Test using scripts
./scripts/test.sh lab517
```

## 🔄 Development Workflow

### 1. **Starting a New Lab**
```bash
# Navigate to lab directory
cd labs/lab517

# Edit main.cpp with your solution
code main.cpp

# Set up input.txt and expected.txt
```

### 2. **Creating a New Lab Series**
```bash
# Create new lab series directory
mkdir -p labs/lab8

# Copy template lab (e.g., lab520)
cp -r labs/lab5/lab520 labs/lab8/lab845

# Update the Makefile
cd labs/lab8/lab845
# Change LAB := lab845 and ensure include path is correct

# Test the new lab
make test LAB=lab845
```

**Note**: The build system automatically detects labs in nested directories, so you can organize them however you want!

### 3. **Development Cycle**
```bash
# Build and test
make test LAB=lab517

# If test fails, fix code and repeat
# If test passes, commit your work
```

### 4. **Completing a Lab**
```bash
# Add all changes
git add .

# Commit with descriptive message
git commit -m "Completed Lab 517: [description]"

# Push to repository
git push origin main
```

## 🛠️ Available Tools

### **C++ Development**
- **Compiler**: GCC 12 with C++17
- **Debugger**: GDB with VS Code integration
- **Formatter**: clang-format (auto-format on save)
- **IntelliSense**: Full C++ language support

### **Terminal Tools**
- **Zsh**: Enhanced shell with Oh My Zsh
- **Btop**: Beautiful system monitor
- **Git**: Version control integration

### **VS Code Extensions**
- **C/C++**: Language support and IntelliSense
- **CMake Tools**: CMake project support
- **Makefile Tools**: Makefile integration
- **GitLens**: Enhanced Git functionality
- **GitHub Copilot**: AI code assistance

## 🔧 Configuration

### **C++ Settings**
- **Standard**: C++17
- **Compiler**: GCC 12
- **Warnings**: -Wall -Wextra -Wpedantic
- **Optimization**: -O2

### **Editor Settings**
- **Format on Save**: Enabled
- **Format on Type**: Enabled
- **File Associations**: Proper C++ file handling

## 🚨 Troubleshooting

### **Common Issues**

#### **Build Fails**
```bash
# Check if lab exists
ls labs/

# Verify main.cpp exists
ls labs/lab517/main.cpp

# Check compiler installation
g++ --version
```

#### **Test Fails**
```bash
# Check input.txt format
cat labs/lab517/input.txt

# Verify expected.txt
cat labs/lab517/expected.txt

# Run manually to debug
make run LAB=lab517
```

#### **DevContainer Issues**
```bash
# Rebuild container
Ctrl+Shift+P → "Dev Containers: Rebuild Container"

# Check container logs
View → Output → Dev Container
```

### **Performance Tips**
- Use `make clean` between labs to free space
- Close unused terminals to save memory
- Use btop to monitor resource usage

## 📚 Lab Examples

### **Lab 515 (File Reading)**
- **Purpose**: Read filename and output file contents
- **Input**: `hello.txt`
- **Expected**: `Hello, World!`
- **Test**: `make test LAB=lab515`

### **Template Labs (517-527)**
- **Status**: Ready for implementation
- **Structure**: Basic C++ template
- **Customization**: Add requirements from zyBooks

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**
3. **Implement your changes**
4. **Test thoroughly**
5. **Submit a pull request**

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/HetaCrit/ComputerFundamentals2Labs/issues)
- **Documentation**: This README and inline code comments
- **Community**: zyBooks Computer Fundamentals 2 course

---

**Happy Coding! 🎉**

*Built with ❤️ for Computer Fundamentals 2 students*

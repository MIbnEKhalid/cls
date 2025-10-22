#!/bin/bash

# Universal installer for cls - works on all Linux distributions and Android (Termux)
# This script detects the system and installs cls appropriately

set -e

VERSION="1.0.2"
REPO_URL="https://github.com/MIbnEKhalid/cls.git"
AUTHOR="Muhammad Bin Khalid"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect if running on Termux (Android)
if [ -d "$PREFIX" ] && [ -f "$PREFIX/bin/bash" ]; then
    IS_TERMUX=1
    INSTALL_PREFIX="$PREFIX"
else
    IS_TERMUX=0
    INSTALL_PREFIX=""
fi

print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  cls - Universal Installer v$VERSION${NC}         ${BLUE}║${NC}"
    echo -e "${BLUE}║  The Time Saver${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

print_header

# Detect system type
detect_system() {
    if [ "$IS_TERMUX" -eq 1 ]; then
        echo "Termux (Android)"
        return 0
    fi

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ -n "$ID" ]; then
            echo "$ID"
            return 0
        fi
    fi

    if [ -f /etc/redhat-release ]; then
        echo "rhel"
        return 0
    fi

    if [ -f /etc/debian_version ]; then
        echo "debian"
        return 0
    fi

    if [ -f /etc/alpine-release ]; then
        echo "alpine"
        return 0
    fi

    echo "unknown"
}

# Check if running with appropriate privileges
check_privileges() {
    if [ "$IS_TERMUX" -eq 0 ]; then
        if [ "$EUID" -ne 0 ]; then
            print_error "This script must be run as root (use: sudo bash install.sh)"
            exit 1
        fi
    fi
}

# Universal installation method - copy script directly
install_universal() {
    print_info "Using universal installation method..."
    
    if [ ! -f "cls" ]; then
        print_error "cls script not found in current directory"
        print_info "Make sure you run this script from the cls repository directory"
        exit 1
    fi

    # Determine install location
    if [ "$IS_TERMUX" -eq 1 ]; then
        INSTALL_DIR="$INSTALL_PREFIX/bin"
    else
        INSTALL_DIR="/usr/local/bin"
    fi

    # Copy and make executable
    if [ "$IS_TERMUX" -eq 1 ]; then
        cp cls "$INSTALL_DIR/cls"
        chmod 755 "$INSTALL_DIR/cls"
    else
        install -m 755 cls "$INSTALL_DIR/cls"
    fi

    if [ -x "$INSTALL_DIR/cls" ]; then
        print_success "cls installed to $INSTALL_DIR/cls"
        return 0
    else
        print_error "Failed to make cls executable"
        return 1
    fi
}

# Debian/Ubuntu installation via package manager
install_debian() {
    print_info "Detected Debian-based system: $1"
    
    # Try to install via package manager if available
    if command -v apt-get &> /dev/null; then
        print_info "Installing via apt..."
        apt-get update 2>/dev/null || true
        
        # Try to install from repository (if available)
        if apt-cache search "^cls$" 2>/dev/null | grep -q "^cls"; then
            print_info "Installing cls package..."
            apt-get install -y cls
            if [ $? -eq 0 ]; then
                print_success "cls installed via apt"
                return 0
            fi
        fi
    fi

    # Fallback to universal method
    print_info "Package not available in repository, using universal installation method..."
    install_universal
}

# RHEL/CentOS/Fedora installation
install_rhel() {
    print_info "Detected Red Hat-based system: $1"
    
    # Try package manager
    if command -v dnf &> /dev/null; then
        print_info "Installing via dnf..."
        if dnf install -y cls 2>/dev/null; then
            print_success "cls installed via dnf"
            return 0
        fi
    elif command -v yum &> /dev/null; then
        print_info "Installing via yum..."
        if yum install -y cls 2>/dev/null; then
            print_success "cls installed via yum"
            return 0
        fi
    fi

    # Fallback to universal method
    print_info "Package not available in repository, using universal installation method..."
    install_universal
}

# Alpine Linux installation
install_alpine() {
    print_info "Detected Alpine Linux"
    
    if command -v apk &> /dev/null; then
        print_info "Installing via apk..."
        if apk add cls 2>/dev/null; then
            print_success "cls installed via apk"
            return 0
        fi
    fi

    # Fallback to universal method
    print_info "Package not available in repository, using universal installation method..."
    install_universal
}

# Arch Linux installation
install_arch() {
    print_info "Detected Arch Linux"
    
    if command -v pacman &> /dev/null; then
        print_info "Installing via pacman..."
        if pacman -S cls 2>/dev/null; then
            print_success "cls installed via pacman"
            return 0
        fi
    fi

    # Fallback to universal method
    print_info "Package not available in repository, using universal installation method..."
    install_universal
}

# Termux (Android) installation
install_termux() {
    print_info "Detected Termux (Android)"
    print_info "Installing cls for Termux..."
    install_universal
}

# Main installation logic
main() {
    check_privileges
    
    SYSTEM=$(detect_system)
    print_info "System detected: $SYSTEM"
    echo ""

    case "$SYSTEM" in
        termux)
            install_termux
            ;;
        debian|ubuntu|mint|pop|elementary|zorin)
            install_debian "$SYSTEM"
            ;;
        rhel|fedora|centos|rocky|almalinux)
            install_rhel "$SYSTEM"
            ;;
        alpine)
            install_alpine
            ;;
        arch|manjaro|endeavouros)
            install_arch
            ;;
        *)
            print_info "Using universal installation method for unknown system: $SYSTEM"
            install_universal
            ;;
    esac

    if [ $? -eq 0 ]; then
        echo ""
        print_success "Installation completed successfully!"
        echo ""
        echo -e "${BLUE}Testing cls command:${NC}"
        cls --version
        echo ""
        print_info "You can now use 'cls' to clear your terminal!"
        print_info "Try: cls --help"
    else
        print_error "Installation failed"
        exit 1
    fi
}

main "$@"

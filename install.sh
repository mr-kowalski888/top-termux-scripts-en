#!/data/data/com.termux/files/usr/bin/bash

# === COLORS ===
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# === FRAME FUNCTION ===
frame() {
  echo -e "${BLUE}╔════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║ ${YELLOW}$1${RESET}"
  echo -e "${BLUE}╚════════════════════════════════════════════╝${RESET}"
}

# === ERROR FUNCTION ===
error_msg() {
  echo -e "${RED}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ ERROR: $1"
  echo -e "╚════════════════════════════════════════════╝${RESET}"
}

# === TOOL LIST WITH DESCRIPTIONS ===
tool_descriptions=(
  "curl       - transfer data from URLs"
  "wget       - download files"
  "git        - version control system"
  "nano       - simple text editor"
  "vim        - advanced text editor"
  "unzip      - extract .zip archives"
  "tar        - handle .tar archives"
  "zip        - compress files"
  "tree       - directory tree view"
  "coreutils  - basic UNIX commands"
  "htop       - interactive process viewer"
  "neofetch   - show system info with style"
  "proot      - run Linux rootfs without root"
  "termux-api - access Android features"
  "openssh    - SSH client/server"
  "dnsutils   - DNS tools (nslookup, etc.)"
  "busybox    - bundled UNIX tools"
  "inxi       - full system information"
  "perl       - required for inxi"
  "nmap       - port scanner"
  "netcat     - network debugging"
  "whois      - domain information"
  "traceroute - trace network path"
  "python     - programming language"
  "python-pip - Python package manager"
  "nodejs     - JavaScript runtime"
  "php        - PHP interpreter"
  "clang      - C/C++ compiler"
  "ruby       - Ruby language"
  "golang     - Go programming language"
  "rust       - Rust programming language"
  "figlet     - ASCII art banners"
  "toilet     - stylized ASCII banners"
  "lolcat     - rainbow color output"
  "apt        - package manager"
  "pkg        - simplified package manager"
)

# === PACKAGE NAMES ===
tools=(
  curl wget git nano vim unzip tar zip tree coreutils
  htop neofetch proot termux-api openssh dnsutils busybox inxi perl
  nmap netcat whois traceroute
  python python-pip nodejs php clang ruby golang rust
  figlet toilet lolcat apt pkg
)

# === SHOW PACKAGE LIST BEFORE INSTALLATION ===
clear
frame "🧰 The following tools will be installed:"

for line in "${tool_descriptions[@]}"; do
  echo -e "${GREEN}  $line${RESET}"
done

echo
read -p "❓ Continue installation? (y/n): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
  frame "⛔ Installation cancelled by user"
  exit 0
fi

# === START INSTALLATION ===
frame "🚀 Starting installation of Termux tools..."

for pkg in "${tools[@]}"; do
  frame "📥 Installing: $pkg"
  if pkg install -y "$pkg"; then
    echo -e "${GREEN}✅ Installed: $pkg${RESET}"
  else
    error_msg "Failed to install: $pkg"
  fi
done

# === END ===
frame "✅ All tools installed successfully!"

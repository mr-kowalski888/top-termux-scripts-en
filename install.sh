#!/data/data/com.termux/files/usr/bin/bash

# === COLORS ===
GREEN="\033[1;32m"   # Green
RED="\033[1;31m"     # Red
BLUE="\033[1;34m"    # Blue
YELLOW="\033[1;33m"  # Yellow
RESET="\033[0m"      # Reset

# === FRAME FUNCTION ===
print_frame() {
  echo -e "${BLUE}╔════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║ ${YELLOW}$1${RESET}"
  echo -e "${BLUE}╚════════════════════════════════════════════╝${RESET}"
}

# === ERROR FUNCTION ===
print_error() {
  echo -e "${RED}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ ERROR: $1"
  echo -e "╚════════════════════════════════════════════╝${RESET}"
}

# === TOOL DESCRIPTIONS ===
utility_descriptions=(
  "curl       - transfer data from URLs"
  "wget       - alternative to curl"
  "git        - version control system"
  "nano       - simple text editor"
  "vim        - advanced text editor"
  "unzip      - extract zip archives"
  "tar        - handle .tar archives"
  "zip        - compress files"
  "tree       - directory tree view"
  "coreutils  - basic UNIX commands"
  "htop       - interactive process viewer"
  "neofetch   - system info with style"
  "proot      - environment isolation"
  "termux-api - access Android features"
  "openssh    - SSH client and server"
  "dnsutils   - DNS tools (nslookup, etc.)"
  "busybox    - bundled UNIX tools"
  "inxi       - system information"
  "perl       - required for inxi"
  "nmap       - port scanner"
  "whois      - domain information"
  "traceroute - trace network path"
  "python     - programming language"
  "python-pip - Python package manager"
  "nodejs     - JavaScript runtime"
  "php        - PHP language"
  "clang      - C/C++ compiler"
  "ruby       - Ruby language"
  "golang     - Go language"
  "rust       - Rust language"
  "figlet     - ASCII art banners"
  "toilet     - stylized ASCII banners"
  "lolcat     - rainbow output (installed via gem)"
)

# === PACKAGE LIST FOR pkg ===
packages=(
  curl wget git nano vim unzip tar zip tree coreutils
  htop neofetch proot termux-api openssh dnsutils busybox inxi perl
  nmap whois traceroute
  python python-pip nodejs php clang ruby golang rust
  figlet toilet
)

# === SHOW TOOL LIST BEFORE INSTALLATION ===
clear
print_frame "🧰 The following tools will be installed:"

for item in "${utility_descriptions[@]}"; do
  echo -e "${GREEN}  $item${RESET}"
done

echo
read -p "❓ Continue installation? (y/n): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
  print_frame "⛔ Installation cancelled by user"
  exit 0
fi

# === UPDATE SYSTEM ===
print_frame "🔄 Updating package list..."
yes | pkg update > /dev/null 2>&1
yes | pkg upgrade > /dev/null 2>&1

# === INSTALL PACKAGES ===
print_frame "🚀 Starting tool installation..."

for package in "${packages[@]}"; do
  print_frame "📥 Installing: $package"
  if pkg install -y "$package" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Installed: $package${RESET}"
  else
    print_error "Failed to install: $package"
  fi
done

# === INSTALL LOLCAT THROUGH GEM ===
print_frame "🌈 Installing lolcat via Ruby gem..."
if gem install lolcat > /dev/null 2>&1; then
  echo -e "${GREEN}✅ lolcat installed via gem${RESET}"
else
  print_error "Failed to install lolcat via gem"
fi

# === FINAL MESSAGE ===
print_frame "✅ All tools were installed successfully!"
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
error() {
  echo -e "${RED}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ ERROR: $1"
  echo -e "╚════════════════════════════════════════════╝${RESET}"
}

# === START ===
clear
frame "🧹 Starting full Termux cleanup"

# === 1. CLEAN APT CACHE ===
frame "🧼 Cleaning APT cache..."
if ! apt clean; then
  error "Failed to clean apt cache"
fi

# === 2. AUTOREMOVE UNUSED PACKAGES ===
frame "🗑️ Removing unused packages..."
if ! apt autoremove -y; then
  error "Failed to autoremove packages"
fi

# === 3. REMOVE ~/.cache ===
frame "📂 Cleaning ~/.cache folder..."
[[ -d ~/.cache ]] && rm -rf ~/.cache/*

# === 4. CLEAR INTERNAL TERMUX CACHE ===
frame "📂 Cleaning internal Termux cache..."
[[ -d /data/data/com.termux/cache ]] && rm -rf /data/data/com.termux/cache/*

# === 5. REMOVE SD CARD TRASH ===
frame "🗑️ Removing /sdcard/.Trash..."
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. CLEAR SHELL HISTORY ===
frame "📜 Clearing shell history..."
rm -f ~/.bash_history ~/.zsh_history

# === 7. REMOVE LOCK AND LOG FILES ===
frame "🔐 Removing lock and log files..."
rm -f /data/data/com.termux/files/usr/var/lib/apt/lists/lock
rm -f /data/data/com.termux/files/usr/var/cache/apt/archives/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock

# === 8. SHOW DISK USAGE ===
frame "📊 Memory usage:"
df -h | grep -E '^(/|/data|/dev|/sdcard)'

# === DONE ===
frame "✅ Termux cleanup complete!"
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

# === START ===
clear
frame "🧹 Starting Termux Super Clean"

# === 1. CLEAN APT CACHE ===
frame "🧼 Cleaning APT package cache..."
if ! apt clean; then
  error_msg "Failed to clean apt cache"
fi

# === 2. AUTOREMOVE UNUSED PACKAGES ===
frame "🗑️ Autoremoving unused packages..."
if ! apt autoremove -y; then
  error_msg "Autoremove failed"
fi

# === 3. CLEAR ~/.cache ===
frame "📂 Removing ~/.cache..."
rm -rf ~/.cache/*

# === 4. CLEAR Termux cache ===
frame "📂 Removing Termux internal cache..."
rm -rf /data/data/com.termux/cache/*

# === 5. CLEAR .Trash from sdcard (if exists) ===
frame "🗑️ Removing /sdcard/.Trash..."
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. CLEAR BASH/ZSH HISTORY ===
frame "📜 Clearing shell history..."
rm -f ~/.bash_history ~/.zsh_history

# === 7. REMOVE LOCK & LOG FILES ===
frame "🔐 Removing lock & log files..."
rm -f /data/data/com.termux/files/usr/var/lib/apt/lists/lock
rm -f /data/data/com.termux/files/usr/var/cache/apt/archives/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock

# === 8. CHECK DISK USAGE ===
frame "📊 Current disk usage:"
df -h | grep -E '^(/|/data|/dev|/sdcard)'

# === DONE ===
frame "✅ Termux Super Clean completed!"

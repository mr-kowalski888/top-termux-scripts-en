#!/data/data/com.termux/files/usr/bin/bash

# === COLORS ===
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"

# === BORDER FUNCTION ===
border() {
  echo -e "${BLUE}╔══════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║ ${YELLOW}$1${RESET}"
  echo -e "${BLUE}╚══════════════════════════════════════╝${RESET}"
}

# === ERROR HANDLER ===
error_msg() {
  echo -e "${RED}╔══════════════════════════════════════╗"
  echo -e "║ ❌ ERROR: $1"
  echo -e "╚══════════════════════════════════════╝${RESET}"
}

# === START ===
clear
border "🚀 Termux Super Update Started"

# === 1. UPDATE PACKAGE LIST ===
border "🔄 Updating package list..."
if ! pkg update -y; then
  error_msg "Failed to update package list"
  exit 1
fi

# === 2. UPGRADE PACKAGES ===
border "⬆️ Upgrading installed packages..."
if ! pkg upgrade -y; then
  error_msg "Failed to upgrade packages"
  exit 1
fi

# === 3. AUTOREMOVE UNUSED PACKAGES ===
border "🧹 Autoremoving unused packages..."
if ! apt autoremove -y; then
  error_msg "Autoremove failed"
fi

# === 4. CLEAN PACKAGE CACHE ===
border "🧼 Cleaning package cache..."
if ! apt clean; then
  error_msg "Cleaning cache failed"
fi

# === 5. CLEAR TEMP FILES ===
border "🗑️ Clearing temp and trash files..."
rm -rf ~/.cache/*
rm -rf /data/data/com.termux/cache/*
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. STORAGE CHECK ===
border "📊 Checking disk space usage..."
df -h | grep -E '^(/|/data|/dev|/sdcard)' || error_msg "Disk check failed"

# === 7. NETWORK STATUS ===
border "🌐 Checking internet connection..."
ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Internet is working${RESET}"
else
  error_msg "No internet connection"
fi

# === 8. OPTIONAL: UPGRADE TERMUX APP ===
border "📥 Tip: Update Termux app from F-Droid manually if needed!"

# === DONE ===
border "✅ Super Update Completed Successfully!"

#!/data/data/com.termux/files/usr/bin/bash

# 🔄 Removing lock files to prevent dpkg errors
echo "🔄 Removing lock files..."
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend

# 🧹 Cleaning pkg cache and outdated files
echo "🧹 Cleaning..."
yes | pkg autoclean
yes | pkg clean

# 🛠 Fixing broken packages and reinstalling essential tools
echo "🛠 Repairing..."
dpkg --configure -a
pkg install -y termux-tools proot bash zsh coreutils util-linux busybox
pkg update -y && pkg upgrade -y

# ✅ Done!
echo "✅ Done!"
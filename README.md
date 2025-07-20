# 🚀 TOP Termux Scripts EN — Best Useful Scripts for Termux (in English)

A collection of powerful, safe, and beautifully formatted shell scripts for Termux.  
Includes system updating, useful tool installation, and full cleanup — all in English.

📁 Repository: [github.com/mr-kowalski888/top-termux-scripts-en](https://github.com/mr-kowalski888/top-termux-scripts-en)

---

## 📦 What's Inside

### 🔄 `updg.sh` — Super Termux Updater
- Updates package lists and installed packages (`pkg update && upgrade`)
- Removes unnecessary packages (`autoremove`)
- Cleans apt cache and temp files
- Checks internet connection and storage space
- Output is colorful and well-formatted in framed sections

### 📥 `install.sh` — Install Essential Utilities
- Installs 30+ must-have tools: `curl`, `git`, `vim`, `figlet`, `lolcat`, `python`, `nmap`, etc.
- Displays a list with descriptions before install
- Asks for confirmation
- No root access required

### 🧹 `clean.sh` — Full Termux Cleaner
- Safely removes apt cache, temp files, bash/zsh history, `.Trash`, lock files
- Does not touch your home directory or user files
- Shows disk space usage after cleanup

---

## ⚙️ Installation & Usage

Clone the repository, make scripts executable, and run them:

```bash
# 📥 Clone the GitHub repository
git clone https://github.com/mr-kowalski888/top-termux-scripts-en

# 📂 Enter the project directory
cd top-termux-scripts-en

# ✅ Make the scripts executable:
# - updg.sh     — super updater
# - install.sh  — install essential tools
# - clean.sh    — full cleanup
chmod +x updg.sh install.sh clean.sh

# ▶️ Run the desired script:
./updg.sh      # System update
./install.sh   # Install tools
./clean.sh     # Clean Termux

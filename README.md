# cls - The Time Saver

**Are you lazy enough to not want to type clear?** Well, we got you covered! Tired of writing long, tedious commands? Meet `cls` – the shorter, snappier, and way more entertaining way to clear your terminal screen!

> **TL;DR:** `cls` does the same thing as `clear`, but with way fewer keystrokes. You're welcome!

## Installation

### Method 1: Universal Installation (Recommended) 🚀

Works on **all Linux distributions** (Debian, Red Hat, Alpine, Arch, etc.) and **Android (Termux)**:

```bash
git clone https://github.com/MIbnEKhalid/cls.git
cd cls
sudo bash install.sh
```

### Method 2: Direct Download (Debian-based systems only)

For Ubuntu, Debian, and derivatives:

```bash
wget https://github.com/MIbnEKhalid/cls/releases/download/v1.0.2/cls_1.0.2-1_all.deb
sudo dpkg -i cls_1.0.2-1_all.deb
```

### Method 3: Manual Installation (Works everywhere)

Copy the script directly to your system:

```bash
git clone https://github.com/MIbnEKhalid/cls.git
cd cls
sudo install -m 755 cls /usr/local/bin/cls
```

For Termux (Android):
```bash
git clone https://github.com/MIbnEKhalid/cls.git
cd cls
install -m 755 cls "$PREFIX/bin/cls"
```

### Method 4: Building from source

To build the Debian package from source:

1. Install build dependencies:
   ```bash
   sudo apt install build-essential debhelper devscripts git
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/MIbnEKhalid/cls.git
   cd cls
   ```

3. Build the package:
   ```bash
   dpkg-buildpackage -us -uc && sudo dpkg -i ../cls_1.0.2-1_all.deb
   ```

## Usage

### Basic Usage
The command is case-insensitive. All these variations work:

```bash
cls   # lowercase
Cls   # Title case
CLS   # uppercase
CLs   # mixed case
```

### Available Options

```bash
cls
cls -h, --help                # Display help message
cls -v, --version             # Display version information
cls -c, --compatible          # Clear screen in compatible mode
```

## Uninstallation

### If installed via package manager:

```bash
# Debian/Ubuntu
sudo apt remove cls

# Red Hat/Fedora/CentOS
sudo dnf remove cls
# or
sudo yum remove cls

# Alpine Linux
sudo apk del cls

# Arch Linux
sudo pacman -R cls
```

### If installed via universal installer or manual method:

```bash
# Most systems
sudo rm /usr/local/bin/cls

# Termux (Android)
rm $PREFIX/bin/cls
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Contact

For questions or contributions, please contact:
- **Muhammad Bin Khalid**  
  - Website: [mbktechstudio.com/Support](https://mbktechstudio.com/Support/)  
  - Email: [support@mbktechstudio.com](mailto:support@mbktechstudio.com)  
  - Alternate Email: [chmuhammadbinkhalid28@gmail.com](mailto:chmuhammadbinkhalid28@gmail.com)
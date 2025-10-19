# cls

A simple command-line utility to clear the terminal screen.

## Installation

### Method 1: Using Package Repository

Add our repository to your system:

```bash
# Add the repository
echo "deb http://pkg.mbktechstudio.com/cls /" | sudo tee /etc/apt/sources.list.d/cls.list

# Update package list
sudo apt update

# Install cls
sudo apt install cls
```

### Method 2: Direct Download

You can also download and install the package directly:

```bash
wget http://pkg.mbktechstudio.com/cls/cls_1.0.1-1_all.deb
sudo dpkg -i cls_1.0.1-1_all.deb
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

You can uninstall cls using either of these methods:

```bash
# If installed via apt
sudo apt remove cls

# If installed via dpkg
sudo dpkg -r cls
```

## Building from source

To build this package from source:

1. Install build dependencies:
   ```bash
   sudo apt install build-essential debhelper devscripts
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/MIbnEKhalid/cls.git
   cd cls
   ```

3. Build the package:
   ```bash
   dpkg-buildpackage -us -uc && sudo dpkg -i ../cls_1.0.1-1_all.deb
   ```

## Author

Muhammad Bin Khalid <chmuhammadbinkhalid28@gmail.com>
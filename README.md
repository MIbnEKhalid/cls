# cls

A simple command-line utility to clear the terminal screen.

## Installation

You can install this package using:

```bash
sudo apt install cls
```

## Usage

Simply type:

```bash
cls
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
   dpkg-buildpackage -us -uc
   ```

## Author

Muhammad Bin Khalid <chmuhammadbinkhalid28@gmail.com>
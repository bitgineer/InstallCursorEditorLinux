# Setup: Install Cursor AI Code Editor on Linux

## Introduction

This guide helps you install **Cursor AI Code Editor** as a desktop application on Linux operating systems, regardless of which distribution you use, simplifying the setup process.

### What is Cursor AI Code Editor?

Cursor IDE is an AI-powered code editor, built on the foundations of Visual Studio Code and enhanced with ChatGPT integration. It offers a rich development experience with AI-based coding assistance. To learn more about Cursor IDE, visit the official [Cursor website](https://cursor.sh/).

<p align="center"> <a href="https://cursor.sh/"> <img src="./assets/cursor.png" alt="Cursor" width="100px"> </a> </p>

## Prerequisites

Before starting the installation, ensure the following dependencies are installed on your system:

- **Git**: Used to clone the repository.
- **Curl**: Required to download the installation files.
- **Bash**: The script is written in Bash, so ensure it's available in your shell.

To install these dependencies (if not already installed), use the following commands, depending on the distribution you use:

### Instructions for Installing Dependencies on Your Linux Operating System

#### Debian/Ubuntu and Derivados

```bash
sudo apt update
sudo apt install git curl bash -y
```

#### Arch Linux/Manjaro/EndeavourOS

```bash
sudo pacman -Sy
sudo pacman -S git curl bash --noconfirm
```

#### Fedora

```bash
sudo dnf install git curl bash -y
```

#### OpenSUSE

```bash
sudo zypper refresh
sudo zypper install git curl bash
```

#### Gentoo

```bash
sudo emerge --ask dev-vcs/git net-misc/curl app-shells/bash
```

#### Solus

```bash
sudo eopkg install -y git curl bash
```

## Installation

To install Cursor IDE, run the following command in your terminal. This will clone the repository, navigate into it, and start the installation process:

```bash
git clone https://github.com/bitgineer/InstallCursorEditorLinux.git --depth=1 && cd InstallCursorEditorLinux && ./install.sh && cd .. && rm -rf InstallCursorEditorLinux
```

This script will:

1. Download the Cursor IDE application.
2. Set it up as a desktop application.
3. Create a `.desktop` file for easy access from your applications menu.
4. Configure an automatic update script using `systemd`.

### Customizing the Installation

If you'd like to change the installation directory or other settings, you can modify the `install.sh` script before running it. The default installation path is `/opt/cursor/`.

## Features

- **AI-powered coding**: Leverages ChatGPT for real-time code suggestions and improvements.
- **Cross-platform**: Cursor IDE is available on Windows, macOS, and Linux.
- **VSCode-based**: Built on the familiar interface of Visual Studio Code, making it easy for VSCode users to adapt.

## Command Line Usage

After installation, you can use the `cursor` command from your terminal:

```bash
cursor --help
```

## Automatic Updates

The installation process configures a systemd service that checks for and installs the latest updates of Cursor IDE. To manually trigger an update, run the following command:

```bash
sudo systemctl start update-cursor.service
```

To enable automatic updates at startup:

```bash
sudo systemctl enable update-cursor.service
```

## Troubleshooting

### Custom Download Link Issues

If you've modified `shell/vars.sh` to use a custom `URL_CURSOR_DOWN` and are encountering issues, please ensure the following:

1. **Direct Link**: The `URL_CURSOR_DOWN` variable should point directly to a Cursor AppImage file (e.g., `https://downloads.cursor.com/production/xxxx/linux/x64/Cursor-X.Y.Z-x86_64.AppImage`).
2. **Version in URL**: The script attempts to extract the version number (e.g., `X.Y.Z`) from this URL to correctly name and manage the downloaded file. If the URL format doesn't include the version in a recognizable pattern (like `Cursor-X.Y.Z`), the script might default to a generic filename (e.g., `cursor--x86_64.AppImage`) which can lead to issues.
3. **No API Endpoint**: Unlike some internal mechanisms, for user customization, `URL_CURSOR_DOWN` should be the final download URL, not an API endpoint that returns a download URL.

### Leftover Files or Installation Conflicts

If a previous installation attempt failed, or if you suspect conflicting files are causing problems, you might need to manually remove some files before retrying the installation:

- **Cached AppImage**: The script downloads the AppImage to `~/Cursor/`. If an old or incorrectly named AppImage exists here (e.g., `~/Cursor/cursor--x86_64.AppImage` or `~/Cursor/cursor-OLD_VERSION-x86_64.AppImage`), it might be used instead of downloading a fresh one, potentially causing errors. You can remove it with:

    ```bash
    rm ~/Cursor/cursor-*.AppImage
    ```

    (Use with caution, this removes all AppImages in that directory matching the pattern).

- **Old Installation Directory**: If you have a partially completed or old installation in the default location, consider removing it:

    ```bash
    sudo rm -rf /opt/cursor
    ```

    **Warning**: This command will permanently delete the `/opt/cursor` directory. Ensure you don't have other important data there if you've customized paths.

After cleaning up, try running the `install.sh` script again.

## Uninstallation

You can uninstall Cursor IDE using either of these methods:

1. Using the uninstall command:

```bash
cursor --uninstall
```

2. Manually removing the files:

```bash
sudo rm -rf /opt/cursor
sudo rm -f /usr/local/bin/cursor
rm ~/.config/systemd/user/update-cursor.service
sudo systemctl disable update-cursor.service
```

### Contributors 🤝

Contributions of all kinds are welcome, thanks to all contributors for their contributions!

<a href="https://github.com/IsRengel/InstallCursorEditorLinux/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=IsRengel/InstallCursorEditorLinux" alt="Contributors" />
</a>

## Learn More

For more details about Cursor IDE and its features, visit the [official website](https://cursor.sh/).

#!/bin/bash

# colors
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly CYAN='\033[0;36m'
readonly BLUE_DARK='\033[0;34m'
readonly NC='\033[0m'  # No Color

# emojis
readonly DOWNLOAD_EMOJI='\U1F4E2'  # Unicode character for a download emoji

# vars
readonly OUTPUT_DIRECTORY=~/Cursor
readonly URL_CURSOR_DOWN="https://downloads.cursor.com/production/0781e811de386a0c5bcb07ceb259df8ff8246a52/linux/x64/Cursor-0.49.6-x86_64.AppImage" #changed the download to the current latest working image compatiable with yeongpin/cursor-free-vip
readonly EXEC_PATH="/opt/cursor/squashfs-root/AppRun"

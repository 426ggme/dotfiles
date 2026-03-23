#!/bin/bash

# --- 設定 ---
ssDir=~/Pictures/Screenshots
mkdir -p "$ssDir"
ssName=$(date "+%Y%m%d-%H%M%S").png
ssPath="$ssDir/$ssName"

# --- Fuzzel dmenu ---
options="Area (Copy)
Area (Save)
Window (Copy)
Window (Save)
Screen (Copy)
Screen (Save)
Window (5s Delay, Copy)"

choice=$(echo -e "$options" | fuzzel --dmenu --prompt "Screenshot: ")

case "$choice" in
    "Area (Copy)")
        sleep 0.2
        slurp | grim -g - - | wl-copy
        ;;
    "Area (Save)")
        sleep 0.2
        slurp | grim -g - "$ssPath"
        ;;
    "Window (Copy)")
        # slurp はウィンドウの境界を強調表示するのでクリックして選択
        sleep 0.2
        tmpfile=$(mktemp /tmp/niri-ss-XXXXXX.png)
        slurp | grim -g - "$tmpfile" && wl-copy < "$tmpfile"
        rm -f "$tmpfile"
        ;;
    "Window (Save)")
        # niri 組み込みのウィンドウスクリーンショット（フォーカスウィンドウを保存）
        sleep 0.2
        niri msg action screenshot-window
        ;;
    "Screen (Copy)")
        sleep 0.2
        grim - | wl-copy
        ;;
    "Screen (Save)")
        sleep 0.2
        grim "$ssPath"
        ;;
    "Window (5s Delay, Copy)")
        sleep 5
        tmpfile=$(mktemp /tmp/niri-ss-XXXXXX.png)
        slurp | grim -g - "$tmpfile" && wl-copy < "$tmpfile"
        rm -f "$tmpfile"
        ;;
    *)
        exit 1
        ;;
esac

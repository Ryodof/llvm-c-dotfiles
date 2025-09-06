#!/bin/bash

WALLPAPER_DIR="$HOME/.config/wallpapers"
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Проверяем, существует ли hyprpaper и файл обоев
if command -v hyprpaper &> /dev/null && [ -f "$RANDOM_WALLPAPER" ]; then
    echo "preload = $RANDOM_WALLPAPER" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = ,$RANDOM_WALLPAPER" >> ~/.config/hypr/hyprpaper.conf
    pkill hyprpaper
    hyprpaper &
fi

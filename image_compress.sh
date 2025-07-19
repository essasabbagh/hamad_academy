#!/bin/bash

# Compress JPG/JPEG files with jpegoptim (lossless by default)
find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec jpegoptim --preserve --strip-all {} \;

# Compress PNG files with pngquant (near-lossless)
find . -type f -iname "*.png" -exec pngquant --ext .png --force --skip-if-larger --quality 80-100 {} \;
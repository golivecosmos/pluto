#!/bin/bash

ffmpeg -y -i output.ts -i qrCode.png -filter_complex "[1:v]scale=100:100[ovrl];[0:v][ovrl]overlay=main_w-overlay_w-10:main_h-overlay_h-10" -c:a copy final.mp4

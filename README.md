# Cosmos Encode Library

This repository contains a set of tools for working with media files. This library provides various functionalities such as resizing images, creating videos from images or documents, adding audio to videos, and applying filters to videos. To use the library, follow the prerequisites below and run from your terminal.

## Prerequisites

Before using this library, make sure you have the following software installed on your machine:

- FFmpeg: FFmpeg is a command-line tool used for handling multimedia data. It can be downloaded from the official FFmpeg website: https://ffmpeg.org/
- ImageMagick: ImageMagick is a software suite used to create, edit, and compose bitmap images. You can download ImageMagick from the official website: https://imagemagick.org/

## Getting Started

To get started, check out the table of contents below and decide which command you'd like to apply to your media files. Store your media files in the `assets` directory in this repo and run the name of the command from your terminal like so:

```bash
sh index.sh <command> <file1> <file2>
```

## Table of Contents

- [Convert PDF to MP4](#convert-pdf-to-mp4)
- [Convert to MP4](#convert-to-mp4)
- [Convert to OGG](#convert-to-ogg)
- [Convert to WebM](#convert-to-webm)
- [Convert to WebP](#convert-to-webp)
- [Create A Horizontal Stack](#create-a-horizontal-stack)
- [Resize an Image](#resize-an-image)

### Convert PDF to MP4

This command allows you to turn a PDF with multiple pages into a slideshow video with an audio track.

Usage:

```bash
sh index.sh convert-pdf-to-mp4.sh assets/document.pd4 audio.mp3
```

### Convert to MP4

This command can encode GIF or other video files into an MP4 file format.

Usage:

```bash
sh index.sh convert-to-mp4.sh assets/example.gif
```

### Convert to OGG

This command can encode GIF or other video files into an OGG file format.

Usage:

```bash
sh index.sh convert-to-ogg.sh assets/example.gif
```

### Convert to WebM

This command can encode GIF or other video files into a WebM file format.

Usage:

```bash
sh index.sh convert-to-webm.sh assets/example.gif
```

### Convert to WebP

This command can encode image files into a WebP file format.

Usage:

```bash
sh index.sh convert-to-webp.sh assets/image.png
```

### Create a Horizontal Stack

This command will stack two images or videos next to each other, horizontally.

Usage:

```bash
sh index.sh hstack assets/image.png assets/image2.png
```

### Resize an image

This command will resize an image to a desired scale. Pass in a file and the scale you want to resize the image into as a decimal, e.g. 0.5 for for 50%.

Usage:

```bash
sh index.sh resize assets/image.png 0.5
```

## How to Contribute

Feel free to explore these commands and make use of the media tools provided by this library. Enjoy working with your media files!

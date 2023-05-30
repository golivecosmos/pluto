<h1 align='center' >
Pluto 🪄
</h1>
<p align='center'>
    <a href='https://github.com/golivecosmos/pluto/blob/main/LICENSE'>
    <img src='https://img.shields.io/github/license/golivecosmos/pluto?style=plastic' alt='License' />
    </a>
      <a href='https://github.com/golivecosmos/llm-react-node-app-template'>
        <img src='https://img.shields.io/github/commit-activity/w/golivecosmos/llm-react-node-app-template?style=plastic' alt='Cosmos'              style='margin-    right:3px' />
    </a>
  <a href='https://twitter.com/golivecosmos'>
    <img src='https://img.shields.io/twitter/follow/golivecosmos?style=social' alt='Cosmos' style='margin-right:3px' />
  </a>
</p>

# What is Pluto?

Pluto is a library of scripts for working with media files. This library provides various functionalities such as resizing images, creating video from images or documents, and encoding files into differnt formats.

## Why is Pluto helpful?

Sometimes you need a quick way to work with media files. For example:

- Creating a slideshow video from a set of images
- Converting image and video file into browser-friendly formats
- Generating responsive images for a website scaled to various sizes

If you find yourself working with media files often, it may be helpful to have a library to automate your workflows.

![GIF of Pluto demo](https://cosmos-media-content.s3.amazonaws.com/public-content/pluto_demo.gif)

To use the library, follow the prerequisites below and run from your terminal.

## Prerequisites

Before using this library, make sure you have the following software installed on your machine:

- FFmpeg: FFmpeg is a command-line tool used for handling multimedia data. It can be downloaded from the official FFmpeg website: https://ffmpeg.org/
- ImageMagick: ImageMagick is a software suite used to create, edit, and compose bitmap images. You can download ImageMagick from the official website: https://imagemagick.org/

## Getting Started

To get started, check out the table of contents below and follow these steps:

1. Decide which 🪄 command 💫 you'd like to apply to your media files

1. Store your media files in the `assets` directory in this repo

1. Run the name of the command from your terminal like so:

    ```bash
        sh index.sh <command> <file1> <file2> <option1>
    ```

1. Check the `assets` directory for the created file

----------------

## Table of Contents

- [Convert image to video](#convert-image-to-video)
- [Convert image to WebP](#convert-image-to-webp)
- [Convert PDF to video](#convert-pdf-to-mp4)
- [Convert video to GIF](#convert-video-to-gif)
- [Convert video to MP4](#convert-video-to-mp4)
- [Convert video or audio to OGG](#convert-video-to-ogg)
- [Convert video to WebM](#convert-video-to-webm)
- [Edit two images and/or videos to display next to each other, horizontally](#create-a-horizontal-stack)
- [Resize an image](#resize-an-image)
- [Extract frames from a video](#extract-frames-from-a-video)
- [Modify video speed](#modify-video-speed)

### Convert Image to Video

This command can encode an image file into an MP4 video file. Pass in the desired frame rate and duration. Frame rate will default to 24 frames per second and duration will default to 10 seconds.

Usage:

```bash
sh index.sh image-to-video assets/image.png 24 10
```

### Convert Image to WebP

This command can encode image files into a WebP file format.

Usage:

```bash
sh index.sh webp assets/image.png
```

### Convert PDF to MP4

This command allows you to turn a PDF with multiple pages into a slideshow video with an audio track.

Usage:

```bash
sh index.sh pdf-to-mp4 assets/document.pd4 audio.mp3
```

### Convert Video to GIF

This command will convert a video file into a GIF file format.

Usage:

```bash
sh index.sh gif assets/video.mp4
```

### Convert Video to MP4

This command can encode GIF or other video files into an MP4 file format.

Usage:

```bash
sh index.sh mp4 assets/example.gif
```

### Convert Video to OGG

This command can encode GIF or other video files into an OGG file format.

Usage:

```bash
sh index.sh ogg assets/example.gif
```

### Convert Video to WebM

This command can encode GIF or other video files into a WebM file format.

Usage:

```bash
sh index.sh webm assets/example.gif
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

### Extract frames from a video

This command will extract N number of frames from a video. Pass in a video file and the frames per second as a decimal, e.g. 1 for an image every 1 second, 2 for 2 images every 1 second, 0.25 for an image every 4 seconds. 

Usage:

```bash
sh index.sh video-to-image assets/video.mp4 0.5
```

### Modify video speed

This command will speed up or slow down a video. Pass in a video file and the speed as a decimal, e.g. 2 to slow down the video, 0.5 to double the speed of the video. 

Usage:

```bash
sh index.sh modify-video-speed assets/video.mp4 0.5
```

----------------

## How to Contribute

Feel free to explore these scripts and open any issues if there's something you'd like to see added, or open a pull request to add new scripts.

### Thank you to ⭐star gazers⭐ supporting the project

[![Stargazers repo roster for @golivecosmos/pluto](https://reporoster.com/stars/golivecosmos/pluto)](https://github.com/golivecosmos/pluto/stargazers)

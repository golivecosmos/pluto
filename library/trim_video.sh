#!/bin/bash

ffmpeg -i hstack.mp4 -ss 00:00:00 -t 00:00:17 -c copy hstack_trim.mp4

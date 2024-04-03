#!/bin/bash
if [[ "$1" == "" ]]; then
    echo "usage: ./est_framesampling.sh <fs> <video>"
    exit 0
fi
fs=$2
video=$2
res=$(ffmpeg -y -i "$video" -filter:v "select='not(mod(n\,$fs))',setpts=N/FRAME_RATE/TB" -c:v libx264 -x264opts keyint=$fs:min-keyint=$fs:scenecut=-1  -c:v libx264 -crf 26 -preset medium  -f mp4 /dev/null 2>&1 | grep "libx264")

bitrate=$(echo "$res" | grep "kb/s" | sed "s|.*kb.s:||g")

echo "{\"video\": \"$video\", \"estimated_bitrate_[kb/s]\": $bitrate }"



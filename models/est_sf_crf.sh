#!/bin/bash
if [[ "$1" == "" ]]; then
    echo "usage: ./est_sf_crf.sh <video>"
    exit 0
fi
res=$(ffmpeg -y -i "$1" -filter:v "select='not(mod(n\,10))',setpts=N/FRAME_RATE/TB" -c:v libx264 -x264opts keyint=10:min-keyint=10:scenecut=-1 -crf 28 -preset superfast -tune zerolatency -f mp4 /dev/null 2>&1 | grep "libx264")

bitrate=$(echo "$res" | grep "kb/s" | sed "s|.*kb.s:||g")

echo "{\"video\": \"$1\", \"estimated_bitrate_[kb/s]\": $bitrate }"



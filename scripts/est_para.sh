#!/bin/bash
if [[ "$1" == "" ]]; then
    echo "usage: ./est_preset.sh <preset> <crf> <video>"
    exit 0
fi
preset=$1
crf=$2
video=$3
res=$(ffmpeg -y -i "$video" -c:v libx264 -crf $crf -preset $preset  -f mp4 /dev/null 2>&1 | grep "libx264")

bitrate=$(echo "$res" | grep "kb/s" | sed "s|.*kb.s:||g")

echo "{\"video\": \"$video\", \"estimated_bitrate_[kb/s]\": $bitrate }"



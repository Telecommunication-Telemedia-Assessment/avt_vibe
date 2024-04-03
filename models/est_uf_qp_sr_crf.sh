#!/bin/bash
# requires ffmpeg and bc installed
if [[ "$1" == "" ]]; then
    echo "usage: ./est_uf_qp_sr_crf.sh <video>"
    exit 0
fi
res=$(ffmpeg -y -i "$1" -filter:v "select='not(mod(n\,10))',setpts=N/FRAME_RATE/TB" -c:v libx264 -crf 26 -preset ultrafast -tune zerolatency -f mp4 /dev/null 2>&1 | grep "libx264")

bitrate=$(echo "$res" | grep "kb/s" | sed "s|.*kb.s:||g")
skipratio=$(echo "$res" | grep "skip:" | sed "s|.*:||g" | sed "s|%||g")
pframe_qp=$(echo "$res" | grep "frame P:" | sed "s|.*Avg QP:||g" | sed "s|size:.*||g" | sed "s| *||g")

a1=21749.2761
b1=0.13837051
c1=30121.3953
d11=-31616.5783
e1=80835.9569

bitrate=$(echo "scale=0;$a1 + $b1*$bitrate + $c1 * l($pframe_qp / 51) + $d11*e(-e1* $skipratio/ 100 )" | bc -l)

echo "{\"video\": \"$1\", \"estimated_bitrate_[kb/s]\": $bitrate }"



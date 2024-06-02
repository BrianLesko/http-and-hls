#!/bin/bash

#take your IP as an input
IP=$1
PORT=$2
# 1. start your http camera server, then

# 2. Run ffmpeg to create the HLS files

ffmpeg -i "http://$IP:$PORT" -y \
-c:v libx264 \
-preset veryfast \
-profile:v baseline \
-hls_time 2 \
-hls_list_size 3000 \
-hls_flags delete_segments \
-hls_start_number_source datetime \
-hls_segment_filename "./hls/file%d.ts" \
-force_key_frames "expr:gte(t,n_forced*2)" \
-f hls ./hls/index.m3u8

# 3. serve the HLS content on a web server

# view the hls content



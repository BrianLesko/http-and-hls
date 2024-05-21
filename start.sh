#!/bin/bash
cd /home/lesko/http-and-hls
source my_env/bin/activate
python3 start_http.py &
hls.sh &
docker start hls0

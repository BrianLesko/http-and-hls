#!/bin/bash
IP=192.168.129.60
cd /home/lesko/http-and-hls
source my_env/bin/activate
python3 start_http.py $IP &
./hls.sh $IP &
docker start hls0

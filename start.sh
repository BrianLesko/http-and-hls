#!/bin/bash
IP=192.168.129.60
PORT=8000
cd /home/lesko/http-and-hls
source my_env/bin/activate
python3 start_http.py $IP $PORT &
./hls.sh $IP $PORT &
docker start hls0

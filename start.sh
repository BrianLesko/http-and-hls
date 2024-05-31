#!/bin/bash
IP=192.168.129.60
PORT=8000
echo "Serving http live video at $IP:$PORT and hls on port 8001"
echo "remember to change the hls url in the index.html file"
kill $(lsof -t -i:$PORT)
cd /home/lesko/http-and-hls
source my_env/bin/activate
python3 start_http.py $IP $PORT &
./hls.sh $IP $PORT &
sed -i "s/PLACEHOLDER/$IP:$PORT/" ./index.html
python3 -m http.server 8001 --bind $IP

#!/bin/bash
IP=192.168.129.60
PORT=8000
PORT2=8001
echo "Serving http live video at $IP:$PORT and hls on port 8001"
echo "remember to change the hls url in the index.html file"
kill $(lsof -t -i:$PORT)
cd /home/lesko/http-and-hls
source my_env/bin/activate
python3 start_http.py $IP $PORT &
sleep 5
./hls.sh $IP $PORT &
sed -i "s/%%IP%%/$IP/g; s/%%PORT%%/$PORT2/g" ./index.html
python3 -m http.server $PORT2 --bind $IP

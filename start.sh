#!/bin/bash
IP=127.0.0.1  # IP address of the servers: 127.0.0.1 for local only access or 0.0.0.0 for network access
PORT=8000   # Port for the http server
PORT2=8001  # Port for the hls server
echo "Serving http live video at $IP:$PORT and hls on port $PORT2"
kill $(lsof -t -i:$PORT) # Kill port1 and port2
kill $(lsof -t -i:$PORT2)
cd $(dirname "$0")    # Change to the directory of this script
source my_env/bin/activate # activate the python environment
python3 start_http.py $IP $PORT & # start a http server with live video feed from video device 0
sleep 5     # wait for the server to start
./hls.sh $IP $PORT &        # start the hls server in the background, saves .ts files in ./hls
cp ./index_template.html ./index.html   # copy the template file to index.html
sed "s/%%IP%%/$IP/g; s/%%PORT%%/$PORT2/g" ./index.html > ./index_temp.html # replace the placeholders in the template file
mv ./index_temp.html ./index.html  # move the modified file back to index.html
python3 -m http.server $PORT2 --bind $IP    # start a http server to serve the index.html file for the hls content
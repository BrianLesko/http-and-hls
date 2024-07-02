
# HLS stream from http stream

Stream a camera and its sliding window history. This method has around 10 seconds of latency 

access via 127.0.0.1 or CORS policy prevents access

&nbsp;

## Dependencies

This code uses the following libraries:
- `ffmpeg`: for handling the live stream to video chunking HLS protocol
- `hls.js`: for serving the index.m3u8 file using html 5
- `opencv`: for the video capture device

&nbsp;

## Setup

1. create a python virtual environment using venv, activate it, make sure the python requirements are downloaded
```
python3 -m venv my_env
source my_env/bin/activate
pip install -r requirements.txt
```

2. install the javascript dependency with 
```
npm install
```

## Usage
1. Pick the scope of where you'll serve the video.

    a. local network. You want your video accessible my the local area network (wifi or wired).  
        - set the IP in start.sh to 0.0.0.0

    b. local only, on your device  
        - set the IP in start.sh to 127.0.0.1

2. run start.sh
```
./start.sh
```

&nbsp;

## About

HLS streaming was introduced by Apple and since its creation has been one of the most popular ways to stream video. It allows adaptive quality and low latency. The setup here is more cumbersome than a simple http live server, but allows viewing the history of the stream and allows the client to buffer content. Written by Brian Lesko for learning purposes. For other software projects related to robotics engineering, mechanical engineering, and software engineering see my other repositories. Currently working as a robotics engineer - 2024. 

&nbsp;

<hr>

&nbsp;

<div align="center">



╭━━╮╭━━━┳━━┳━━━┳━╮╱╭╮        ╭╮╱╱╭━━━┳━━━┳╮╭━┳━━━╮
┃╭╮┃┃╭━╮┣┫┣┫╭━╮┃┃╰╮┃┃        ┃┃╱╱┃╭━━┫╭━╮┃┃┃╭┫╭━╮┃
┃╰╯╰┫╰━╯┃┃┃┃┃╱┃┃╭╮╰╯┃        ┃┃╱╱┃╰━━┫╰━━┫╰╯╯┃┃╱┃┃
┃╭━╮┃╭╮╭╯┃┃┃╰━╯┃┃╰╮┃┃        ┃┃╱╭┫╭━━┻━━╮┃╭╮┃┃┃╱┃┃
┃╰━╯┃┃┃╰┳┫┣┫╭━╮┃┃╱┃┃┃        ┃╰━╯┃╰━━┫╰━╯┃┃┃╰┫╰━╯┃
╰━━━┻╯╰━┻━━┻╯╱╰┻╯╱╰━╯        ╰━━━┻━━━┻━━━┻╯╰━┻━━━╯
  


&nbsp;


<a href="https://twitter.com/BrianJosephLeko"><img src="https://raw.githubusercontent.com/BrianLesko/BrianLesko/f7be693250033b9d28c2224c9c1042bb6859bfe9/.socials/svg-white/x-logo-white.svg" width="30" alt="X Logo"></a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="https://github.com/BrianLesko"><img src="https://raw.githubusercontent.com/BrianLesko/BrianLesko/f7be693250033b9d28c2224c9c1042bb6859bfe9/.socials/svg-white/github-mark-white.svg" width="30" alt="GitHub"></a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="https://www.linkedin.com/in/brianlesko/"><img src="https://raw.githubusercontent.com/BrianLesko/BrianLesko/f7be693250033b9d28c2224c9c1042bb6859bfe9/.socials/svg-white/linkedin-icon-white.svg" width="30" alt="LinkedIn"></a>

follow all of these for pizza :)

</div>


&nbsp;



##################################################################
# Brian Lesko 
# 2/19/2024
# Serve a video stream from a webcam using OpenCV and Python's http.server
import http.server
import socketserver
import cv2
import io
import sys

IP = sys.argv[1]
PORT = int(sys.argv[2])
CAMERA = int(sys.argv[3])

class VideoStreamHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'multipart/x-mixed-replace; boundary=frame')
        self.end_headers()

        camera = cv2.VideoCapture(CAMERA)
        camera.set(cv2.CAP_PROP_FPS, 35) # FPS
        camera.set(cv2.CAP_PROP_FRAME_WIDTH, 1920)
        camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)
        camera.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc(*'MJPG')) # compression method

        try:
            while True:
                ret, frame = camera.read()
                if not ret:
                    break

                ret, jpeg = cv2.imencode('.jpg', frame)
                frame = jpeg.tobytes()

                self.wfile.write(b'--frame\r\n')
                self.send_header('Content-Type', 'image/jpeg')
                self.send_header('Content-Length', len(frame))
                self.end_headers()
                self.wfile.write(frame)
        except Exception as e:
            print("Stream stopped:", e)
        finally:
            camera.release()

Handler = VideoStreamHandler
with http.server.ThreadingHTTPServer((IP, PORT), Handler) as httpd:
    print("Serving at port", PORT)
    httpd.serve_forever()

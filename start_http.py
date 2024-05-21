##################################################################
# Brian Lesko 
# 2/19/2024
# Serve a video stream from a webcam using OpenCV and Python's http.server
import http.server
import socketserver
import cv2
import io

PORT = 8000

class VideoStreamHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'multipart/x-mixed-replace; boundary=frame')
        self.end_headers()

        cap = cv2.VideoCapture(0)

        try:
            while True:
                ret, frame = cap.read()
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
            cap.release()

Handler = VideoStreamHandler
with http.server.ThreadingHTTPServer(("192.168.129.65", PORT), Handler) as httpd:
    print("Serving at port", PORT)
    httpd.serve_forever()

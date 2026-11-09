#!/usr/bin/env python3
"""
Murphy web server: ye ek hi origin par
  - web app (index.html waghaira) serve karta hai, aur
  - /api/* ko Ollama (127.0.0.1:11434) tak pahunchata hai.
Isse browser ka CORS/connection block khatam ho jata hai.
Sirf Python ki built-in cheezein — koi install nahi.
"""
import http.server, socketserver, urllib.request, urllib.error, os, sys

OLLAMA = "http://127.0.0.1:11434"
PORT = int(os.environ.get("MURPHY_PORT", "8000"))
ROOT = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *a, **k):
        super().__init__(*a, directory=ROOT, **k)

    def log_message(self, *a):  # shaant raho
        pass

    def _proxy(self):
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length) if length else None
        url = OLLAMA + self.path
        req = urllib.request.Request(url, data=body, method=self.command)
        ct = self.headers.get("Content-Type")
        if ct:
            req.add_header("Content-Type", ct)
        try:
            with urllib.request.urlopen(req, timeout=600) as up:
                self.send_response(up.status)
                self.send_header("Content-Type", up.headers.get("Content-Type", "application/json"))
                self.end_headers()
                while True:
                    chunk = up.read(1024)
                    if not chunk:
                        break
                    try:
                        self.wfile.write(chunk); self.wfile.flush()
                    except (BrokenPipeError, ConnectionResetError):
                        return
        except urllib.error.URLError as e:
            self.send_response(502)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            msg = '{"error":"Ollama tak nahi pahuncha. Ollama app (menu bar mein llama) khula hai?"}'
            try: self.wfile.write(msg.encode())
            except Exception: pass

    def do_POST(self):
        if self.path.startswith("/api/"):
            self._proxy()
        else:
            self.send_error(404)

    def do_GET(self):
        if self.path.startswith("/api/"):
            self._proxy()
        else:
            super().do_GET()

class Server(socketserver.ThreadingMixIn, http.server.HTTPServer):
    daemon_threads = True

if __name__ == "__main__":
    try:
        srv = Server(("127.0.0.1", PORT), Handler)
    except OSError:
        print(f"Port {PORT} pehle se busy hai. Shayad Murphy pehle se khula hai: http://localhost:{PORT}")
        sys.exit(0)
    print(f"Murphy chal raha hai:  http://localhost:{PORT}")
    print("Band karne ke liye is window mein Ctrl+C.")
    srv.serve_forever()

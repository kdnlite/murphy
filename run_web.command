#!/bin/bash
# Murphy web app ko laptop par kholne wali file.
# Double-click karo — ye ek chhota local server chalu karke browser mein Murphy khol dega.
cd "$(dirname "$0")"

# Ollama chalu hai? (Murphy ka dimaag)
OLLAMA="/Applications/Ollama.app/Contents/Resources/ollama"
command -v ollama >/dev/null 2>&1 && OLLAMA="$(command -v ollama)"
if ! curl -s http://127.0.0.1:11434/api/version >/dev/null 2>&1; then
  echo "Ollama chalu kar raha hoon…"
  [ -x "$OLLAMA" ] && "$OLLAMA" serve >/tmp/ollama_murphy.log 2>&1 &
  sleep 2
fi

PORT=8000
echo "Murphy web app khul raha hai:  http://localhost:$PORT"
echo "Band karne ke liye is window mein Ctrl+C dabao."
# Browser khol do
( sleep 1; open "http://localhost:$PORT" ) &
# Local server (is folder ko serve karta hai)
python3 -m http.server $PORT

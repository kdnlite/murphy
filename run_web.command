#!/bin/bash
# Murphy ko browser mein kholne wali file. Double-click karo.
cd "$(dirname "$0")"
OLLAMA="/Applications/Ollama.app/Contents/Resources/ollama"
command -v ollama >/dev/null 2>&1 && OLLAMA="$(command -v ollama)"
if ! curl -s http://127.0.0.1:11434/api/version >/dev/null 2>&1; then
  echo "Ollama chalu kar raha hoon…"
  [ -x "$OLLAMA" ] && "$OLLAMA" serve >/tmp/ollama_murphy.log 2>&1 &
  sleep 2
fi
( sleep 1; open "http://localhost:8000" ) &
exec python3 murphy_server.py

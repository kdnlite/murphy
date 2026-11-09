#!/bin/bash
cd "$(dirname "$0")"
OLLAMA_BIN="/Applications/Ollama.app/Contents/Resources/ollama"
OLLAMA="$OLLAMA_BIN"; command -v ollama >/dev/null 2>&1 && OLLAMA="$(command -v ollama)"
curl -s http://127.0.0.1:11434/api/version >/dev/null 2>&1 || "$OLLAMA" serve >/tmp/ollama_murphy.log 2>&1 &
sleep 1
echo "Murphy se baat karo. Band karne ke liye likho: /bye"
exec "$OLLAMA" run murphy

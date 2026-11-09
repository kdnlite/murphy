#!/bin/bash
cd "$(dirname "$0")"
MODEL="qwen2.5:7b"
OLLAMA_BIN="/Applications/Ollama.app/Contents/Resources/ollama"
echo "========================================"
echo "   Murphy setup shuru"
echo "========================================"
if [ -x "$OLLAMA_BIN" ]; then OLLAMA="$OLLAMA_BIN"
elif command -v ollama >/dev/null 2>&1; then OLLAMA="$(command -v ollama)"
else echo "Ollama nahi mila. Pehle Applications se Ollama app khol lo, phir ye file dobara double-click karo."; read -p "Enter dabao..."; exit 1; fi
if ! curl -s http://127.0.0.1:11434/api/version >/dev/null 2>&1; then
  echo "Ollama server chalu kar raha hoon..."
  "$OLLAMA" serve >/tmp/ollama_murphy.log 2>&1 &
  for i in $(seq 1 30); do sleep 1; curl -s http://127.0.0.1:11434/api/version >/dev/null 2>&1 && break; done
fi
echo; echo "Base model download kar raha hoon ($MODEL, ~4.7 GB, sirf pehli baar)."
"$OLLAMA" pull "$MODEL" || { echo "Download fail. Internet check karo aur dobara chalao."; read -p "Enter..."; exit 1; }
echo; echo "Murphy bana raha hoon..."
"$OLLAMA" create murphy -f Murphy.modelfile || { echo "Murphy banane mein dikkat."; read -p "Enter..."; exit 1; }
echo; echo "Ho gaya! Murphy taiyaar hai. Ab run_web.command double-click karo."
read -p "Band karne ke liye Enter dabao..."

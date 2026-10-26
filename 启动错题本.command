#!/bin/bash
cd "$(dirname "$0")"
PORT=8123
if ! lsof -iTCP:$PORT -sTCP:LISTEN -nP >/dev/null 2>&1; then
  nohup python3 -m http.server $PORT >/tmp/cuoti-server.log 2>&1 &
  sleep 1
fi
open "http://localhost:$PORT"

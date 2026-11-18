#!/bin/bash
cd "$(dirname "$0")"
echo "Starting the site at http://localhost:8080  (press Ctrl+C to stop)"
( sleep 1; open http://localhost:8080 2>/dev/null || xdg-open http://localhost:8080 2>/dev/null ) &
python3 -m http.server 8080

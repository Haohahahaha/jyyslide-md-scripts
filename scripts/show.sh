#!/usr/bin/env bash

PORT=8080
NAME="$1"

DOC_DIR="$MYSLIDE_HOME/docs/$NAME"
PAGE_DIR="$MYSLIDE_HOME/pages/$NAME"

if [ -z "$NAME" ]; then
  echo "[PPT Show] Usage: slide-dev <name>"
  exit 1
fi

echo "[PPT Show] Initial build..."
$MYSLIDE_SCRIPT/gen.sh "$1"

echo "[PPT Show] Starting preview: http://localhost:$PORT/index.html"
(cd "$PAGE_DIR" && live-server --port=$PORT --no-browser --quiet) &

echo "[PPT Show] Watching markdown changes..."
while inotifywait -e close_write "$DOC_DIR"/*.md; do
  echo "[PPT Genarate] Rebuilding..."
  $MYSLIDE_SCRIPT/gen.sh "$1"
done

echo "[PPT Show] Initial build..."

# Old Version
# firefox $MYSLIDE_HOME/pages/$1/index.html
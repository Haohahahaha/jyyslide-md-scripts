#!/usr/bin/env bash

PORT=8080
DIR="$MYSLIDE_HOME/pages/$1"

if [ -z "$1" ]; then
  echo "Usage: slide-preview <page>"
  exit 1
fi

if [ ! -d "$DIR" ]; then
  echo "Directory not found: $DIR"
  exit 1c
fi

echo "Preview: http://localhost:$PORT/index.html"
cd "$DIR"

npx --yes live-server \
  --port=$PORT \
  --no-browser \
  --quiet


# Old Version
# firefox $MYSLIDE_HOME/pages/$1/index.html
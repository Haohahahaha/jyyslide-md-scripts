#!/usr/bin/env bash

PORT=8080
NAME="$1"

DOC_DIR="$MYSLIDE_HOME/docs/$NAME"
PAGE_DIR="$MYSLIDE_HOME/pages/$NAME"

if [ -z "$NAME" ]; then
  echo "Usage: slide-dev <name>"
  exit 1
fi

echo "Initial build..."
$MYSLIDE_SCRIPT/gen.sh "$1"

echo "Starting preview: http://localhost:$PORT/index.html"
(cd "$PAGE_DIR" && live-server --port=$PORT --no-browser --quiet) &

echo "Watching markdown changes..."
while inotifywait -e close_write "$DOC_DIR"/*.md; do
  echo "Rebuilding..."
  $MYSLIDE_SCRIPT/gen.sh "$1"
done

#!/usr/bin/env bash

# PORT=8080
# DIR="$MYSLIDE_HOME/pages/$1"

# if [ -z "$1" ]; then
#   echo "Usage: slide-preview <page>"
#   exit 1
# fi

# if [ ! -d "$DIR" ]; then
#   echo "Directory not found: $DIR"
#   exit 1c
# fi

# echo "Preview: http://localhost:$PORT/index.html"
# cd "$DIR"

# npx --yes live-server \
#   --port=$PORT \
#   --no-browser \
#   --quiet


# Old Version
# firefox $MYSLIDE_HOME/pages/$1/index.html
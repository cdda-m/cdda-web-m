#!/bin/bash
set -e

RELEASE_TAG="${1:-latest}"
CDDA_REPO="apkile78/Cataclysm-DDA-web-m-0.I"
SOURCE_DIR="cdda-source"

echo "Fetching CDDA release: $RELEASE_TAG"

# Extract base tag from iteration tags (e.g., 0.I-build2 -> 0.I)
BASE_TAG=$(echo "$RELEASE_TAG" | sed 's/-build.*$//')
echo "Base CDDA release tag: $BASE_TAG"

# Clean up previous source
if [ -d "$SOURCE_DIR" ]; then
  echo "Removing previous source directory..."
  rm -rf "$SOURCE_DIR"
fi

# Create source directory
mkdir -p "$SOURCE_DIR"
cd "$SOURCE_DIR"

if [ "$BASE_TAG" = "latest" ]; then
  echo "Fetching latest stable Ito release..."
  # Get the latest stable Ito tag (simple format like 0.I)
  LATEST_TAG=$(git ls-remote --tags https://github.com/${CDDA_REPO}.git | grep -E 'refs/tags/0\.[A-Z]$' | sort -V | tail -n1 | sed 's/.*\///')
  echo "Latest stable Ito tag: $LATEST_TAG"
  BASE_TAG="$LATEST_TAG"
fi

# Branch of your fork to build (override with the workflow's release_tag input)  
CDDA_BRANCH="${CDDA_BRANCH:-mp-dev}"  
  
echo "Cloning ${CDDA_REPO} branch ${CDDA_BRANCH}..."  
git clone --depth 1 --branch "$CDDA_BRANCH" \  
  "https://github.com/${CDDA_REPO}.git" "$SOURCE_DIR"  
  
echo "Source fetched successfully to: $SOURCE_DIR"
  
echo "Source fetched successfully to: $SOURCE_DIR"

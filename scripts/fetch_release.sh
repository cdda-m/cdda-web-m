#!/bin/bash  
set -e  
  
RELEASE_TAG="${1:-latest}"  
CDDA_REPO="apkile78/Cataclysm-DDA-web-m-0.I"   # your private fork  
SOURCE_DIR="cdda-source"  
  
# Branch of your fork to build  
CDDA_BRANCH="${CDDA_BRANCH:-mp-dev}"  
  
echo "Fetching CDDA release: $RELEASE_TAG"  
  
# Clean up previous source (git clone needs a non-existent target)  
if [ -d "$SOURCE_DIR" ]; then  
  echo "Removing previous source directory..."  
  rm -rf "$SOURCE_DIR"  
fi  
  
echo "Cloning ${CDDA_REPO} branch ${CDDA_BRANCH}..."  
git clone --depth 1 --branch "$CDDA_BRANCH" "https://x-access-token:${FORK_TOKEN}@github.com/${CDDA_REPO}.git" "$SOURCE_DIR"  
  
echo "Source fetched successfully to: $SOURCE_DIR"

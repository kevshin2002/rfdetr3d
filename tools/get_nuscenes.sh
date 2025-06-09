#!/bin/bash
set -e

# Usage: ./get_nuscenes.sh [target_dir]
TARGET_DIR=${1:-"./data/nuscenes"}
VERSION="v1.0-trainval"
BASE_URL="https://www.nuscenes.org/public/${VERSION}"

echo "[INFO] Creating target directory: ${TARGET_DIR}"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Camera zip files needed for DETR3D
CAM_FILES=(
  "samples/CAM_BACK"
  "samples/CAM_BACK_LEFT"
  "samples/CAM_BACK_RIGHT"
  "samples/CAM_FRONT"
  "samples/CAM_FRONT_LEFT"
  "samples/CAM_FRONT_RIGHT"
)

for cam_path in "${CAM_FILES[@]}"; do
  ZIP_NAME="$(basename $cam_path).zip"
  DEST_DIR="$TARGET_DIR/$cam_path"
  FILE_URL="https://www.nuscenes.org/data/${VERSION}/${ZIP_NAME}"

  echo "[INFO] Downloading ${ZIP_NAME} from:"
  echo "       $FILE_URL"

  wget -nc -O "${ZIP_NAME}" "$FILE_URL"

  echo "[INFO] Unzipping ${ZIP_NAME} to ${DEST_DIR}"
  mkdir -p "$DEST_DIR"
  unzip -q "${ZIP_NAME}" -d "$DEST_DIR"
done

# Metadata archive
META_URL="https://www.nuscenes.org/data/${VERSION}/${VERSION}_meta.tgz"
META_NAME="${VERSION}_meta.tgz"

echo "[INFO] Downloading metadata..."
wget -nc -O "$META_NAME" "$META_URL"

echo "[INFO] Extracting metadata..."
tar -xzf "$META_NAME"

echo "[DONE] nuScenes camera and metadata ready in ${TARGET_DIR}"


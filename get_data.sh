#!/bin/bash

set -e

DATASET=$1

if [ -z "$DATASET" ]; then
  echo "Usage: ./get_data.sh [kitti|nuscenes]"
  exit 1
fi

if [ "$DATASET" = "kitti" ]; then
  DATA_DIR=./data/kitti
  if [ ! -d "$DATA_DIR" ]; then
    echo "KITTI dataset not found. Downloading..."
    bash tools/get_kitti.sh
  fi
  echo "Running KITTI data prep..."
  PYTHONPATH=. python tools/create_data.py kitti \
    --root-path "$DATA_DIR" \
    --out-dir "$DATA_DIR" \
    --extra-tag kitti \
    --with-plane

elif [ "$DATASET" = "nuscenes" ]; then
  DATA_DIR=./data/nuscenes
  if [ ! -d "$DATA_DIR" ]; then
    echo "nuScenes dataset not found. Downloading..."
    bash tools/get_nuscenes.sh
  fi
  echo "Running nuScenes data prep..."
  PYTHONPATH=. python tools/create_data.py nuscenes 
\
    --root-path "$DATA_DIR" \
    --out-dir "$DATA_DIR" \
    --extra-tag nuscenes \
    --version v1.0 \
    --max-sweeps 10


else
  echo "Unknown dataset: $DATASET"
  echo "Usage: ./run.sh [kitti|nuscenes]"
  exit 1
fi


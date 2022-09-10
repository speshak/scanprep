#!/bin/bash -xe

INPUT_DIR=/input
OUTPUT_DIR=/output

while true; do
    for INPUT_FILE in "$INPUT_DIR"/*.pdf
    do
      if [ -f "$INPUT_FILE" ]; then
        scanprep "$INPUT_FILE" "$OUTPUT_DIR"
        rm "$INPUT_FILE"
      fi
    done

  sleep 120
done

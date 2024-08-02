#!/bin/bash
# This script will generate the protobuf javascript files

DOT="$(cd "$(dirname "$0")"; cd ../; pwd)"

INPUT_PATH="$DOT/proto"

find "$DOT/packages" -mindepth 1 -maxdepth 1 -type d | while IFS= read -r PACKAGE_PATH; do
    PACKAGE_NAME=$(basename "$PACKAGE_PATH")
    OUTPUT_PATH="$PACKAGE_PATH/generated/proto"
    PROTOC_GEN_TS_PATH="$DOT/node_modules/ts-proto/protoc-gen-ts_proto"

    # Make the required directories
    rm -rf "$OUTPUT_PATH"
    mkdir -p "$OUTPUT_PATH"

    # Build the proto files
    protoc \
    --plugin=$PROTOC_GEN_TS_PATH \
    --ts_out $OUTPUT_PATH \
    --proto_path $INPUT_PATH $INPUT_PATH/*.proto \

    echo "Protos generated for package: $PACKAGE_NAME"
done
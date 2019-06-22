#!/bin/bash

set -xe
env

mkdir userprog
cp -r example/* userprog
cp "$OUTPUT_DIR/node-red_linux-$ARCH" userprog/node-red
chmod +x userprog/node-red
cd userprog|| exit 1;
tar czvf "$OUTPUT_DIR/tp-node-red-$ARCH.tar.gz" .

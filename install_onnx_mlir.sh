#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "need root."
  exit 1
fi

cp /etc/environment /etc/environment.bak
mkdir -p /workdir/llvm-project/build/bin

systemctl start docker.service docker.socket

CONTAINER_ID=$(docker run -it --name mlir --rm --detach onnxmlirczar/onnx-mlir)

docker cp $CONTAINER_ID:/usr/local/bin/ /usr/local/
docker cp $CONTAINER_ID:/usr/local/lib/ /usr/local/

find /usr/local/bin -maxdepth 1 -type f ! -name 'onnx-mlir' -exec mv {} /workdir/llvm-project/build/bin/ \;

docker system prune

PATH="/usr/local/bin:$PATH"
echo "need to append /usr/local/bin to environmental variables"

LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
echo "need to append /usr/local/lib to environmental variables"

echo 'installed probably'

#!/bin/sh

set -e

if [ ! -f "podman" ]; then
    alias docker=podman
fi

export GOVERSION="go1.15.6.linux-amd64"

if [ ! -f "$GOVERSION.tar.gz" ]; then
    wget https://golang.org/dl/$GOVERSION.tar.gz
fi
tar xvzf $GOVERSION.tar.gz

docker build -t temp:latest .
docker run \
	--name=temp \
	--detach \
	--interactive \
	--tty \
	--rm \
	--volume $PWD/hello-world:/go/src/hello-world \
	--entrypoint=bash \
	temp:latest 

docker exec temp /go/bin/go build -o /hw hello-world
docker cp temp:/hw ./hw
docker stop temp
rm -rf go*

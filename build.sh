#!/bin/bash

if [ -z "$VERSION" ]; then
    echo "No version supplied"
    exit 1
fi

docker build --build-arg version=$VERSION -t currencybot:deb-build . && \
docker create --name deb currencybot:deb-build && \
docker cp deb:/currencybot-$VERSION.deb ./currencybot-$VERSION.deb && \
docker rm -f deb

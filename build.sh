#!/bin/bash

set -ex 

rm -rf ./pkgroot || true

mkdir -p ./pkgroot/usr/local/bin
GOOS=darwin GOARCH=amd64 go build -o ./bandcamper_amd64
GOOS=darwin GOARCH=arm64 go build -o ./bandcamper_arm64
lipo -create -output bandcamper bandcamper_amd64 bandcamper_arm64
mv bandcamper ./pkgroot/usr/local/bin/
rm bandcamper_amd64 bandcamper_arm64

mkdir -p ./pkgroot/Applications
osacompile -o Bandcamper.app bandcamper.scpt
mv Bandcamper.app ./pkgroot/Applications/

pkgbuild 	\
 --root ./pkgroot \
 --identifier com.fibonacid.bandcamper \
 --version 1.0.0 \
 --install-location / \
 --ownership recommended \
 ./bandcamper-1.0.0.pkg





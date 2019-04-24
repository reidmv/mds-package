#!/bin/sh

name="mds-package"
version="1.0.0"
prefix="/usr/local/bin"

fpm \
  -n "$name" \
  -v "$version" \
  -s dir \
  -t rpm \
  -C "$(dirname $0)/bin" \
  --prefix "$prefix"

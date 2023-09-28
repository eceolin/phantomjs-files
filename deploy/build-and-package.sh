#!/usr/bin/env bash

cd `dirname $0`/..

echo "Building Qt and PhantomJS with debugging symbols. If you have previously" \
     "built without debugging symbols, you should run:"
echo
echo "    $ git clean -xdff"
echo

# This incantation will cause Qt and WebKit and PhantomJS to all build in "release"
# mode, with compiler optimisations, but also with debug symbols. (We will strip the
# symbols in package.sh.)
CFLAGS=-g CXXFLAGS=-g ./build.sh --confirm --qt-config '-webkit-debug' --qmake-args "QMAKE_CFLAGS=-g QMAKE_CXXFLAGS=-g" || exit 1

# Package the release tarball
rm deploy/*.tar.bz2 2>/dev/null
./deploy/package.sh || exit 1

echo "PhantomJS built and packaged:"
echo
cd deploy
ls -1 *.tar.bz2

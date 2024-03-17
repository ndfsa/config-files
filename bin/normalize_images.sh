#!/bin/bash

mkdir normalized
mkdir original
mv *.* original/

cd original
/bin/ls | \
    parallel -j 8 magick mogrify \
        -define webp:lossless=true \
        -format webp \
        -distort Resize "2560x1440^" \
        -alpha off \
        -path ../normalized

cd ../normalized

img-cmp rename *
cd ..

#!/bin/bash

name=$1

ghc ./sineWave.hs

./sineWave >> "$name.raw"
sox -b 16 -e signed-integer --endian little -r 44100 "$name.raw" "$name.wav"



#!/usr/bin/env bash

# Generate a tone of specified frequency
ffmpeg -f lavfi -i "sine=frequency=$1:sample_rate=44100:duration=0.1" -c:a pcm_s16le Tone-$1.wav

# Fadein and Fadeout
ffmpeg -i Tone-$1.wav -af 'afade=t=in:ss=0:d=0.01,afade=t=out:st=0.09:d=0.01' Output-$1.wav

# Exit
exit
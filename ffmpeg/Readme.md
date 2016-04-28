# ffmpeg

1. `giffify.sh` - [Giffify], easily create optimised GIFs from a video
2. `ffmpeg_gen_sine_tone.sh` - Generate a tone of certain frequency using ffmpeg
    ```bash
    ./ffmpeg_gen_sine_tone.sh <frequency>

    ```
3. Convert wav to mp3, lossless
    ```bash
    ./ffmpeg -i input.wav -codec:a libmp3lame -q:a 0 output.mp3

    ```
4. Convert mp4 to webm
    1. Install ffmpeg with webm suppport
        ```bash
        ./ffmpeg -i input.wav -f mp2 output.mp3

        ```
    2. Convert to webm
        ```bash
        ./ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm

        ```
5. Extract audio from any video file
    ```bash
    ./ffmpeg -i "whatever.format" -vn -ac 2 -ar 44100 -ab 320k -f mp3 output.mp3

    ```


License
=======

    Copyright 2016 Nishant Srivastava

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


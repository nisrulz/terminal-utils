#macosx

1. Open finder at place from terminal
    ```bash
    open .

    ```
2. Command to change the destination folder to save your screenshots in mac
    ```bash
    defaults write com.apple.screencapture location ~/Pictures/Screenshots
    killall SystemUIServer

    ```
3. `stop_android_filetransfer_popup.sh` - Stop the auto popup of Android FileTransfer Window when you plug in your device

4. Get DSA public key of system
    ```bash
    #More info at : https://help.github.com/articles/generating-ssh-keys/
    cat ~/.ssh/id_dsa.pub
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


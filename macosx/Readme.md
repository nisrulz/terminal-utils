# macOSX

1. Open finder at place from terminal
    ```bash
    open .

    ```
1. Command to change the destination folder to save your screenshots in mac
    ```bash
    defaults write com.apple.screencapture location ~/Pictures/Screenshots
    killall SystemUIServer

    ```
1. `stop_android_filetransfer_popup.sh` - Stop the auto popup of Android FileTransfer Window when you plug in your device

1. Get DSA public key of system
    ```bash
    #More info at : https://help.github.com/articles/generating-ssh-keys/
    cat ~/.ssh/id_dsa.pub
    
    ```
1. Disable Google Chrome’s Two-Finger Swipe Navigation
    ```bash
    defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE
    
    ```
1. Make your mac os talk
    ```bash
    say "This Mac runs OS X, not OS ex"
    
    ```
1. Make your mac os read(verbally) a text file
    ```bash
    say -f /path/to/file.txt
    
    ```
1. Get External IP
    ```bash
    curl ipecho.net/plain; echo
    
    ```
1. Get network ip
    ```bash
    ipconfig getifaddr en0
    
    ```
1. Test network connectivity
    ```bash
    ping -c 10 www.google.com
    
    ```
### Aliases

How to setup these aliases
- Copy-Paste these alias inside your `.bashrc` or `.zshrc`
- Save.
- Goto terminal and execute `source ~/.bashrc` or `source ~/.zshrc`.
- Done, now simply call the alias to execute the command as defined.

```bash
# ------------------ Shell ---------------- #
# Get default/current shell name
alias currentShell="echo $0 | cut -d '-' -f 2"

# Reset/Reload your current/default shell 
alias resetTerminal="exec $(currentShell)"

# Open the default shell's rc file for defining configuration 
alias shellConfig="code ~/.$(currentShell)rc"
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


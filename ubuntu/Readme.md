# Ubuntu

1. Open finder at place from terminal
    ```bash
    nautilus .
    ```
    > nautilus is the default finder for Ubuntu. Replace with your own if you have another setup.

1. Get External IP
    ```bash
    curl ipecho.net/plain; echo
    ```
1. Test network connectivity
    ```bash
    ping -c 10 www.google.com
    ```
1. Find all sub-directories with name "build"
    ```bash
    find **/build/
    ```
    > To delete all sub-directories with name "build", replace the command `find ` with `rm -rf` 


# Aliases

How to setup these aliases
- Copy-Paste these alias inside your `.bashrc` or `.zshrc`
- Save.
- Goto terminal and execute `source ~/.bashrc` or `source ~/.zshrc`.
- Done, now simply call the alias to execute the command as defined.

```bash
# ------------------ Ubuntu ---------------- #
alias logout="gnome-session-quit"
alias shutdown='dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" boolean:true'
alias lock="gnome-screensaver-command -l"
alias resetTerminal="source ~/.zshrc"
alias hibernate="sudo pm-hibernate"
alias open="nautilus ./"
alias editGRUB="sudo gedit /etc/default/grub"
alias updateGRUB="sudo update-grub"
alias externalIP='curl ipecho.net/plain; echo'
alias pingNetwork='ping -c 10 www.google.com'

# ------------------ Budgie DE ---------------- #
alias resetBudgiePanelConfig="budgie-panel --reset --replace &!"
alias restartBudgie="nohup budgie-panel --replace&"

# ------------------ SSH ------------------ #
#More info at : https://help.github.com/articles/generating-ssh-keys/
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias getsshkey='cat ~/.ssh/id_rsa.pub'
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


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

1. Change the default location of where screenshots are saved in Ubuntu
    ```bash
    gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Pictures/Screenshots"
    ```

1. Set default terminal to Gnome terminal in Ubuntu
    ```bash
    gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
    ```

1. Find out default shell being used in terminal 
    ```bash
    echo $SHELL
    ```
1. Make `zsh` as your default shell in terminal 
    ```bash
    chsh -s $(which zsh)
    ```

1. Store the output of a command in a variable
    ```bash
    variable_name=$(command [option ...] arg1 arg2 ...)
    ```
    > Example:
    >
    > To print the current logged in user with headings. execute:
    >
    > CURRENT_USER=$(who -H) && echo $CURRENT_USER

1. Iterate over the output of a command and then run another command on each
    ```bash
    for f in $(command); do echo $f; done
    ```

1. Execute in background any command/script by adding `&` after a space
    ```bash
    ./myscript &
    ```
1. Bash alias does not directly accept parameters, however, creating an alias that accepts parameters is as simple as creating a function.
    
    To do this, simply create the function which encapsulates all the commands in order, inside the shell's .rc file i.e  `~/.zshrc` or `~/.bashrc`
    ```bash
    myFunction(){
        # You can use parameters $1, $2, $3, etc, 
        # or just put them all with $@
        mv "$1" "$1.bak"
        cp "$2" "$2.bak"
    }
    ```
    Once defined, simply restart your shell by calling `exec zsh`
    Now call this function as if it was an `alias`, since the defined function is available as a command
    ```bash
    $ myFunction original.txt other.txt
    ```
    
### Aliases

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
alias updateAllPackages='sudo apt autoclean && sudo apt autoremove && sudo apt full-upgrade'

# ------------------ Budgie DE ---------------- #
alias resetBudgiePanelConfig="budgie-panel --reset --replace &!"
alias restartBudgie="nohup budgie-panel --replace&"

# ------------------ ZSH ------------------ #
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code  ~/.oh-my-zsh"

# ------------------ SSH ------------------ #
# More info at : https://help.github.com/articles/generating-ssh-keys/
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias getsshkey='cat ~/.ssh/id_rsa.pub'

# ------------------ Misc ------------------ #
# Get rid of command not found
alias cd..='cd ../'
# Quick way to get out of current directory
alias ..='cd ../'
alias .='cd ./'

# Make mount command output pretty and human readable format
alias mount='mount |column -t'

# Print the Path variable value
alias path='echo -e ${PATH//:/\\n}'

# Print current time/date
alias now='date "+%c"'
alias nowtime='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Play video files in a current directory
alias playMpg='mplayer *.mpg'
alias vlc='vlc *.mpg'
 
# Play all music files from the current directory
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
 
# Shuffle mp3/ogg etc by default
alias music='mplayer --shuffle *'

# Get system memory, cpu usage, and gpu memory info quickly
alias meminfo='free -m -l -t'
 
# Get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
# Get top process eating CPU
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get CPU info
alias cpuinfo='lscpu'

```
### Scripts
1. [fix_hibernate_ubuntu](fix_hibernate_ubuntu): Fix hibernation issue in Ubuntu OS
1. [color_graph](color_graph): Display a nice color bar chart in terminal
1. [autoscript](autoscript): Automate the bash script creation process via a simple command. 

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


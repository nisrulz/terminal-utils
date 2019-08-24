# Ubuntu

1. Open finder at place from terminal
    ```bash
    xdg-open .
    ```
    > If the above command doesn't work, then use `nautilus` or `gnome-open` in place of `xdg-open`.

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
    function myFunction(){
        # You can use parameters $1, $2, $3, etc, 
        # or just put them all with $@
        mv "$1" "$1.bak"
        cp "$2" "$2.bak"
    }
    ```
    Once defined, simply restart your shell by calling `exec zsh`
    Now call this function as if it was an `alias`, since the defined function is available as a command
    ```bash
    myFunction original.txt other.txt
    ```
1. Pass output of one command to another
    ```bash
    command1 | xargs -I{} command2 {}
    ```
    > Pass output of command1 through xargs using substitution (the braces, `{}`) to command2.

    For example,
    
    Execute: `echo "Hello" | xargs -I{} echo "{} World"`

    Result: `Hello World`

1. Check name of your default shell
    ```bash
    echo $0
    ```
    You should get the below values:
    - `sh`: Bourne shell
    - `bash`: Bourne-Again shell
    - `zsh`: Z shell
    - `ksh`: Korn Shell
    - `tcsh`: TENEX C shell
    - `csh`: C shell
    - `ash`: Almquist shell
    - `dash`: Debian Almquist shell

    [[Read more](https://en.wikipedia.org/wiki/Unix_shell)]

1. Check the name of your default os
    ```bash
    echo $OSTYPE
    ```
    You should get the below values:
    - `linux-gnu`: GNU Linux
    - `darwin`: Mac OSX
    - `cygwin`: POSIX compatibility layer and Linux environment emulation for Windows (Cygwin)
    - `msys`: Lightweight shell and GNU utilities compiled for Windows (part of MinGW, on Windows for Git Bash/msysGit)
    - `freebsd`: FreeBSD

    **Bonus**

    If you would like to execute a command based on which OS your shell is running on, use below:
    ```bash
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # ...
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
    elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
        #FreeBSD
    else
        # Unknown.
    fi
    ```
    Also checkout the [config.guess](https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob;f=config.guess;hb=HEAD) shell script that is more concrete script.
    
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
alias hibernate="sudo pm-hibernate"
alias editGRUB="sudo gedit /etc/default/grub"
alias updateGRUB="sudo update-grub"
alias externalIP='curl ipecho.net/plain; echo'
alias pingNetwork='ping -c 10 www.google.com'
alias updateAllPackages='sudo apt autoclean && sudo apt autoremove && sudo apt full-upgrade'

# ------------------ Finder Application ---------------- #
# When using:
#     - GNOME, use 'gnome-open'
#     - Budgie, use 'nautilus'
#     - any other if you have a different DE and finder application
alias defaultFinderApplication="nautilus"

# Open function to open the Nautilus Finder GUI from terminal by passing the path
# Use as: open ./ 
function open(){
  PASSED_PATH=$1

  # Validate the passed path. If it is empty or just '.'
  # Then translate to './' for current directory
  
  if [ -z "$PASSED_PATH" ]; then
    # Empty paramter, translate to './'
    PASSED_PATH="./"
  fi

  if [[ "$PASSED_PATH" == "." ]]; then
    # String has only '.', translate to './'
    PASSED_PATH="./"
  fi
  
  
  if $(xdg-open $PASSED_PATH); then
    # Default finder application was found and 
    # the command completed successfully
  else
    # Default finder application was NOT found
    # switch to using user specified finderapplication command
      # nohup : Used to but the command in background and detach from current terminal
    # nautilus: Finder application for Ubuntu
    #
    # 1>/dev/null 2>&1 : No output when executing
    # - `1>/dev/null` redirects standard output (1) to /dev/null, which discards it.
    # - `2>&1` redirects standard error (2) to standard output (1), 
    #   which then discards it as well since standard output has already been redirected.
    nohup $(defaultFinderApplication) "$PASSED_PATH" 1>/dev/null 2>&1 ;
  fi
}

# -------------- GREP Tool Config --------- #

# Enable colored output in grep and similar tools
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Set color as per the table
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
# This sets the color to blue for output of grep
export GREP_COLOR='1;34'

# ------------------ Shell ---------------- #
# Get default/current shell name
function currentShell(){
  local CURRENT_SHELL_NAME=$SHELL;

  if [[ "$CURRENT_SHELL_NAME" == "-"* ]]; then
    # Returned name is of type: -bash
    # Sanitize the result by removing "-"
    CURRENT_SHELL_NAME=$(echo $CURRENT_SHELL_NAME | cut -d '-' -f 2);
  fi

  if [[ "$CURRENT_SHELL_NAME" == "/usr/bin/"* ]]; then
    # Returned name is of type: /usr/bin/bash
    # Sanitize the result by removing "/usr/bin/"
    CURRENT_SHELL_NAME=$(echo $CURRENT_SHELL_NAME | awk -F'/' '{print $4}');
  fi

  echo $CURRENT_SHELL_NAME;  
}

# Reset/Reload your current/default shell 
alias resetTerminal="exec $(currentShell)"

# Open the default shell's rc file for defining configuration 
alias shellConfig="code ~/.$(currentShell)rc"

# ------------------ ZSH ------------------ #
alias ohmyzsh="code  ~/.oh-my-zsh"

# Enable syntax highlighting in zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------ Budgie DE ---------------- #
alias resetBudgiePanelConfig="budgie-panel --reset --replace &!"
alias restartBudgie="nohup budgie-panel --replace&"

# ------------------ SSH ------------------ #
# More info at : https://help.github.com/articles/generating-ssh-keys/
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias getsshkey='cat ~/.ssh/id_rsa.pub'

# ------------------ PATH ------------------ #

# >>>>> Flutter
FLUTTER_SDK="$HOME/sdks/flutter/bin"
DART_SDK="/usr/lib/dart/bin"
# Add all to the path
export PATH="$PATH:$FLUTTER_SDK:$DART_SDK"

# >>>>> Java
# Java
export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"

# >>>>> Android (Linux)
# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export NDK=$ANDROID_HOME/ndk-bundle/
# Path to Android tools (apkanalyzer, avdmanager, monkeyrunner, etc)
export ANDROID_TOOLS="$ANDROID_HOME/tools/bin"
# Path to Android platform tools
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
# Add all to the path
export PATH=$PATH:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS

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


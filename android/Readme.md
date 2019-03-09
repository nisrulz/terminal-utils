# android

1. Method count of multidex APK one-liner
    ```bash
    apk=app.apk count=0 ; for dex in $(unzip -Z1 $apk classes*.dex); do count=$(($count + $(unzip -p $apk $dex | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"'))) ; done ; echo $count

    ```
1. Get verbose information regarding the apk
    ```bash
    aapt dump badging myapp.apk 
    ```


# Aliases

How to setup these aliases
- Copy-Paste these alias inside your `.bashrc` or `.zshrc`
- Save.
- Goto terminal and execute `source ~/.bashrc` or `source ~/.zshrc`.
- Done, now simply call the alias to execute the command as defined.

```bash

# ------------------ Android --------------- #
alias aapt2="$ANDROID_HOME/build-tools/28.0.3/aapt2"

# Misc ADB aliases
alias screenshot="adb exec-out screencap -p > screen-$(date -d 'now' "+%s").png"
alias startintent="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell am start $1"
alias rmapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X uninstall $1"
alias clearapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell pm clear $1"

# Stress test the debug apk with 100000 ui events
# Execute at the root of your android project
# Usage: stressTestDebugApk
# alias stressTestApk="adb shell monkey -p `aapt dump badging ./app/build/outputs/apk/debug/app-debug.apk | grep -e 'package: name' | cut -d \' -f 2` 100000"


# Demo Mode : https://android.googlesource.com/platform/frameworks/base/+/master/packages/SystemUI/docs/demo_mode.md
# Enable Demo Mode on your device
# Usage: enableDemoMode
alias enableDemoMode="adb shell settings put global sysui_demo_allowed 1 && adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200 && adb shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false && adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false && adb shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100"

# Disable Demo Mode on your device
# Usage: disableDemoMode
alias disableDemoMode="adb shell am broadcast -a com.android.systemui.demo -e command exit"

# Get package name from the debug apk
# Usage: getPackageName
# alias getPackageName="aapt dump badging ./app/build/outputs/apk/debug/app-debug.apk | grep -e 'package: name' | cut -d \' -f 2"

# Install and Grant all permissions for an apk
# Usage: grantAllPermissionsForApk path/to/apk/Application.apk
alias grantAllPermissionsForApk="adb install -g $1"

# Install APK to device
# Use as: apkinstall app-debug.apk
alias apkinstall="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X install -r $1"

# As an alternative to apkinstall, you can also do just ./gradlew installDebug
# Alias for building and installing the apk to connected device
# Run at the root of your project
# $ buildAndInstallApk
alias buildAndInstallApk='./gradlew uninstallAll installDebug'

# Launch your debug apk on your connected device
# Execute at the root of your android project
# Usage: launchDebugApk
# alias launchDebugApk="adb shell monkey -p `aapt dump badging ./app/build/outputs/apk/debug/app-debug.apk | grep -e 'package: name' | cut -d \' -f 2` 1"

# Single command to build+install+launch apk
# 
# Note: Here I am building, installing and launching the debug apk which is usually in the path: `./app/build/outputs/apk/debug/app-debug.apk` 
# when this command is executed from the root of the project
# If you would like to install and run any other apk, simply replace the path for debug apk with path of your own apk
# 
# Execute at the root of your android project
# Use as: buildInstallLaunchDebugApk
alias buildInstallLaunchDebugApk="buildAndInstallApk && launchDebugApk"

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


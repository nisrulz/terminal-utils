# Android

1. Method count of multidex APK one-liner
    ```bash
    apk=app.apk count=0 ; for dex in $(unzip -Z1 $apk classes*.dex); do count=$(($count + $(unzip -p $apk $dex | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"'))) ; done ; echo $count

    ```
1. Get verbose information regarding the apk
    ```bash
    aapt dump badging myapp.apk 
    ```
1. Know what alarm has been set, how many times this alarm has been invoked, when are they going to alarmed and interval.
    ```bash
    ./adb shell dumpsys alarm | grep 'com.yourpacakage.name'

    ```
1. Get battery info
    ```bash
    ./adb shell dumpsys battery | cat > ~/Documents/myapp-battery.txt
    ```

1. Get  cpu info
    ```bash
    ./adb shell dumpsys cpuinfo | cat > ~/Documents/myapp-cpuinfo.txt
    ```

1. Get fulldump info
    ```bash
    ./adb shell dumpsys | cat > ~/Documents/myapp-fulldump.txt
    ```

1. Get memory info
    ```bash
    ./adb shell dumpsys meminfo 'com.example.myapp'| cat > ~/Documents/myapp-meminfo.txt
    ```

1. Get wifi info
    ```bash
    ./adb shell dumpsys wifi | cat > ~/Documents/myapp-wifi.txt
    ```
1. Broadcast intent commands
    1. Install Referrer
        ```bash
        ./adb shell am broadcast -a com.android.vending.INSTALL_REFERRER --es "referrer" "utm_source=testSource&utm_medium=testMedium&utm_term=testTerm&utm_content=testContent&utm_campaign=testCampaign"
        ```

    1. Bootup
        ```bash
        ./adb shell am broadcast -a android.intent.action.BOOT_COMPLETED
        ```

    1. Battery Low 
        ```bash
        ./adb shell am broadcast -a android.intent.action.BATTERY_OKAY
        ```

    1. Battery Okay
        ```bash
        ./adb shell am broadcast -a android.intent.action.BATTERY_LOW
        ```
1. Permissions
    1. Granting new permission
        ```bash
        ./adb shell pm grant <package_name> <permission_name>
        ```
    1. Revoking permission
        ```bash
        ./adb shell pm revoke <package_name> <permission_name>
        ```

1. Install an apk
    ```bash
    ./adb install -g MyAwesomeApp.apk
    ```

### Aliases

How to setup these aliases

- Copy-Paste these alias inside your `.bashrc` or `.zshrc`
- Save.
- Goto terminal and execute `source ~/.bashrc` or `source ~/.zshrc`.
- Done, now simply call the alias to execute the command as defined.

```bash
# Setup ANDROID_HOME
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    export ANDROID_HOME=$HOME/Android/Sdk
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    export ANDROID_HOME=$HOME/Library/Android/sdk
fi

# Path to NDK
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk

# Path to Android platform tools (adb, fastboot, etc)
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"

# Path to Android tools (monitor, mksdcard, emulator-check, emulator, etc)
export ANDROID_TOOLS_1="$ANDROID_HOME/tools"

# Path to Android tools (apkanalyzer, avdmanager, monkeyrunner, lint, sdkmanager etc)
export ANDROID_TOOLS_2="$ANDROID_HOME/tools/bin"

# Path to Android tools (aapt, apksigner, zipalign, etc)
export ANDROID_TOOLS_3="$ANDROID_HOME/build-tools/29.0.3/"

# Add all to the path
export PATH="$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_TOOLS_2:$ANDROID_TOOLS_3"

# ------------------ Android --------------- #

# Misc ADB aliases
alias screenshot="adb exec-out screencap -p > screen-$(nowdate).png"
alias startintent="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell am start $1"
alias rmapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X uninstall $1"
alias clearapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell pm clear $1"

# Drop this in your ~/.bashrc or ~/.zshrc file
# Use as: deleteAllBuildDirs
alias deleteAllBuildDirs='find . -type d -name "build" | while read f; do echo "🔥Deleting: $f" && rm -rf "$f"; done'

# ADB Over Wifi
# Use as: adbOverWifi
function adbOverWifi(){
  local DEVICE_ID=$(adb devices | awk 'NR==2{print $1; exit}')
  echo "Device ID: $DEVICE_ID"

  local LOCAL_WIFI_IP=$(adb shell ip route | awk 'NR==1{print $9}')
  echo "Local Wifi IP: $LOCAL_WIFI_IP"

  local PORT=5555
  adb tcpip $PORT
  adb connect $LOCAL_WIFI_IP:$PORT
  sleep 1
  adb devices;
}

# ADB Over USB
# Use as: adbOverUsb
function adbOverUsb(){
  local DEVICE_ID=$(adb devices | awk 'NR==2{print $1; exit}')
  local CONNECTED_OVER_WIFI=$(adb devices | grep 5555 |  awk 'NR==1{print $1}')
  adb disconnect $CONNECTED_OVER_WIFI
  echo "Switching to USB mode for device with ID: $DEVICE_ID"
  adb usb $DEVICE_ID
  sleep 1
  adb devices;
}

# Stress test the debug apk with 100000 ui events
# Execute at the root of your android project
# Use as: stressTestDebugApk
function stressTestApk(){
  local APP_PACKAGE_NAME=$(apkanalyzer -h manifest application-id ./app/build/outputs/apk/debug/app-debug.apk)
  adb shell monkey -p $APP_PACKAGE_NAME 100000;
}

# Demo Mode : https://android.googlesource.com/platform/frameworks/base/+/master/packages/SystemUI/docs/demo_mode.md
# Enable Demo Mode on your device
# Usage: enableDemoMode
alias enableDemoMode="adb shell settings put global sysui_demo_allowed 1 && adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200 && adb shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false && adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false && adb shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100"

# Disable Demo Mode on your device
# Usage: disableDemoMode
alias disableDemoMode="adb shell am broadcast -a com.android.systemui.demo -e command exit"

# Get package name of the passed apk file
# Usage: getPackageName app-debug.apk
alias getPackageName="apkanalyzer -h manifest application-id $1"

# Install and Grant all permissions for an apk
# Usage: grantAllPermissionsForApk path/to/apk/Application.apk
alias grantAllPermissionsForApk="adb install -g $1"

# Install APK to device
# Use as: apkinstall app-debug.apk
alias apkinstall="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X install -r $1"

# Stress test the debug apk with 100000 ui events
# Execute at the root of your android project
# Use as: stressTestDebugApk
function stressTestApk() {
    local APP_PACKAGE_NAME=$(getPackageName ./app/build/outputs/apk/debug/app-debug.apk)
    adb shell monkey -p $APP_PACKAGE_NAME 100000
}

# Launch your debug apk on your connected device
# Execute at the root of your android project
# Usage: launchDebugApk
function launchDebugApk(){
  local APP_PACKAGE_NAME=$(apkanalyzer -h manifest application-id ./app/build/outputs/apk/debug/app-debug.apk)
  adb shell monkey -p $APP_PACKAGE_NAME 1  1>/dev/null 2>&1;
}

# As an alternative to apkinstall, you can also do just ./gradlew installDebug
# Alias for building and installing the apk to connected device
# Run at the root of your project
# Use as: buildAndInstallApk
alias buildAndInstallApk='./gradlew uninstallAll installDebug'

# Single command to build+install+launch apk
# 
# Note: Here I am building, installing and launching the debug apk which is usually in the path: `./app/build/outputs/apk/debug/app-debug.apk` 
# when this command is executed from the root of the project
# If you would like to install and run any other apk, simply replace the path for debug apk with path of your own apk
# 
# Execute at the root of your android project
# Use as: buildInstallLaunchDebugApk
alias buildInstallLaunchDebugApk="buildAndInstallApk && launchDebugApk"

# Publish Android Library
function publishAndroidLibModule() {
    local MODULE_NAME="$1"
    ./gradlew clean build $MODULE_NAME:install $MODULE_NAME:bintrayUpload -Ppublish=true
}

function publishAndroidLibModuleWithJavadocFlag() {
    local MODULE_NAME="$1"
    ./gradlew clean build $MODULE_NAME:install $MODULE_NAME:bintrayUpload -Ppublish=true -PjavadocFlag=true
}

# Check if the apk is signed properly
function checkIfApkIsSigned() {
    keytool -printcert -jarfile "$1" | grep CN= | awk -F ': CN=' '{print $1,"=",$2}'
}

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


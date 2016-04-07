# adb

1. Know what alarm has been set, how many times this alarm has been invoked, when are they going to alarmed and interval.
    ```bash
    ./adb shell dumpsys alarm | grep 'com.yourpacakage.name'

    ```
2. Get battery info
    ```bash
    ./adb shell dumpsys battery | cat > ~/Documents/myapp-battery.txt
    ```

3. Get  cpu info
    ```bash
    ./adb shell dumpsys cpuinfo | cat > ~/Documents/myapp-cpuinfo.txt
    ```

4. Get fulldump info
    ```bash
    ./adb shell dumpsys | cat > ~/Documents/myapp-fulldump.txt
    ```

5. Get memory info
    ```bash
    ./adb shell dumpsys meminfo 'com.example.myapp'| cat > ~/Documents/myapp-meminfo.txt
    ```

6. Get wifi info
    ```bash
    ./adb shell dumpsys wifi | cat > ~/Documents/myapp-wifi.txt
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


# batteryhistorian-helper

### Requirements
- [Go](https://golang.org/doc/install)
- [Battery Historian](https://github.com/google/battery-historian)
- [adb](https://developer.android.com/tools/help/adb.html)
- Android device

### Instructions
Simple bash scripts to handle 
- Running battery historian
    - Open `runBatteryHistorian.sh` and update the `GOPATH` variable , next run
    
        ```bash
        ./runBatteryHistorian.sh
        ```
- Extrating bugreport from device
    1. First create a folder named `bugreports` as in the path `~/Documents/bugreports/`
    2. Simply run
    
        ```bash
        ./extractBugReport.sh
        ```
- Reset battery logs
    - Once connected to your android device, simply run
    
        ```bash
        ./resetBatteryLogs.sh
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


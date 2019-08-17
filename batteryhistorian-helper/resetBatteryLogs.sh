#!/usr/bin/env bash

# Developer : Nishant Srivastava
# resetBatteryLogs v1.0.0

adb shell dumpsys batterystats --enable full-wake-history
adb shell dumpsys batterystats --reset  
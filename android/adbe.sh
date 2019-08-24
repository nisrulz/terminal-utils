#!/usr/bin/env bash

# Script adbe

# Requirements
# adb : It should be in your path so you can access it from anywhere
# awk: The script uses awk tool. Have it in the path too so you can access it.
#
# Usage
# Run any command you would run with adb for all the connected devices
# ./adbe <command> is the equivalent of ./adb -s <serial number> <command>
#
# Examples
# ./adbe version
# ./adbe install demo_app.apk
# ./adbe uninstall com.example.company.android

# If you would like to use adbe from any where create an alias to this script
# in your bashrc or zshrc file

adb devices | while read line
do
    if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
    then
        device=`echo $line | awk '{print $1}'`
        echo "$device $@ ..."
        adb -s $device $@
    fi
done
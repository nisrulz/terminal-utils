#!/bin/bash

# Developer : Nishant Srivastava
# extractBugReport v1.0.0

# Assign variables to commandline arguments
echo -n "Enter the name of bugreport and press [Enter] " 
read NAMEOFBUGREPORT
adb bugreport > ~/Documents/bugreports/$NAMEOFBUGREPORT.txt 
echo "Bugreport Saved! [ ~/Documents/bugreports/$NAMEOFBUGREPORT.txt ] "
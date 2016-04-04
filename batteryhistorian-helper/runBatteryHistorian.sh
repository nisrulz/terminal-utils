#!/bin/bash

# Developer : Nishant Srivastava
# runBatteryHistorian v1.0.0
# Export GoPath and start battery historian

# Assign variables to commandline arguments
GOPATH=$REPLACE_THIS_WITH_PATH_TO_YOUR_GO_WORKSPACE
BATTERYHISTORIANPATH=cmd/battery-historian/battery-historian.go
export GOPATH=$GOPATH
echo "GOPATH set!"
cd $GOPATH/src/github.com/google/battery-historian
echo "Changing directory to battery historian directory inside go workspace...."
echo "Starting Battery Historian.."
go run $BATTERYHISTORIANPATH
#!/usr/bin/env bash

set -eu

# start android emulator
START=`date +%s` > /dev/null

echo no | $ANDROID_HOME/tools/bin/avdmanager.bat -v create avd --force -n test --abi google_apis/x86_64 --package 'system-images;android-21;google_apis;x86_64'
$ANDROID_HOME/tools/bin/avdmanager.bat list avd
$ANDROID_HOME/emulator/emulator.exe -avd test -no-window -no-boot-anim -no-audio -verbose &
wait-for-emulator.bat
unlock-emulator-screen.bat

DURATION=$(( `date +%s` - START )) > /dev/null
echo "Android Emulator started after $DURATION seconds."

# emulator isn't ready yet, wait 1 min more
# prevents APK installation error
sleep 60

run-ui-tests.bat

kill-running-emulators.bat

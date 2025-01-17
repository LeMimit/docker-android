#!/usr/bin/env bash

# Originally written by Ralf Kistner <ralf@embarkmobile.com>, but placed in the public domain

set -eu

bootanim=""
failcounter=0
timeout_in_sec=300

until [[ "$bootanim" =~ "stopped" ]]; do
  echo "Yes"
  bootanim=`adb -e shell getprop init.svc.bootanim 2>&1 &`
  if [[ "$bootanim" =~ "device not found" || "$bootanim" =~ "device offline"
    || "$bootanim" =~ "running" ]]; 
  then
    let "failcounter += 1"
    echo "Waiting for emulator to start"
    if [[ $failcounter == $timeout_in_sec ]]; then
      echo "Timeout ($timeout_in_sec seconds) reached; failed to start emulator"
      exit 1
	fi
  else
    let "failcounter += 1"
    echo "Waiting for emulator to start"
    if [[ $failcounter == $timeout_in_sec ]]; then
      echo "Timeout ($timeout_in_sec seconds) reached; failed to start emulator"
      exit 1
	fi
  fi
  sleep 1
done

echo "Emulator is ready"

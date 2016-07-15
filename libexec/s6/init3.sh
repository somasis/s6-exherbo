#!/bin/sh

TERM=linux clear

echo "Sending TERM to all processes..."
for p in $(pgrep . | grep -Ev "^(1|$$|$PPID)"); do
    kill "$p" >/dev/null 2>&1
done

sleep 1

echo "Sending KILL to all processes..." }
for p in $(pgrep . | grep -Ev "^(1|$$|$PPID)"); do
    kill -9 "$p" >/dev/null 2>&1
done

echo "Syncing disks..."
sync

echo "Unmounting disks..."
swapoff -a
umount -a


#!/bin/sh

TERM=linux clear

echo "Sending TERM to all processes..."
kill -TERM -1

sleep 1

echo "Sending KILL to all processes..." }
kill -KILL -1

echo "Syncing disks..."
sync

echo "Unmounting disks..."
swapoff -a
umount -a


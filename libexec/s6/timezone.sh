#!/bin/sh

if [ "$TZ" = "UTC" ] || [ -z "$TZ" ]; then
    if [ -e /etc/localtime ]; then
        TZ=$(readlink /etc/localtime | sed 's|/usr/share/zoneinfo||' | cut -d'/' -f2-)
        if [ -n "$TZ" ];then
            echo "$TZ"
            exit 0
        else
            echo UTC
        fi
    fi
else
    echo "$TZ"
fi

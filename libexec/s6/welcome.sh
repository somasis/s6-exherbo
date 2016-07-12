#!/bin/sh

for f in /usr/lib/os-release /etc/os-release;do
    [ -f "${f}" ] && . "$f"
done

if [ -n "${ANSI_COLOR}" ];then
    color="\e[${ANSI_COLOR}m"
    reset="\e[0m"
fi

if ! grep -q ' debug' /proc/cmdline;then
    TERM=linux clear
fi

printf "Booting ${color}%s${reset}...\n" "${PRETTY_NAME:-$NAME}"


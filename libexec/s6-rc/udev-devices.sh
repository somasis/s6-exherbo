#!/bin/sh

# create the static nodes needed before udev
kmod static-nodes -f tmpfiles | while read -r type file mode uid gid age arg;do
    case "${type}" in
        d|d!)
            mkdir -m "${mode}" "${file}"
        ;;
        *)
            maj=${arg%:*}
            min=${arg#*:}
            mknod -m "${mode}" "${file}" "${type:0:1}" "${maj}" "${min}"
        ;;
    esac
done

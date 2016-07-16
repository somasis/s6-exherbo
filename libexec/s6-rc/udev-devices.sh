#!/bin/sh

# create the static nodes needed before udev

static_nodes=/usr/lib/modules/$(uname -r)/modules.devname

grep -v '^#' "${static_nodes}" | while read line;do
    file=${line#* }; file=/dev/${file% *}
    args=${line##* }
    type=${args:0:1}
    major=${args/${type}}; major=${major%:*}
    minor=${args/${type}${major}:}
    mknod -m 0600 "${file}" "${type}" "${major}" "${minor}"
done


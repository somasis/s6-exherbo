#!/bin/sh

# Try state-normal, else fallback to state-basic
if s6-rc-db list bundles | grep -xFq state-normal;then
    s6-rc -u change state-normal
else
    s6-rc -u change state-basic
fi


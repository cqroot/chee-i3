#!/usr/bin/env bash

env \
    XSECURELOCK_BLANK_TIMEOUT=180 \
    XSECURELOCK_BLANK_DPMS_STATE=off \
    XSECURELOCK_NO_COMPOSITE=1 \
    xsecurelock &

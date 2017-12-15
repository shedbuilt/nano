#!/bin/bash
if [ ! -e /etc/nanorc ]; then
    install -v -Dm644 $SHED_CONTRIBDIR/nanorc /etc/nanorc
fi

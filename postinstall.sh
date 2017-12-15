#!/bin/bash
if [ ! -e /etc/nanorc ]; then
    install -v -m644 /etc/nanorc.default /etc/nanorc
fi

#!/bin/bash
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-2.8.7
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
mkdir -pv ${SHED_FAKEROOT}/usr/share/doc/nano-2.8.7
install -v -m644 doc/{nano.html,sample.nanorc} ${SHED_FAKEROOT}/usr/share/doc/nano-2.8.7

#!/bin/bash
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-3.0 && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install || exit 1
mkdir -pv "${SHED_FAKEROOT}/usr/share/doc/nano-3.0"
install -v -m644 doc/{nano.html,sample.nanorc} "${SHED_FAKEROOT}/usr/share/doc/nano-3.0"
install -v -Dm644 "${SHED_CONTRIBDIR}/nanorc" "${SHED_FAKEROOT}/etc/nanorc.default"

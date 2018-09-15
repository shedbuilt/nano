#!/bin/bash
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir="$SHED_PKG_DOCS_INSTALL_DIR" && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install || exit 1
mkdir -pv "${SHED_FAKEROOT}${$SHED_PKG_DOCS_INSTALL_DIR}"
install -v -m644 doc/{nano.html,sample.nanorc} "${SHED_FAKEROOT}${$SHED_PKG_DOCS_INSTALL_DIR}"
install -v -Dm644 "${SHED_CONTRIBDIR}/nanorc" "${SHED_FAKEROOT}/etc/nanorc.default"

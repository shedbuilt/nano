#!/bin/bash
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-2.9.3 && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
mkdir -pv "${SHED_FAKE_ROOT}/usr/share/doc/nano-2.9.3"
install -v -m644 doc/{nano.html,sample.nanorc} "${SHED_FAKE_ROOT}/usr/share/doc/nano-2.9.3"
install -v -Dm644 "${SHED_PKG_CONTRIB_DIR}/nanorc" "${SHED_FAKE_ROOT}/etc/nanorc.default"

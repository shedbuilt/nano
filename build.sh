#!/bin/bash
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir="$SHED_PKG_DOCS_INSTALL_DIR" &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install &&
mkdir -pv "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}" &&
install -v -m644 doc/{nano.html,sample.nanorc} "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}" &&
install -v -Dm644 "${SHED_PKG_CONTRIB_DIR}/nanorc" "${SHED_FAKE_ROOT}${SHED_PKG_DEFAULTS_INSTALL_DIR}/etc/nanorc"

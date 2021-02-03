if [[ $(uname) == "Linux" ]]; then
    export ARCH="LINUXAMD64"
fi

if [[ $(uname) == "Darwin" ]]; then
    export ARCH="MACOSXX86_64"
fi

ln -s ${PREFIX}/lib/* plugins/${ARCH}/molfile

export LINKER="LD_LIBRARY_PATH=plugins/${ARCH}/molfile/ ${CC}"

if [[ $(uname) == "Linux" ]]; then
    make LINKER="${LINKER}" ARCH=${ARCH} CC=${CC} CCQHULL=${CC}
fi

if [[ $(uname) == "Darwin" ]]; then
    make fpocket LINKER="${LINKER}" ARCH=${ARCH} CC=${CC} CCQHULL=${CC}
fi

make install BINDIR=$PREFIX/bin MANDIR=$PREFIX/man/man8

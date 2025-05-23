if [[ $(uname) == "Linux" ]]; then
    export ARCH="LINUXAMD64"
fi

if [[ $(uname) == "Darwin" ]]; then
    if [[ "$target_platform" == "osx-arm64" ]]; then
        export ARCH="MACOSXARM64"
    else
        export ARCH="MACOSXX86_64"
    fi
fi

export LINKER="LD_LIBRARY_PATH=plugins/${ARCH}/molfile/ ${CC}"

make LINKER="${LINKER}" ARCH=${ARCH} CC=${CC} CCQHULL=${CC}
make install BINDIR=$PREFIX/bin MANDIR=$PREFIX/man/man8 LIBDIR=$PREFIX/lib

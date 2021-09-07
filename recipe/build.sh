if [[ $(uname) == "Linux" ]]; then
    export ARCH="LINUXAMD64"
    #CXXFLAGS=""
fi

if [[ $(uname) == "Darwin" ]]; then
    export ARCH="MACOSXX86_64"
    #CXXFLAGS="-mmacosx-version-min=10.15" 
fi

ln -s ${PREFIX}/lib/* plugins/${ARCH}/molfile

export LINKER="LD_LIBRARY_PATH=plugins/${ARCH}/molfile/ ${CC}"

make ARCH=${ARCH} CC=${CC} CCQHULL=${CC} #CXXFLAGS=${CXXFLAGS}
make install BINDIR=$PREFIX/bin MANDIR=$PREFIX/man/man8

# Guide from http://magnushoff.com/pnacl.html

PEPPER_VERSION="43"
PEPPER="/home/dave/nacl_sdk/pepper_${PEPPER_VERSION}"
PLATFORM="linux"
BINDIR="bin"
BUILD_VARIANT="Debug"

# Force python2
export PNACLPYTHON=$(which python2)

TOOLCHAIN="${PEPPER}/toolchain/${PLATFORM}_pnacl/${BINDIR}"

CXX="$TOOLCHAIN/pnacl-clang++"
LINK="$CXX"
FINALIZE="$TOOLCHAIN/pnacl-finalize"

PPAPI_INCLUDE="$PEPPER/include"
PPAPI_LIBDIR="$PEPPER/lib/pnacl/$BUILD_VARIANT"

# Compiling
$CXX -c -o main.o -pthread -I "$PPAPI_INCLUDE" main.cpp

# Linking
LIBS="-lppapi_simple -lppapi -lppapi_cpp -lnacl_io"
$LINK -o minimal_unstripped.bc -pthread -L "$PPAPI_LIBDIR" main.o $LIBS

# Finalize PNaCL bitcode
$FINALIZE -o minimal.pexe minimal_unstripped.bc
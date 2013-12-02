#!/bin/bash

NDK=~/android/android-ndk-r9
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/
PLATFORM=$NDK/platforms/android-9/arch-arm/

export CC="$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc"
export LDFLAGS="--sysroot=$NDK/platforms/android-9/arch-arm -L$NDK/platforms/android-9/arch-arm/usr/lib"
export CFLAGS="--sysroot=$NDK/platforms/android-9/arch-arm/"
export AR="$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/arm-linux-androideabi-ar"
export PATH=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/:$PATH
#export LIBS="-lpthread"

# require libogg-devel for <ogg/ogg.h>
# require 32 bit libc dev package (glibc-devel.i686 on fedora) for <gnu/stubs-32.h>
export CFLAGS="$CFLAGS -I/usr/include \
    -I$NDK/platforms/android-9/arch-arm/usr/include -DLOCAL_ALLOW_UNDEFINED_SYMBOLS=true"

echo $LDFLAGS
./configure --host=arm-linux --target=arm-linux --enable-shared=no

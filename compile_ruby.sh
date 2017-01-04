#!/bin/sh

echo "Configuring environment"
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:/usr/local/bin:/usr/bin:/bin:$PATH"
export CFLAGS="-DIOS -arch x86_64 -miphoneos-version-min=8.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"
export CXXFLAGS="$CFLAGS"
export CC="clang $CFLAGS"
export CXX="clang++ $CXXFLAGS"
export AR="ar"
export RANLIB="ranlib"
export STRIP="strip —-strip-unneeded"

echo "Downloading ruby"
curl https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.bz2 -o ruby-2.2.1.tar.bz2
echo "Unpacking..."
tar -xjf ruby-2.2.1.tar.bz2
cd ./ruby-2.2.1
echo "Generate Makefile"
autoconf
cd ..
echo "Patch ruby sources"
patch -p0 -i ruby-2.2.1.ios.patch
cd ./ruby-2.2.1

echo "Running configure"
./configure LDFLAGS="" CFLAGS="-Wno-format" --host=x86_64-iphone-darwin --build=x86_64-apple-darwin --prefix="$(pwd)/../install/ruby221.x86_64" --with-baseruby=/usr/bin/ruby --disable-ipv6 --disable-rubygems --disable-install-doc --with-static-linked-ext --disable-dln 
echo "Make..."
make
echo "Make install"
make install

cd ..
echo "Removing data"
rm ./ruby-2.2.1.tar.bz2
rm -rf ./ruby-2.2.1

mv ./install/ruby221.x86_64 ./3rd-party/ruby
rm -rf ./install


echo "Ok, all the work is done. Enjoy!"
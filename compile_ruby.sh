#!/bin/sh


cd ./ruby-2.2.1




cd ..
echo "Removing data"
rm ./ruby-2.2.1.tar.bz2
rm -rf ./ruby-2.2.1

mv ./install/ruby221.x86_64 ./3rd-party/ruby

rm -rf ./install
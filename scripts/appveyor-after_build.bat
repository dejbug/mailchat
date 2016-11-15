@echo off

echo -- running "after_build.bat"

echo -- creating build folder
mkdir build

echo -- moving binaries into build folder
move mailchat.exe build\
move libcurl.dll build\

pushd build
dir
mailchat.exe
popd

echo -- build folder ready for deployment

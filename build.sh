#! /usr/bin/env bash
set -uvx
set -e
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`
version="${ts}"

cd $cwd/JsonDLL2
sed -i -e "s/<Version>.*<\/Version>/<Version>${version}<\/Version>/g" JsonDLL2.csproj
rm -rf obj bin
rm -rf *.nupkg
dotnet pack -o . -p:Configuration=Release -p:Platform="Any CPU" JsonDLL2.csproj

#exit 0

cd $cwd
git add .
git commit -m"JsonDLL2 v$version"
git tag -a v$ts -mv$version
git push origin v$version
git push
git remote -v

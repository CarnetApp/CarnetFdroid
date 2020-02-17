#!/bin/bash
git pull --rebase
cd app/CarnetAndroid
git pull --rebase origin stable
cd ../Sync
git pull --rebase origin master
cd ../../
git add app/CarnetAndroid app/Sync
git commit -m "sync"
git push

git tag v$(grep -o "versionName\s\+.*" app/CarnetAndroid/app/build.gradle | tail -1 | awk '{ print $2 }' | tr -d \''"\')
git push origin v$(grep -o "versionName\s\+.*" app/CarnetAndroid/app/build.gradle | tail -1 | awk '{ print $2 }' | tr -d \''"\')


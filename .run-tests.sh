#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

echo "$(echo '#!/bin/bash -x' && grep -v '^\#\!\/' shoppe)" > shoppe-testing
mv shoppe-testing shoppe
chmod +x shoppe

! ./shoppe
./shoppe help

./shoppe install boredbutton +nc
[[ -e "/usr/bin/bored" ]]

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
! [[ -e "/usr/bin/bored" ]]

./shoppe install boredbutton +pm +nc
[[ -e "/usr/bin/bored" ]]

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
! [[ -e "/usr/bin/bored" ]]

./shoppe install boredbutton.tar.gz +nc
[[ -e "/usr/bin/bored" ]]

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
! [[ -e "/usr/bin/bored" ]]

./shoppe update +nc
./shoppe upgrade +nc
./shoppe info boredbutton
! ./shoppe info pkgthatdoesnotexist
./shoppe listall
./shoppe fetch boredbutton

#
# shoppe-utils testing
#

echo "$(echo '#!/bin/bash -x' && grep -v '^\#\!\/' shoppe-utils)" > shoppe-utils-testing
mv shoppe-utils-testing shoppe-utils
chmod +x shoppe-utils

! ./shoppe-utils
./shoppe-utils --version
./shoppe-utils --help
! ./shoppe-utils pkg
! ./shoppe-utils subsetthatdoesnotexist

wget https://raw.githubusercontent.com/shoppepm/shoppe-repos/master/boredbutton/shoppepkg
./shoppe-utils pkg validate shoppepkg
echo "broken package" > brokenpkg
! ./shoppe-utils pkg validate brokenpkg
! ./shoppe-utils pkg validate shoppepkg brokenpkg

./shoppe-utils tools clearconfig
[[ ! -e ~/.config/shoppe/ ]]

#if [[ "$(git branch | grep \* | cut -d ' ' -f2)" == "develop" ]]; then
#	git checkout master-candidate
#	git merge develop
#	echo "$(echo '# shoppe [![Build Status](https://travis-ci.org/shoppepm/shoppe.svg?branch=master-candidate)](https://travis-ci.org/shoppepm/shoppe)' && grep -v '^\#\ shoppe/' README.md)" > README.md.tmp
#	mv README.md.tmp README.md
#	git push --set-upstream origin master-candidate
#fi

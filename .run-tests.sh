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

./shoppe install boredbutton +pm
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

#if [[ "$(git branch | grep \* | cut -d ' ' -f2)" == "develop" ]]; then
#	git checkout master-candidate
#	git merge develop
#	echo "$(echo '# shoppe [![Build Status](https://travis-ci.org/shoppepm/shoppe.svg?branch=master-candidate)](https://travis-ci.org/shoppepm/shoppe)' && grep -v '^\#\ shoppe/' README.md)" > README.md.tmp
#	mv README.md.tmp README.md
#	git push --set-upstream origin master-candidate
#fi

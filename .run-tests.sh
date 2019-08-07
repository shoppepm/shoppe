#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

echo "$(echo '#!/bin/bash -x' && grep -v '^\#\!\/' shoppe)" > shoppe-testing
mv shoppe-testing shoppe
chmod +x shoppe

./shoppe install boredbutton +nc

[[ -e "/usr/bin/bored" ]]

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
! [[ -e "/usr/bin/bored" ]]

./shoppe update
./shoppe upgrade
./shoppe info boredbutton
! ./shoppe info pkgthatdoesnotexist
./shoppe listall

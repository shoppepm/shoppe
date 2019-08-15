#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

echo "$(echo '#!/bin/bash -x' && grep -v '^\#\!\/' whim)" > whim-testing
mv whim-testing whim
chmod +x whim

! ./whim
./whim help

./whim install boredbutton +nc

[[ -e "/usr/bin/bored" ]]

ls ~/.config/whim
ls ~/.config/whim/*

./whim remove boredbutton +nc
! [[ -e "/usr/bin/bored" ]]

./whim update +nc
./whim upgrade +nc
./whim info boredbutton
! ./whim info pkgthatdoesnotexist
./whim listall

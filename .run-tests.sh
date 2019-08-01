#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

echo "$(echo '#!/bin/bash -x' && grep -v '^\#\!\/' shoppe)" > shoppe-testing
mv shoppe-testing shoppe
chmod +x shoppe

./shoppe install boredbutton +nc

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
# package seems to be broken:
#./shoppe install boredbutton-git +nc
#./shoppe remove boredbutton-git +nc

./shoppe update
#./shoppe upgrade

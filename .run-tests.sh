#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

./shoppe install boredbutton +nc

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton +nc
./shoppe install boredbutton-git +nc
./shoppe remove boredbutton-git +nc

./shoppe update
#./shoppe upgrade

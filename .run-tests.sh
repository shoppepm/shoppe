#!/bin/bash

# This is a script used to automate testing.
# It's used to verify that everything works correctly.

set -ev

./shoppe install boredbutton +fb

ls ~/.config/shoppe
ls ~/.config/shoppe/*

./shoppe remove boredbutton
./shoppe install boredbutton-git
./shoppe remove boredbutton-git

./shoppe update
#./shoppe upgrade

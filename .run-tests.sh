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

./shoppe install ~/boredbutton.tar.gz +nc
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

#
# shoppe upgrade testing
#

mkdir ~/testrepo
./shoppe-utils repo addpkg ~/boredbutton.tar.gz ~/testrepo
sed "/pkgrel/d" "$HOME/testrepo/boredbutton/shoppepkg" > "$HOME/testrepo/boredbutton/shoppepkg.tmp"
mv "$HOME/testrepo/boredbutton/shoppepkg.tmp" "$HOME/testrepo/boredbutton/shoppepkg"
echo "pkgrel='999'" >> "$HOME/testrepo/boredbutton/shoppepkg"
./shoppe-utils repo restock ~/testrepo +nc
ls ~/testrepo/*

./shoppe addrepo ~/testrepo
./shoppe upgrade +nc

branch="$(git branch | grep \* | cut -d ' ' -f2)"
if [[ "$branch" == "develop" ]]; then
	echo "$(echo '#!/usr/bin/env bash' && grep -v '^\#\!\/' shoppe)" > shoppe-testing
	mv shoppe-testing shoppe
	chmod +x shoppe
	echo "$(echo '#!/usr/bin/env bash' && grep -v '^\#\!\/' shoppe-utils)" > shoppe-utils-testing
	mv shoppe-utils-testing shoppe-utils
	chmod +x shoppe-utils
	openssl aes-256-cbc -k "$travis_key_password" -d -md sha256 -a -in travis_key.enc -out travis_key
	echo "Host github.com" > ~/.ssh/config
	echo "  IdentityFile  $(pwd)/travis_key" >> ~/.ssh/config
	chmod 400 travis_key
	git remote set-url origin git@github.com:shoppepm/shoppe.git
	echo "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzLrHyNpg2pyChu3ZhTVkoRF4TvvUmzlWO9KXGK9rXDMz/167X7/z4XvyXqwQWP18iMLVdFuzrhKlZ7lXWf91O43fuWUjgNGrXXlsB008HLTYAiJmZK0Vymy24BBkv/o5tkAEOTSpr/rUqwh5VmObexF9xOLeNpR05r6SuHKJ24sVMETt85BTQi7lr9L6vk7MqrZgBjklfeP/atWWu0GnH8um0DS3GO7/F7+gVXvmEo9YCSHBEOkvGWE2UQRLlIQlaJDabUC7DtUP3hWnb3TNLuHpk3zhqwel8Rvb1UWJYvZ2bCYDbVM3pRQXToR5LZy7nd59yXoc7Zx7HL80zIDuugS8vuD4JNf8LVNeVPGQh3VJXpER5ofQHuJD0RrlUoSSlLU7YdGyEiBUR71e6PvbU/bmI0aNs/taod2uqesVIZdg83JD8LxTKSCbVUKVLypmSMISg/xFbGLrtYSDRUvMO1in2WGPhmKONDTVq2mZ99JlV7tQIZ4sUJfkcn4iUnKRAh1of+c+7zmR8V62/ZwqvFdbHOsr86IJFppn7Qn+bcnKxFZQSDcco6L9oacGxt4YJg0PtKd+KsZ8rS4qkAoPhTOZG29jG4haRwqPc79MdOCuntm80XOvLIgrgfBmQDd08rXr+urljch4KJankhzYcxsJb1hPXJidDeZxr4K1w+Q==" > ~/.ssh/known_hosts
	git checkout master-candidate
	git merge develop
	git push --set-upstream origin master-candidate
fi

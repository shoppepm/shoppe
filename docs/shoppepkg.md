$ Shoppe package file

Each shoppe package has its own shoppe package file, which contains all information about the package such as its name, version, revision as well as building and installation instructions.


## shoppe package

```bash
# Basic information
pkgname="shoppe" # Name of the package. This should be lowercase unless it's uppercase in most repos.
pkgdesc="A package manager frontend/replacement" # Short description of the package. Make sure it doesn't end with a dot (stylistic choice).
pkgarch="all" # The architecture this package is meant for. If it runs on all architectures, use 'all', otherwise use the architecture name that 'uname -s' returns.
pkgver="v0.1" # Package version. For packages being built from the newest source, this should be set to "rolling".
revision="1" # Package revision. Bump this every time you change the package (eg. update to next version, fix some commands). For packages being built from newest source, this should be set to "rolling".
license="GPL 3-Clause" # License. This is required.
website="https://github.com/knuxify/shoppe" # Project website. Optional. If this is an open-source project, link the source page.
depends="bash git curl wget" # Dependencies, separated by spaces.
# optional="" # Optional dependencies, separated by spaces.
makedepends="make" # Build dependencies, separated by spaces.
conflicts="shoppe-git" # Packages this package conflicts with, separated by spaces. Most of the time this will contain the rolling version of a package.
archdependent="false" # Does the package require separate builds for each architecture? Most of the time, this will be true, but if you're providing an architecture independent app like a bash/python script this will be set to false.

# Building/installation instructions
source="https://github.com/shoppepm/shoppe" # Source link.
sourcetype="git-tag" # Source type, defines how to get the source.
# The source can be one of the following:
# git - git repository (clone with git) (optional: a commit variable)
# git-tag - github tag (clone with git) (requires tag variable, can also be used for getting certain branches)
# compressed - compressed file (download with wget) (requires source to end with the right file extention)
# If you need to force a compression method, you can use one of those source types:
# tar, targz, gz, tarxz
tag="$version"

# Building. This is required, unless your package only requires an install, in which case you can remove it. In this case, it is not required, so it is commented out.
#shoppebuild() {
#	get_source
	cd source
#	# Building commands go here...
#	cd ../
#}

# Also, if you already get the package in shoppebuild, you don't have to redownload it in shoppeinstall.

# Installation. This is required.
shoppeinstall() {
	get_source
	cd source
	# Installation commands go here...
	sudo make install
}

# You can also specify post- and pre-install hooks, by creating the shoppepreinstall and shoppepostinstall functions.
```

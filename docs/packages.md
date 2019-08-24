# Package

Each shoppe package has two core files: shoppepkg, which contains the information about the package, and content.tar.gz, which contains the files for the package. If content.tar.gz is not present, the package will be built manually.

## Example shoppe package

```bash
# Basic information
pkgname="shoppe" # Name of the package. This should be lowercase unless it's uppercase in most repos. Do not add spaces. Special characters are not reccomended.
pkgdesc="A package manager frontend/replacement" # Short description of the package. Make sure it doesn't end with a dot (stylistic choice).
pkgarch="all" # The architecture this package is meant for. If it runs on all architectures, use 'all', otherwise use the architecture name that 'uname -s' returns.
pkgver="v0.1" # Package version. For packages being built from the newest source, this should be set to "rolling".
pkgrel="1" # Package revision. Bump this every time you change the package (eg. update to next version, fix some commands). For packages being built from newest source, this should be set to "rolling".
license="GPL 3-Clause" # License. This is optional.
website="https://github.com/knuxify/shoppe" # Project website. Optional. If this is an open-source project, link the source page.
depends="bash git curl wget" # Dependencies, separated by spaces.
# optdepends="" # Optional dependencies, separated by spaces.
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

# Building. This is required. This is where all build steps go (preparation, building, installing).
shoppepkg_build() {
	get_source
	cd source
	# Building commands go here...
	cd ../
}

# If you want to use separate functions for each step, simply add them and call them from shoppepkg_build.

# You can also specify post- and pre-install hooks, by creating the shoppepkg_preinstall and shoppepkg_postinstall functions.
```

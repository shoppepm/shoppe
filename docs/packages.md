# Package

Each shoppe package has two core files: shoppepkg, which contains the information about the package, and content-<architecture>.tar.gz, which contains the files for the package. If shoppe cannot find a content tarball for the current architecture, the package will be built manually.

## Creating a package

To create a package, you have to make a shoppepkg for it. To do that, you can use the shoppe utilities:

```bash
$ shoppe-utils pkg create
```

This will ask you multiple questions about the package, such as the package name, description, etc. Afterwards, you can open the resulting shoppepkg file and add the following:

- a source variable
- a source type variable
- build steps

See the example shoppe package below for more information.

## Building a package

Simply add it to a repository (see: [Repositories](repositories.md)), add the repository and install with the -p switch, or use ``shoppe install /path/to/shoppepkg -p``.

## Adding optional dependencies

Add the optional dependencies to the optdepends variable, separated by spaces. To attach a description:

1. Create a file named optdepends in the same directory as the shoppepkg (if not done already);
2. Add "pkgname - description you want to give to the dependency" to the optdepends file.

If no description is specified, only the dependency name is printed.

## Example shoppe package (and all of the variables)

```bash
# Basic information
pkgname="shoppe" # Name of the package. This should be lowercase unless it's uppercase in most repos. Do not add spaces. Special characters are not reccomended.
pkgdesc="A package manager frontend/replacement" # Short description of the package. Make sure it doesn't end with a dot (stylistic choice).
pkgarch="all" # The architecture this package is meant for. If it runs on all architectures, use 'all', otherwise use the architecture name that 'uname -s' returns.
pkgver="v0.1" # Package version. For packages being built from the newest source, this should be set to "rolling".
pkgrel="1" # Package revision. This is automatically bumped every time you rebuild the package. For packages being built from newest source, this should be set to "rolling".
license="GPL 3-Clause" # License. This is optional.
url="https://github.com/knuxify/shoppe" # Project website. Optional. If this is an open-source project, link the source page.
depends="bash git curl wget" # Dependencies, separated by spaces.
# optdepends="" # Optional dependencies, separated by spaces. See docs/packages.md for information on how to attach descriptions to the dependencies.
makedepends="make" # Build dependencies, separated by spaces.
provides="shoppe-git" # If this package provides the same functionality as another package, add it here. Packages are separated by spaces. Automatically adds the package to conflicts.
#conflicts="" # Packages this package conflicts with, separated by spaces. Most of the time this will contain the rolling version of a package.

# Building/installation instructions
source="https://github.com/shoppepm/shoppe" # Source link.
sourcetype="git" # Source type, defines how to get the source.
# The source can be one of the following:
# git - git repository (clone with git)
# Optional variables for git:
# commit="<commit to clone here>"
# tag="<tag or branch to clone here>"
# compressed - compressed file (download with wget) (requires source to end with the right file extention)
# If you need to force a compression method, you can use one of those source types:
# tar, targz, gz, tarxz
tag="$version"

# Building. This is required. This is where all build steps go (preparation, building, installing).
# TIP: Use the $contentdir variable to refer to the content directory (where built files which would usually go to the root directory should be stored) and the $sourcedir variable to refer to the source directory (fetched by get_source).
shoppepkg_build() {
	get_source
	cd $sourcedir
	# Building commands go here...
	cd ../
}

# If you want to use separate functions for each step, simply add them and call them from shoppepkg_build.

# You can also specify post- and pre-install hooks, by creating the shoppepkg_preinstall and shoppepkg_postinstall functions.
```

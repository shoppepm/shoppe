# Package groups

Package groups allow for multiple packages to be installed in one small command quickly.

## Creating a package group

Creating a package group is simmilar to adding a package (see (Packages)[packages.md]).

Package groups use shoppepkg files, just like regular packages. However, package groups
only have the following variables:

- pkgname
- pkgdesc
- pkgrel
- pkgver
- **group**
- **optgroup**

The group variable contains the packages in the group, separated by spaces.

The optgroup variable contains the optional packages in the group. You can store optional dependency descriptions in the ``optdeps`` file, just like in regular packages. This process is described in the regular package documentation ((Packages)[packages.md]).

# Repositories

## Repository structure

A repository contains the list of packages present in the repository and the packages themselves. Each package has its own folder, which contains the compiled package (content.tar.gz) and the shoppepkg file *(See also: [shoppe package file](packages.md))*. Shoppe supports local repositories and repositories served over http/https.

## Adding a repository

You can use ``shoppe addrepo <repositories>`` to add a repository automatically, or add one manually (see ``Repository list file`` later in this doc).

## Creating and managing repositories

Creating and managing a repository is fairly simple, since they are just folders.

### Creating a repository

Create an empty folder, and make an empty "pkglist" file in it.

### Adding packages to a repository

Create a folder with the package's name and put its shoppepkg in it (see [Packages](packages.md)). After building the package, extract the resulting full package into the folder.

## Repository list file ($configdir/repositories)

*See also: [Configuration](configuration.md)*

This file contains paths to each repository that shoppe should use. Each repository gets its own ID, decided by its position in the repository file (the higher the position is, the lower the ID is; the lower the ID is, the more important that repository is).

Each line contains one repository and follows the following format:

```
repotype: repopath
```

Available repository types:

- local (repopath is a local path on the computer)
- http (repopath is a web server)

The space between the path and the ``:`` character is required.

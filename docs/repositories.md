# Repositories

## Repository structure

A repository contains the list of packages present in the repository and the packages themselves.. Each package has its own folder, which contains the compiled package (content.tar.gz) and the shoppepkg file *(See also: [Shoppe package file](shoppepkg.md))*.

The repository metadata contains information about every package present in the repository,

## Configuration file ($configdir/repositories)

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

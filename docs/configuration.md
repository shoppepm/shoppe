# Configuration

This document describes most aspects of configuration.

## Files

### $configdir/config

This file allows the user to overwrite some paths for other configuration files.

### $configdir/repositories

This file contains paths to each repository that shoppe should use.

*See: [Repositories](repositories.md)*

### $configdir/pkglist

This file contains packages, package revisions and package versions.

## Configuration variables

- skipfrontend (true/false) - if true, the frontend will be ignored. This can be enforced at startup with the +sf switch.
- configdir - Default directory for all configuration files. Must be user-writeable.
- repofile - File containing all repositories.
- pkglist - File containing all installed packages.
- pkginfo - Directory containing information about certain packages.
- tmpdir - Temporary directory.

# Package alternative lists

Package alternative lists are files that contain alternative names for certain packages.

When a package is named differently in one distro, and differently in another, a package alternative list that is specific to each package manager can solve this issue.

## Creating a package alternative list

Package manager specific lists use the commonpm variable (see [[Package manager support]](frontend-support.md)) as their name, for example the alternative list for apt will be called ``apt.altlist``.

The list follows the following format:

```
pkgname pkgalt
```

where each package alternative is separated by a newline.

You can also place your own custom alternative rules in the ``custom.altlist`` file.

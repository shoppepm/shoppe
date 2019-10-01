# Contributing

All of shoppe's code, as well as the code for shoppe-utils and the documentation is available on GitHub over at [https://github.com/shoppepm/shoppe](https://github.com/shoppepm/shoppe). 

## Writing issues

Please include the following information:
- distribution being used
- versions of software related to the bug (for example, version of curl/wget)
- version and branch of shoppe being used
- OPTIONAL: change the shebang to "#!/usr/bin/bash -x" or add "set -x" to the beggining of the file and send full logs via PasteBin or a simmilar service

## Formatting commits and pull requests

Please format your commits and pull request names like so:

``MODIFIEDPART: TYPEOFCHANGE: Commit message``

Where MODIFIEDPART is the part of shoppe you have modified and the TYPEOFCHANGE is the type of change you have made.

TYPEOFCHANGE is optional, but reccomended.

MODIFIEDPART can be one of the following:

- ``SHOPPE`` - Used for modifications to shoppe, except for the frontend.
- ``FRONTEND`` - Used for modifications to the frontend, mostly useful when adding new package managers.
- ``DOCS`` - Used for documentation changes.
- ``META`` - Used for anything else, like changing the TODO file, bumping versions and modifying files such as the readme.

TYPEOFCHANGE can be one of the following:

- ``FIX`` - Indicates that the commit introduced a fix.
- ``IMPROVEMENT/UX`` - Used for improvements to general user experience, mostly interface changes and speed improvements.
- ``IMPROVEMENT/CODE`` - Used for improvements in code, primarily adding or changing functions and cleaning up.
- ``NEW`` -  Used for **major** new features.
- ``FEATURE`` - Used for adding or changing minor features.
- ``BREAKING`` (as a prefix before the MODIFIEDPART, can be used with other change types) - Indicates that a change might break something.

## Maintainers

- knuxify (knuxify@gmail.com)

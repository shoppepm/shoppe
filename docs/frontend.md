# Frontend

```
This article needs to be rewritten more clearly.
```

The frontend is a part of shoppe that allows it to interact with the operating system's package manager.

## Main commands

### frontend_init

This command finds the installed package manager and assigns it to the pm variable. It also sets the following variables:

- frontend_install
- frontend_remove
- frontend_update
- frontend_upgrade
- frontend_query

### frontend_harvest

This function is called during the update process and fetches the list of installed packages.

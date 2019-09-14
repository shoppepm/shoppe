# Frequently asked questions

## Using shoppe

### So, is shoppe just a frontend for other package managers?

No, it is also its own package manager.

### Alright, but what's the deal with the frontend and the rest of the package manager?

The frontend is used to fetch packages that aren't on the shoppe repositories. It does, however, take priority over the rest of the package manager, so when you want to download something from the shoppe repos when it's already available from the frontend you'll have to use the -c switch.

This approach allows shoppe to work on multiple distributions without the need for porting over basic packages.

## Miscelaneous

### What's the deal with the '+'-prefixed switches?

In the pre-rewrite versions of shoppe, all normal switches were passed to the frontend, so there was a need for separate switches that would only work with shoppe. This isn't the case anymore, and the '+' switches were simply kept around because they were there in pre-rewrite versions.

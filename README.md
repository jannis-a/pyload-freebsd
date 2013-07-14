pyload-freebsd
==============

This is a FreeBSD port for the current stable version (0.4.9) of pyLoad.
I made this for my FreeNAS Jail.

It has options for:
- [x] SSL support
- [x] Unpacking support
- [] JS-Enginge support (not ready yet, any help? :))
- [] GUI support (will be dropped with the next pyLoad version)

The pyLoad executable scripts (cli, core, gui) will be symlinked to /usr/local/bin.
A rc.d script for auto starting pyLoad is also included.

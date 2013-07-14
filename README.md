pyload-freebsd
==============

This is a FreeBSD port for the current stable version (0.4.9) of pyLoad.
I made this for my FreeNAS Jail.

It has options for:
* SSL support
* Unpacking support
* ~~JS-Enginge support~~ (not ready yet, any help? :))
* GUI support (will be dropped with the next pyLoad version)

The pyLoad executable scripts (cli, core, gui) will be symlinked to /usr/local/bin.
A rc.d script for auto starting pyLoad is also included.

# Installation
1. Clone this repo to your ports tree:
  * cd /usr/ports/www
  * git clone git@github.com:mrhanky17/pyload-freebsd.git pyload
2. Build the port:
  * cd pyload && make install clean
3. Enable and start pyLoad (setup will be executed if there's no pyload.conf):
  * echo 'pyload_enable="YES"' >> /etc/rc.conf
  * Optional settings (add to /etc/rc.conf):
    * pyload_config="/usr/local/etc/pyload"
    * pyload_flags="--daemon"
    * pyload_pid="/var/run/pyload.pid"
  * service pyload start

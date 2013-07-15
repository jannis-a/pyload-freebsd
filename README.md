pyload-freebsd
==============

This is a FreeBSD port for the current stable version (0.4.9) of pyLoad.
I made this for my FreeNAS Jail.

It has options for:
* SSL support
* Unpacking downloads (unrar and unzip)
* JS-Enginge support (not sure if really working, please give feedback)
* GUI support (will be dropped with the next pyLoad version)

The pyLoad executable scripts (cli, core, gui) will be symlinked to /usr/local/bin.
A rc.d script for auto starting pyLoad is also included.

# Installation
1. Make sure you have the ports tree, if not run (will take a while):
  * portsnap fetch extract
2. Clone this repo to your ports tree:
  * cd /usr/ports/www
  * git clone https://github.com/mrhanky17/pyload-freebsd.git pyload
3. Build the port:
  * cd pyload && make install clean
4. Enable and run pyLoad (if no pyload.conf exists, setup will be called first)
  * echo 'pyload_enable="YES"' >> /etc/rc.conf
  * service pyload start
5. Optional settings (add to /etc/rc.conf):
  * pyload_config="/usr/local/etc/pyload"
  * pyload_flags="--daemon"
  * pyload_pid="/var/run/pyload.pid"

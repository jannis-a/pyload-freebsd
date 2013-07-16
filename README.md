pyload-freebsd
==============

This is a FreeBSD port for the current stable version (0.4.9) of pyLoad.
I made this for my FreeNAS Jail. A rc.d script for auto starting pyLoad is included.

The following ports will be installed:
* database/py-sqlite3
* ftp/py-curl
* graphics/py-imaging
* security/py-pycrypto
* www/py-django

Optional:
* SSL support
  * security/openssl (OpenSSL should already be available on FreeBSD)
  * security/py-openssl
* Unpacking downloads
  * archivers/unrar
  * archivers/unzip
* JS-Enginge for Click'n'Load
  * lang/spidermonkey17
* Captcha solving
  * graphics/gocr
  * graphics/tesseract
  * graphics/tesseract-data

There will be the following symlinks in /usr/local/bin:
* pyload     (pyLoadCore.py)
* pyload-cli (pyLoadCli.py)
* pyload-gui (pyLoadGui.py)

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

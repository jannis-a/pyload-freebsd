pyload-freebsd
==============

This is a FreeBSD port for the current stable version (0.4.9) of pyLoad.
I made this for my FreeNAS Jail. A rc.d script for auto starting pyLoad is included.

* __Required ports or binary packages:__
  * database/py-sqlite3
  * ftp/py-curl (activate COOKIES on the configure dialog!)
  * graphics/py-imaging
  * lang/python
  * security/py-pycrypto
  * www/py-django
* __SSL support:__
  * security/py-openssl
* __Unpacking downloads:__
  * archivers/unrar
  * archivers/unzip
* __JS-Enginge for Click'n'Load:__
  * lang/spidermonkey17
* __Captcha solving:__
  * graphics/gocr
  * graphics/tesseract
  * graphics/tesseract-data

# Installation
1. __Make sure you have the ports tree, if not run (will take a while). Install git via port OR binary package__
```Shell
# portsnap fetch extract
# cd /usr/ports/devel/git && make install clean
# pkg_add -r git
```

2. __Clone my port repo to your ports tree and install it:__
```Shell
# cd /usr/ports/www
# git clone https://github.com/mrhanky17/pyload-freebsd.git pyload
# cd pyload/ && make install clean
```

3. __Enable and run pyLoad (if no pyload.conf exists, setup will be called first):__
```Shell
# echo 'pyload_enable="YES"' >> /etc/rc.conf
# service pyload start
```

4. __Optional settings (add to /etc/rc.conf):__
* pyload_config="/usr/local/etc/pyload"
* pyload_flags="--daemon"
* pyload_pid="/var/run/pyload.pid"

5. __Finished, go to the web interface or use the command line interface. :)__

## Symlinks in /usr/local/bin
```Shell
# pyload
# pyload-cli
# pyload-gui (will be obsolete in next pyLoad version, dependencies have to be installed per hand)
```

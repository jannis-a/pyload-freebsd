pyload-freebsd
==============

First, clone this port to your ports tree:
- cd /usr/ports/www
- git clone git@github.com:mrhanky17/pyload-freebsd.git pyload

Build the port:
- cd pyload && make install clean

Enable and start pyLoad (setup will be executed if there's no pyload.conf):
- echo 'pyload_enable="YES"'
- service pyload start

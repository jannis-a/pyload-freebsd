--- pyLoadCore.py	2013-07-16 18:23:06.000000000 +0200
+++ pyLoadCore.py	2013-07-16 18:23:41.000000000 +0200
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/local/bin/python
 # -*- coding: utf-8 -*-
 """
     This program is free software; you can redistribute it and/or modify
@@ -188,6 +188,7 @@
         f = open(self.pidfile, "wb")
         f.write(str(pid))
         f.close()
+        os.chmod(self.pidfile, 0660)
 
     def deletePidFile(self):
         if self.checkPidFile():
